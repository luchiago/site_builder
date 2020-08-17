# frozen_string_literal: true

class BuildService
  def initialize(widgets, site)
    @widgets = widgets
    @site = site
    @doc = Nokogiri::HTML(base_html)
  end

  def build_html
    initial_div!
    add_widgets
    save_build!
  end

  private

  def add_widgets
    @widgets.each do |widget|
      @div.add_next_sibling(widget.render)
      @div = @doc.at_css "##{struct_id_name(widget)}"
    end
  end

  def base_html
    basic_info = @widgets.shift
    basic_info.render
  end

  def initial_div!
    @div = @doc.at_css '#banner'
  end

  def struct_id_name(widget)
    widget.class.to_s.underscore + widget.position.to_s
  end

  def save_build!
    ActiveRecord::Base.transaction do
      build = Build.create(html_build: @doc.to_html, site: @site)
      @site.update(current_build: build)
      build
    end
  end
end
