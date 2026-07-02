# Build Stage
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application source
COPY . .

ENV NODE_OPTIONS=--openssl-legacy-provider

# Build the React application
RUN npm run build

# Production Stage
FROM nginx:1.27-alpine

# Copy build files to Nginx
COPY --from=builder /app/build /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]