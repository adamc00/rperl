FROM perl:5.20.3
MAINTAINER Adam Clarke <adam@clarke.id.au>

RUN cpanm -v RPerl

RUN mkdir /usr/src/rperl

COPY script/ /usr/src/rperl

WORKDIR /usr/local/lib/perl5/site_perl/5.20.3

CMD ["/bin/bash"]

RUN apt-get update && apt-get install -y vim
