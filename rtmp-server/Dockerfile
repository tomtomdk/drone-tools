# Dockerfile

FROM alfg/nginx-rtmp

# (Optional) Clean default configs
RUN rm /etc/nginx/conf.d/default.conf || true

# Copy our custom RTMP-enabled configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Create a test landing page
COPY index.html /usr/share/nginx/html/index.html
COPY stat.xsl /usr/share/nginx/html/stat.xsl


# Expose RTMP and HTTP ports
EXPOSE 1935 8080

# Add healthcheck to monitor the HTTP service
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget --spider --quiet http://localhost:8080/ || exit 1

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]