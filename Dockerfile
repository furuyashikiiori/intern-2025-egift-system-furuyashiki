# syntax=docker/dockerfile:1
# check=error=true

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.4
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

# Rails app lives here
WORKDIR /usr/src/intern-egift-system

# Install base packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        less \
        libjemalloc2 \
        libvips \
        libyaml-dev \
        libpq-dev \
        postgresql-client \
        pkg-config \
        nodejs \
        netcat-openbsd \
        yarn && \
    rm -rf /var/lib/apt/lists/*

# Set development environment
ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle"

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# Entrypoint prepares the database.
ENTRYPOINT ["./bin/docker-entrypoint"]

# Start server via Thruster by default, this can be overwritten at runtime
EXPOSE 3000

# Start server via Thruster by default, this can be overwritten at runtime
CMD ["./bin/thrust", "./bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
