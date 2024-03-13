# Use the latest LTS version of Jenkins base image
FROM jenkins/jenkins:lts

# Switch to root user for installing dependencies
USER root

# Update package manager and install required dependencies including Docker
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
        https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
        | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    # Add jenkins user to the docker group
    usermod -aG docker jenkins && \
    # Clean up unnecessary files and packages to reduce image size
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to jenkins user
USER jenkins

