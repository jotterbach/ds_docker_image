FROM ubuntu:xenial

USER root

RUN apt-get update && \
    apt-get install -y python python-pip wget && \
    apt-get -y upgrade

RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev libxml2-dev libxslt1-dev

RUN pip install -U pip

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
RUN pip install --no-deps statsmodels
RUN pip install cdtw
RUN apt-get install -y python-matplotlib

RUN useradd --create-home --home-dir /home/ds --shell /bin/bash ds
RUN adduser ds sudo

RUN usermod -a -G sudo ds
RUN echo "ds ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER ds
RUN mkdir -p /home/ds/notebooks
ENV HOME=/home/ds
ENV SHELL=/bin/bash
ENV USER=ds
VOLUME /home/ds/notebooks
WORKDIR /home/ds/notebooks
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable latex_envs/latex_envs
RUN jupyter nbextension enable autosavetime/main
RUN jupyter nbextension enable equation-numbering/main
RUN jupyter nbextension enable toggle_all_line_numbers/main
RUN jupyter nbextension enable codefolding/main
RUN jupyter nbextension enable contrib_nbextensions_help_item/main
RUN jupyter nbextension enable execute_time/ExecuteTime
RUN jupyter nbextension enable chrome-clipboard/main
RUN jupyter nbextension enable toc2/main
RUN jupyter nbextension enable dragdrop/main

RUN mkdir -p /home/ds/.jupyter
ADD jupyter_notebook_config.py /home/ds/.jupyter/jupyter_notebook_config.py
