# Use the official Node.js image.
FROM node:14

# Set the working directory in the container.
WORKDIR /app

# Copy package.json and install dependencies.
COPY package*.json ./
RUN npm install

# Copy the rest of the application code.
COPY . .

# Expose port and start the application.
EXPOSE 3000
CMD ["npm", "start"]
