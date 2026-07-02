# Use an official Node.js LTS image
FROM node:22-alpine

# Create application directory
WORKDIR /app

# Copy package.json first
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy application source code
COPY . .

# Expose application port
EXPOSE 3500

# Start the application
CMD ["npm", "start"]