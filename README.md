# dotnet-nvm
Combined .NET SDK v6 and NVM (Node Version Manager) image for building .NET projects that include node packages such as webpack.

Usage:
```powershell
# Create new app in MyApp folder
docker run --rm -v ${PWD}:/app boeegh/dotnet-nvm dotnet new console -o MyApp -f net6.0

# Create a React app in my-react-app folder
docker run --rm -v ${PWD}:/app boeegh/dotnet-nvm npx create-react-app my-react-app
```

Please note this is an experimental image that may... explode at any time. Use with caution. Or not at all.