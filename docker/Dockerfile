FROM continuumio/anaconda3

# update and install
RUN apt update -y && apt upgrade -y && apt install -y \
    wget \
    curl \
    git \
    python-openssl \
    xvfb \
    python-opengl \
    nodejs \
    node-gyp \
    npm \
    icewm \
    python3 \
    python3-pip

# install jupyter lab
RUN apt-get update -y && apt-get install -y \
    libgl1-mesa-glx wget curl git tmux imagemagick htop libsndfile1 nodejs npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install code server
# https://github.com/jupyterhub/jupyter-server-proxy
RUN conda install jupyter-server-proxy -c conda-forge
RUN jupyter labextension install @jupyterlab/server-proxy
RUN pip install jupyter-vscode-proxy
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server \
  --install-extension ms-python.python \
  --install-extension ms-ceintl.vscode-language-pack-ja
# RUN curl -fOL https://github.com/cdr/code-server/releases/download/v3.4.1/code-server_3.4.1_amd64.deb
# RUN dpkg -i code-server_3.4.1_amd64.deb
# RUN rm -r code-server_3.4.1_amd64.deb

# inport python library
RUN pip install opencv-python

# install R 
RUN apt-get update -y && \
    apt-get install -y \
    r-base libzmq3-dev libcurl4-openssl-dev libssl-dev
RUN Rscript -e "install.packages(c('repr', 'IRdisplay', 'IRkernel'), type = 'source')"

ARG USER_ID=1000
ARG GROUP_ID=1000
ENV USER_NAME=jovyan
RUN groupadd -g ${GROUP_ID} ${USER_NAME} && \
    useradd -d /home/${USER_NAME} -m -s /bin/bash -u ${USER_ID} -g ${GROUP_ID} ${USER_NAME}
WORKDIR /home/${USER_NAME}

USER ${USER_NAME}
ENV HOME /home/${USER_NAME}

RUN touch setup.R & \
    echo "IRkernel::installspec()" > setup.R

USER root

# ENV NB_PREFIX /
ENV DISPLAY=":1.0"

# CMD ["sh","-c", "jupyter lab --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=${NB_PREFIX}"]
