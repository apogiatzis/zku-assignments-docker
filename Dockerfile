FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

RUN apt update -y
RUN apt install -y curl git sudo build-essential wget zsh git-core fonts-powerline

RUN groupadd -r student -g 901 && useradd -u 901 -r -g student student
RUN usermod -aG sudo student
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# nvm environment variables
ENV HOME "/home/student"
ENV NVM_DIR "$HOME/.nvm"
ENV NODE_VERSION 16.0.0

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

RUN THEME="xiong-chiamiov"; sed -i s/^ZSH_THEME=".\+"$/ZSH_THEME=\"$THEME\"/g ~/.zshrc && source ~/.zshrc && echo "Edited line in ~/zshrc :" && cat ~/.zshrc | grep -m 1 ZSH_THEME


# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y

RUN git clone https://github.com/iden3/circom.git
RUN export PATH="$HOME/.cargo/bin:$PATH" && cd circom && cargo build --release && cargo install --path circom

RUN npm install -g snarkjs yarn

RUN chown -R student:student /home/student
RUN usermod -s $(which zsh) student

USER student
WORKDIR /home/student

ENTRYPOINT [ "/bin/zsh" ]


