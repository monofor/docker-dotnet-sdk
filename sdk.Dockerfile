FROM mcr.microsoft.com/dotnet/sdk:7.0

RUN curl -o install.sh https://raw.githubusercontent.com/microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh
RUN chmod +x ./install.sh
RUN ./install.sh

ENV NODE_VERSION 12.13.1
ENV NODE_DOWNLOAD_URL https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz
ENV NODE_DOWNLOAD_SHA 074a6129da34b768b791f39e8b74c6e4ab3349d1296f1a303ef3547a7f9cf9be
RUN wget "$NODE_DOWNLOAD_URL" -O nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA  nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs

# Install Node JS and NPM
RUN apt update \
    && apt install -y nodejs \
    && apt install -y npm

RUN npm -g install yarn