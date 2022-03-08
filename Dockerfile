FROM ubuntu:trusty 

ENV TERM=xterm-256color 

#Install Python runtime 
RUN apt-get update && \
    apt-get install -y \
    -o APT::Intall-Recommend=false -o APT::Install-Suggests=false \
    python python-virtualenv 

#Create virtual environment 
RUN virtualenv /appenv && \
. /appenv/bin/activate && \
pip install pip --upgrade 