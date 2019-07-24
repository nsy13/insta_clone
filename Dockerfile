FROM ruby:2.5
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /insta_clone
WORKDIR /insta_clone
COPY Gemfile /insta_clone/Gemfile
COPY Gemfile.lock /insta_clone/Gemfile.lock
RUN bundle install
COPY . /insta_clone

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]