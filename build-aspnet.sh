#!/usr/bin/env bash
docker build -t cr.monofor.com/dotnet/aspnetcore-runtime:3.1 -f aspnet.Dockerfile .
docker push cr.monofor.com/dotnet/aspnetcore-runtime:3.1