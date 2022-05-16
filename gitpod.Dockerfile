FROM gitpod/workspace-base:latest


SHELL ["/bin/bash", "-c"]

RUN sudo apt update -y
RUN sudo apt install -y curl git sudo build-essential wget

RUN touch ~/.bashrc && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# nvm environment variables
ENV HOME "/home/gitpod"
ENV NVM_DIR "$HOME/.nvm"
ENV NODE_VERSION 16.0.0

# # # install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# # # add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y

RUN git clone https://github.com/iden3/circom.git
RUN export PATH="$HOME/.cargo/bin:$PATH" && cd circom && cargo build --release && cargo install --path circom

RUN npm install -g snarkjs yarn

