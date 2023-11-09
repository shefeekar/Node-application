FROM node:latest

# Create an app directory
WORKDIR /

# Copy the package.json file
COPY package.json ./

# Install the app dependencies
RUN npm install

# Copy the app source
COPY . .

# Expose  the port of the app is running  on
EXPOSE 8081

# Start the app when the container is run
CMD ["npm","start"]

