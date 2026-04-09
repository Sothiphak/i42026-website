FROM jenkins/jenkins:lts
# Switch to root to install packages
USER root

# Update and install dependencies (removed software-properties-common)
RUN apt-get update && apt-get install -y \
    ansible \
    curl \
    unzip \
    git \
    nodejs \
    npm

# Install PHP and required extensions
RUN apt-get install -y php-cli php-xml php-mbstring php-curl php-zip php-fileinfo

# Install Composer securely
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Switch back to the Jenkins user
USER jenkins