FROM jenkins/jenkins:2.158

USER root

ENV TZ=America/Lima

RUN apt-get -y update \
 && apt-get -y install apt-transport-https gnupg2 software-properties-common apt-utils \
 && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
 && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 93C4A3FD7BB9C367 \
 && apt-get -y update \
 && apt-get -y install docker-ce \
 && usermod -aG docker jenkins \
 && apt-get -y upgrade \
 && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
USER jenkins
