# Use Ubuntu for better compatibility with Linux binaries
FROM ubuntu:22.04

# Install any necessary dependencies including X11 libraries
RUN apt-get update && apt-get install -y \
    ca-certificates \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libxrandr2 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for security
RUN useradd -m -s /bin/bash arkuser

# Set working directory
WORKDIR /app

# Copy the ark binary to the container
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

# Expose the default port
EXPOSE 9000

# Switch to non-root user
USER arkuser

# Set the entrypoint to run the ark server with environment variables
ENTRYPOINT /app/ark server -path "$ARK_PATH" -port "$ARK_PORT" -allow_dv_upgrade "$ARK_ALLOW_DV_UPGRADE" -allow_non_empty_path "$ARK_ALLOW_NON_EMPTY_PATH"
