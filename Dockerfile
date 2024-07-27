# Use the official Node.js image for building the application.
FROM node:14 AS builder

# Set the working directory in the container.
WORKDIR /app

# Copy package.json and install dependencies.
COPY package*.json ./
RUN npm install

# Copy the rest of the application code.
COPY . .

# Build the application (if applicable, e.g., for React or Angular apps)
# RUN npm run build

# Use a smaller base image for the runtime environment.
FROM node:14-slim

# Install Docker in the runtime environment.
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://get.docker.com | sh

# Set the working directory in the container.
WORKDIR /app

# Copy only the necessary files from the builder stage.
COPY --from=builder /app /app

# Expose port and start the application.
EXPOSE 3000
CMD ["npm", "start"]
