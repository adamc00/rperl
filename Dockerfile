FROM perl:5.20.3
MAINTAINER Adam Clarke <adam@clarke.id.au>

RUN cpanm -v RPerl

RUN mkdir /usr/src/rperl

# COPY . /usr/src/rperl

WORKDIR /usr/src/rperl

CMD ["rperl"]
