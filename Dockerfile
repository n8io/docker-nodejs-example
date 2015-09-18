# Defines the base image for your container. E.g. node, node:0.12.7, node:0.10.38
FROM node
MAINTAINER nate.clark@ignitionone.com

# Create a directory to hold your application
RUN mkdir /src
WORKDIR /src

# Add package.json to the /src directory so [npm install] is
# only ran when changes to this file are detected.
ADD package.json package.json

# Run npm install to build dependencies
RUN npm install

#Add the current directories contents to the container's /src directory
ADD . .

# Define the default run command. Not actually ran on [docker build].
# This command is only executed on [docker run].
CMD ["npm", "start"]