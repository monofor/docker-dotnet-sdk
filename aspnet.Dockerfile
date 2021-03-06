FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
RUN apt-get update \
    && apt-get install -y --no-install-recommends libgdiplus libc6-dev \
    && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll