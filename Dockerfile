FROM ubuntu:trusty 

ENV TERM=xterm-256color 

RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list 

#Install Python runtime 
RUN apt-get update && \
    apt-get install -y \
    -o APT::Intall-Recommend=false -o APT::Install-Suggests=false \
    python python-virtualenv 

#Create virtual environment 
#RUN virtualenv /appenv && \
#. /appenv/bin/activate && \
#pip install pip --upgrade 

#Add entrypoint script 
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]