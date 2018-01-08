# favobase
Add a tag to your favorite tweets.

## Ruby version
2.5.0

## System dependencies

## Configuration

## Database creation

## Database initialization

## How to run the test suite

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

1. modify secrets value
  * config/secrets.yml
  * config/mariadb.yml

copy .sample file.

2. deploy application with docker.

```
$ docker-compose build
$ docker-compose run --rm web rake db:create  
$ docker-compose run --rm web rake db:migrate
$ docker-compose up -d
```
