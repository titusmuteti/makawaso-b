# Use the official Ruby base image with the desired version
FROM ruby:2.7.6

# Set up the working directory in the Docker image
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the Docker image and install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application code into the Docker image
COPY . .

# Set the entry point to run the Rails server
ENTRYPOINT ["rails", "server", "-b", "localhost"]