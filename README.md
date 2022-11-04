# ms_recipes

A sample web application that uses Contentful API.
It's built on Rails 7, Ruby 3, Hotwire, Tailwind, and Docker.

## Setup

The app lives in a docker container. Start the app with:

```
docker-compose build
docker-compose up
```

## Tests

Start the tests with:
```
docker-compose run web bundle exec rspec spec
```
