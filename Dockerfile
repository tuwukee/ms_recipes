# syntax=docker/dockerfile:1
FROM ruby:3.0.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client libpq-dev --no-install-recommends
ENV RAILS_ROOT /mc_recipes
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

ENV BUNDLE_PATH /mc_recipes_gems
ENV GEM_PATH /mc_recipes_gems
ENV GEM_HOME /mc_recipes_gems

COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle check || bundle install
RUN mkdir -p ./tmp/pids

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
