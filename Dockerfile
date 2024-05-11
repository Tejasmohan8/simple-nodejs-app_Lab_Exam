# FROM ubuntu:18.04
# ARG DEBIAN_FRONTEND=noninteractive
# #RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//https:\/\/archive.ubuntu.com\/ubuntu\//g' /etc/apt/sources.list
# RUN sed -i 's/http:\/\/archive.ubuntu.com\//http:\/\/us.archive.ubuntu.com\//g' /etc/apt/sources.list
# RUN apt-get update -y && apt-get install -y apache2
# RUN apt-get install -y php libapache2-mod-php
# COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
# ADD . /var/www/html/
# EXPOSE 80
# ENTRYPOINT apachectl -D FOREGROUND
# Use an official Node.js image as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 3000 (assuming your Node.js application will run on port 3000)
EXPOSE 3000

# Command to start the Node.js application
CMD ["node", "index.js"]
