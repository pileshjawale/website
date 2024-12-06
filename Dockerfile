# Use the official Ubuntu base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html

# Update the package list and install Apache2
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose port 80 for the web server
EXPOSE 80

# Start Apache2 service
CMD ["apache2ctl", "-D", "FOREGROUND"]
