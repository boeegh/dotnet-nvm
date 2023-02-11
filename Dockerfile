FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 18
RUN mkdir $NVM_DIR

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash ;

RUN bash -c 'source $NVM_DIR/nvm.sh && \
  nvm install 14 && \
  nvm install 16 && \
  nvm install $NODE_VERSION && \
  nvm use $NODE_VERSION && \
  nvm alias default $NODE_VERSION'

RUN printf "#!/bin/bash \
  \nsource \$NVM_DIR/nvm.sh \
  \n\$@\n" > /entry.sh && chmod +x /entry.sh

RUN cat /entry.sh
WORKDIR /app
ENTRYPOINT ["/entry.sh"]