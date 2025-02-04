# Use Node.js as the base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React app
RUN npm run build

# Install a lightweight web server (serve)
RUN npm install -g serve

# Expose port 3000 inside the container
EXPOSE 3000

# Define the local port environment variable
ENV PORT=3000

# Start the app using serve
CMD ["serve", "-s", "build", "-l", "3000"]
