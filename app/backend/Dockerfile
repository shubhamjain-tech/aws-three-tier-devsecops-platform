# Use official Node.js LTS image
FROM node:20-alpine

# Metadata
LABEL maintainer="Shubham Jain"
LABEL project="aws-three-tier-devsecops-platform"
LABEL component="backend"

# Create application directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install only production dependencies
RUN npm ci --omit=dev

# Copy application source
COPY . .

# Create a non-root user
RUN addgroup -S appgroup && \
    adduser -S appuser -G appgroup && \
    chown -R appuser:appgroup /app

USER appuser

# Application Port
EXPOSE 3500

# Health Check
HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
CMD wget --no-verbose --tries=1 --spider http://localhost:3500/healthz || exit 1

CMD ["npm","start"]