# ============================================
# Stage 1: Build / Prepare static assets
# ============================================
FROM node:20-alpine AS builder

WORKDIR /app

# Copy all static site files
COPY index.html .
COPY styles.css .
COPY script.js .

# Validate files exist (optional health check for build)
RUN test -f index.html && test -f styles.css && test -f script.js

# ============================================
# Stage 2: Production - Serve with nginx
# ============================================
FROM nginx:alpine

# Remove default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy built assets from builder stage
COPY --from=builder /app /usr/share/nginx/html/

# Copy custom nginx config (optional - for SPA routing if needed)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
