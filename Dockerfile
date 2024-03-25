FROM mcr.microsoft.com/dotnet/sdk:6.0 AS installer-env

# Build requires 3.1 SDK
COPY --from=mcr.microsoft.com/dotnet/core/sdk:3.1 /usr/share/dotnet /usr/share/dotnet

COPY . /src/dotnet-function-app
RUN cd /src/dotnet-function-app && \
    mkdir -p /home/site/wwwroot && \
    dotnet publish *.csproj --output /home/site/wwwroot

FROM mcr.microsoft.com/azure-functions/dotnet:4

#Create a Linux user in the container called DFM with UID and GID of 1000
RUN groupadd -r dfm --gid 1000 && \
    useradd --uid 1000 -r --gid 1000 "dfm"

# Configure the container to automatically start with the DFM user by default
USER 1000:1000 

EXPOSE 8080

# Configure the ASP HTTP web site to listen on port 8080
# This is due to the fact that non-root users aren't allow to bind to ports 1024 and below
ENV ASPNETCORE_URLS=http://*:8080
ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

# Copied files to be owned by the DFM user
COPY --chown=dfm:dfm --from=installer-env ["/home/site/wwwroot", "/home/site/wwwroot"]