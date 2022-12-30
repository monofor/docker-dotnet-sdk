FROM mcr.microsoft.com/dotnet/aspnet:7.0

# Install curl
RUN cd tmp \
    && apt update\
    && apt install -y --no-install-recommends curl

# Install Microsoft Package Repository
RUN cd tmp \
    && curl -LOJ https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt update

RUN apt install -y powershell

# libplus for System Drawing
# net-tools for netstat command
# inetutils-ping for ping command
# inetutils-telnet for ping telnet
RUN apt install -y --no-install-recommends libgdiplus libc6-dev net-tools inetutils-ping inetutils-telnet gss-ntlmssp \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll

# Enable OpenSSL Legacy Providers by Config
COPY openssl.cnf /etc/ssl/openssl.cnf

RUN pwsh -Command Install-Module -Name PSWSMan -Force
RUN pwsh -Command Install-WSMan