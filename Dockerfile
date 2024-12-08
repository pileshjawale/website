FROM ubuntu:latest
WORKDIR /var/www/html
COPY . /var/www/html
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 8081
CMD ["apache2ctl", "-D", "FOREGROUND"]
