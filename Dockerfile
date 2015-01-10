FROM ubuntu:trusty
MAINTAINER Nikola Krzalic <nikola@krzalic.com>
# get all the pre-requisites
RUN apt-get update
RUN apt-get install -y qt4-qmake libqt4-dev libpq5 libpq-dev wget curl

#accept the gpg signature required for rvm and install everything
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.3
RUN /bin/bash -l -c "gem install rails -v 4.1.6"
#Prepare the working environment
RUN mkdir -p /var/www/zenforms
VOLUME ["/var/www/zenforms"]
WORKDIR /var/www/zenforms
RUN /bin/bash -l -c "wget https://raw.githubusercontent.com/asm-products/zenforms/master/Gemfile"
RUN /bin/bash -l -c "bundle install"
