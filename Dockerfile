FROM ruby:latest as erb-sandbox

RUN apt update && apt install -y tree bat micro mc

# Set the working directory inside the container
WORKDIR /app

# Copy the ruby directory into the container
COPY ruby /app

RUN chmod +x *.sh

# Run the transform_templates.rb script
# CMD ["ruby", "/app/ruby/transform_templates.rb"]

CMD ["bash"]