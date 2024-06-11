FROM ruby:latest as erby

# Set the working directory inside the container
WORKDIR /app

# Copy the ruby directory into the container
COPY ruby /app

RUN chmod +x *.sh && ./run-transform.sh

FROM ubuntu:latest as erb-sandbox

WORKDIR /app

COPY --from=erby /app/transformed /app

CMD [ "bash" ]