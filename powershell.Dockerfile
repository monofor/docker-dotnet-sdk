FROM mcr.microsoft.com/powershell:latest

# Install curl
RUN cd tmp \
    && apt update\
    && apt install -y --no-install-recommends curl

# Install Ping, Telnet, and NTLM
RUN cd tmp \
    && curl -LOJ https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt update \
    && apt install -y inetutils-ping \
    && apt install -y inetutils-telnet \
    && apt install -y gss-ntlmssp \
    && rm -rf /var/lib/apt/lists/*

# Update OpenSSL Config for v3.x
COPY openssl.cnf /etc/ssl/openssl.cnf

# Install PowerShell Modules for Remote Connection
RUN pwsh -Command Install-Module -Name PSWSMan -Force
RUN pwsh -Command Install-WSMan