# Indicates that the windows:2004-amd64 image will be used as the base image.
FROM mcr.microsoft.com/windows:2004-amd64

# Metadata indicating an image maintainer.
LABEL maintainer="AlfieJ04"

# Use Powershell to install Chocolatey.
RUN Powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Set environment variables
ENV config "C:\Program Files\MetaTrader 5\Config"

# Sets a command or process that will run each time a container is run from the new image.
RUN "choco install metatrader5 -y --version=0.0.1-beta --pre"