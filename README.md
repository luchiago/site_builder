# Site Builder

This project is an API for a site builder

Endpoints documentation, with examples: [https://documenter.getpostman.com/view/6289333/T1LQi6yP?version=latest](https://documenter.getpostman.com/view/6289333/T1LQi6yP?version=latest)

## Dependencies

* Ruby 2.7.1

* Postgres 12

* Rails 6.0.3.2
* Redis 6.0
* Sidekiq 6.x

This is a dockerized application, so it’s your choice to install these dependencies locally.

## Setup

First of all, ensure that you have Docker and Docker-Compose in your machine:

```shell

$ docker --version

Docker version 19.03.12-ce

  

$ docker-compose --version

docker-compose version 1.26.2

```

If you don't have any of those two, follow this [guide for docker](https://docs.docker.com/engine/install/) and this one [for docker compose](https://docs.docker.com/compose/install/) to install in your machine

After all checking, just run `bin/docker` and everything will be prepared for you

If no errors message appeared, to run the application just execute this command:

`docker-compose up`

and start using the app in [localhost:3000/](localhost:3000)

## Rake task

To run the rake task for changing the current site build, follow these steps:

 ```shell
 docker-compose up -d
 docker-compose exec app bash
 // In the terminal of the container run
 rake current_build:change[site_id,build_id]
 ```

Don’t forget to change site id and build_id for the id of Site record and Build record.

## Tests

To run the tests, just execute:

`docker-compose --rm app bundle exec rspec`
