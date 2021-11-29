#!/usr/bin/env bash
docker build -t cr.monofor.com/dotnet/sdk:6.0 -f sdk.Dockerfile .
docker push cr.monofor.com/dotnet/sdk:6.0