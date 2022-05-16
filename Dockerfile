FROM ubuntu:latest
RUN apt-get update -y

# Installation des outils
RUN apt-get install -y nano telnet mutt

# Installation de la DB ( MariaDB )
RUN apt-get install -y mariadb-server

#  Configuartion de la DB
COPY config-db/db.sql config-db/db.sql
COPY config-db/mail-data.sql config-db/mail-data.sql

# Installation de Postif ( SMTP )
RUN apt-get install -y postfix postfix-mysql

# Installation de Dovecot ( IMAP )
RUN apt-get install -y dovecot-core dovecot-imapd dovecot-mysql
RUN apt-get install -y dovecot-sieve dovecot-managesieved