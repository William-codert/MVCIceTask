# Use the official ASP.NET runtime as the base image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 5000

# Use the SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# Copy the .csproj and restore dependencies
COPY ["MVCIceTask/MVCIceTask.csproj", "MVCIceTask/"]
RUN dotnet restore "MVCIceTask/MVCIceTask.csproj"

# Copy everything else and build
COPY . .
WORKDIR "/src/MVCIceTask"
RUN dotnet build "MVCIceTask.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Publish the app
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "MVCIceTask.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Final image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Set entry point to run the app
ENTRYPOINT ["dotnet", "MVCIceTask.dll"]
