#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app
EXPOSE 5000
ENV RABBITMQ_HOST rabbitmq
ENV RABBITMQ_PORT 5672

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["TaskProcessor.csproj", "."]
RUN dotnet restore "./TaskProcessor.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "TaskProcessor.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "TaskProcessor.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TaskProcessor.dll"]