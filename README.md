# ms_recipes

A sample web application that uses Contentful API.
It's built on Rails 7, Ruby 3, Hotwire, Tailwind, and Docker.

## Setup

Set Rails credentials master key.
See https://guides.rubyonrails.org/security.html#custom-credentials for more info.
(Master key should be hidden in real-world apps, but that's a demo, so it's okay to expose it)
```
3728c0bbf45696626cb36210d9f62ef9
```

The app lives in a docker container. Start the app with:

```
$ docker-compose build
$ docker-compose up
```

You can modify docker-compose.yml in case your local docker-compose version doesn't match.

## Design

This assignment is an opportunity to try out Hotwire and Tailwind CSS.

`RecipesController` uses Contentful API client defined in `MsApiService` (`app/services/ms_api_service.rb`) to fetch the data.
The index view uses `turbo_frame_tag` to hot-load details into the modal form. The modal itself is being managed by the Stimulus controller defined in `app/javascript/controllers/modal_controller.js`.
