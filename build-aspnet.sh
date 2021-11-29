#!/usr/bin/env bash
docker build -t cr.monofor.com/dotnet/aspnet:6.0 -f aspnet.Dockerfile .
docker push cr.monofor.com/dotnet/aspnet:6.0