FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /source
ARG TARGETARCH

# 1. Installer git og klon den specifikke branch direkte fra babby.app
RUN apt-get update && apt-get install -y git
RUN git clone -b feature/NpSQL-Migration https://git.babby.app/ThatBlueMagician/SoloPlay.git .

# 2. Restore og publish projektet
RUN dotnet restore SoloPlay/Server -a $TARGETARCH
RUN dotnet publish SoloPlay/Server -a $TARGETARCH --no-restore -o /app

# 3. Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app

# Installer værktøjer til HA startup-scriptet
RUN apt-get update && apt-get install -y jq bash && rm -rf /var/lib/apt/lists/*

COPY --from=build /app .
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

# Sørg for at billed-mapperne har skriveadgang
RUN mkdir -p /app/wwwroot/img/games/counting/generated /app/wwwroot/img/games/jigsawgame/saved
RUN chmod -R 777 /app/wwwroot/img/games/counting/generated
RUN chmod -R 777 /app/wwwroot/img/games/jigsawgame/saved

EXPOSE 6968
ENTRYPOINT ["/app/run.sh"]
