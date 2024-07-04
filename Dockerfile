# Use the official Node.js image as the base image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React application
RUN npm run build

# Install a web server to serve the static files
RUN npm install -g serve

# Expose the port the app runs on
EXPOSE 8080

# Command to run the web server
CMD ["serve", "-s", "build", "-l", "8080"]

