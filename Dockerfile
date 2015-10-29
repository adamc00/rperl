FROM perl:5.20

COPY . /usr/src/rperl
WORKDIR /usr/src/rperl
RUN cpanm .

CMD [ "bash" ]
