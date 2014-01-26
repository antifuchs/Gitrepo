FROM linux/chef-solo
MAINTAINER Andreas Fuchs <asf@boinkor.net>

ADD ./Berksfile Berksfile
ADD ./Thorfile Thorfile

RUN /opt/chef/embedded/bin/thor berkshelf:install --path /etc/chef/cookbooks/

RUN echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise main restricted universe' >> /etc/apt/sources.list.d/moar.list
RUN echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise-security main restricted universe' >> /etc/apt/sources.list.d/moar.list
RUN echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise-updates main restricted universe' >> /etc/apt/sources.list.d/moar.list

RUN apt-get -y update
RUN apt-get -y install sudo

ADD ./Rakefile Rakefile
RUN env PATH=$PATH:/opt/chef/embedded/bin rake chef:prepare

RUN chef-solo --override-runlist 'role[box]'

CMD while true; do echo "WHY ARE YOU HITTING YOURSELF"; sleep 1; done