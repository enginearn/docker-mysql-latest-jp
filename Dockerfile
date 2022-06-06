FROM mysql:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install locales-all

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

COPY mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf
