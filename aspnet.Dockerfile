FROM mcr.microsoft.com/dotnet/aspnet:6.0

# libplus for System Drawing
# net-tools for netstat command
# iputils-ping for ping command
# telnet for ping telnet
RUN apt-get update \
    && apt-get install -y --no-install-recommends libgdiplus libc6-dev net-tools iputils-ping telnet \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll