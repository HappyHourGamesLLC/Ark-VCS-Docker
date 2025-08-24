# Use a lightweight base image
FROM alpine:latest

# Install any necessary dependencies
RUN apk add --no-cache ca-certificates

# Create a non-root user for security
RUN adduser -D -s /bin/sh arkuser

# Set working directory
WORKDIR /app

# Copy the ark binary to the container
# Assuming the binary is in the same directory as the Dockerfile
COPY ark /app/ark

# Make the binary executable
RUN chmod +x /app/ark

# Create the default data directory
RUN mkdir -p /data && chown arkuser:arkuser /data

# Set environment variables with defaults
ENV ARK_PATH="/data"
ENV ARK_PORT="9000"
ENV ARK_ALLOW_DV_UPGRADE="false"
ENV ARK_ALLOW_NON_EMPTY_PATH="false"

# Expose the default port (can't use variable here)
EXPOSE 9000

# Switch to non-root user
USER arkuser

# Set the entrypoint to run the ark server with environment variables
ENTRYPOINT /app/ark server -path "$ARK_PATH" -port "$ARK_PORT" -allow_dv_upgrade "$ARK_ALLOW_DV_UPGRADE" -allow_non_empty_path "$ARK_ALLOW_NON_EMPTY_PATH"
