FROM ubuntu:14.04
MAINTAINER Henrik Wallström <henrik@wallstroms.nu>

# Get up-to-date
RUN apt-get update

# Install MongoDB
# TODO: MongoDB should be linked instead
RUN apt-get install -y mongodb
VOLUME /data/db

# Get Teamwall prerequisites
RUN apt-get install -y openjdk-7-jdk wget unzip

# Get Teamwall
# TODO: fetch prebuilt JAR instead
RUN wget https://github.com/teamwall/teamwall/archive/develop.zip -P /data/

# Teamwall dev prerequisites
RUN apt-get install -y git nodejs npm

RUN ln -s /usr/bin/nodejs /usr/bin/node

# Install Leiningen
RUN /usr/bin/wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -P ~/bin/
RUN chmod +x ~/bin/lein
RUN echo 'export PATH=~/bin/:$PATH' | tee -a ~/.bashrc

# Set-up teamwall
RUN npm install -g bower
RUN unzip /data/develop.zip -d /data/

WORKDIR /data/teamwall-develop

RUN export LEIN_ROOT=yes && ~/bin/lein cljsbuild once
RUN export LEIN_ROOT=yes && bower install --allow-root

EXPOSE 3000

#CMD [ "~/bin/lein", "run"]

COPY teamwall.sh /data/teamwall-develop/teamwall.sh
RUN chmod u+x /data/teamwall-develop/teamwall.sh
CMD [ "/bin/bash", "./teamwall.sh"]
