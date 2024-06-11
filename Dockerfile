
# erby
FROM ruby:latest as erby
WORKDIR /app
COPY ruby /app
RUN chmod +x *.sh && ./run-transform.sh


# erb-sandbox
FROM ubuntu:latest as erb-sandbox
WORKDIR /app
COPY --from=erby /app/transformed /app
CMD [ "bash" ]