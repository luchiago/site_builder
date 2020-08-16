# frozen_string_literal: true

class CreateWidgetService
  def initialize(site_params)
    @site_params = site_params
    @widgets = []
  end

  def perform
    create_widgets
    order_widgets!
    add_basic_info!
    @widgets
  end

  private

  def create_widgets
    @site_params.each_with_object(@widgets) do |(key, value), acc|
      struct_class = Struct.const_get(key.to_s.classify)
      associate_to_struct(struct_class, value, acc) unless key == :basic_info
    end
  end

  def order_widgets!
    @widgets.sort_by!(&:position)
  end

  def add_basic_info!
    basic_info = create_struct(BasicInfo, @site_params[:basic_info])
    @widgets.unshift(basic_info)
  end

  def associate_to_struct(struct_class, value, acc)
    if value.instance_of?(Array)
      acc.push(*multiple_widgets(struct_class, value))
    else
      acc.push(create_struct(struct_class, value))
    end
  end

  def multiple_widgets(struct_class, array_of_widgets)
    array_of_widgets.map { |params| create_struct(struct_class, params) }
  end

  def create_struct(struct_class, params)
    struct_class.new(params)
  end
end
