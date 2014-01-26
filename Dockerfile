FROM linux/chef-solo
MAINTAINER Andreas Fuchs <asf@boinkor.net>

CMD while true; do echo WHY ARE YOU HITTING YOURSELF; sleep 1; done

RUN /opt/chef/embedded/bin/gem install berkshelf

ADD ./Berksfile /Berksfile


RUN /opt/chef/embedded/bin/berks install --path /etc/chef/cookbooks/