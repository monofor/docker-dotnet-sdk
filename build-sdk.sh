#!/usr/bin/env bash
docker build -t cr.monofor.com/dotnet/sdk:3.1 -f sdk.Dockerfile .
docker push cr.monofor.com/dotnet/sdk:3.1