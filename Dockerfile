# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /my-app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire React.js project to the container
COPY . .

# Build the React.js application
RUN npm run build

# Set the command to run the built application
CMD ["npm", "run", "start"]
# testing


