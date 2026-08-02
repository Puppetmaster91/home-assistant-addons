FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /source
ARG TARGETARCH

COPY . .
RUN dotnet restore SoloPlay/Server -a $TARGETARCH
RUN dotnet publish SoloPlay/Server -a $TARGETARCH --no-restore -o /app

FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app

# Installer værktøjer til HA startup script
RUN apt-get update && apt-get install -y jq bash && rm -rf /var/lib/apt/lists/*

COPY --from=build /app .
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

RUN chmod -R 777 /app/wwwroot/img/games/counting/generated 2>/dev/null || true
RUN chmod -R 777 /app/wwwroot/img/games/jigsawgame/saved 2>/dev/null || true

EXPOSE 6968
ENTRYPOINT ["/app/run.sh"]
