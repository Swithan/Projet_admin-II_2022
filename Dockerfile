FROM ubuntu:latest
RUN apt-get update -y

# Installation des outils
RUN apt-get install -y nano telnet mutt

# Installation de la DB ( MariaDB )
RUN apt-get install -y mariadb-server

#  Configuartion de la DB
COPY config-db/db.sql config-db/db.sql
COPY config-db/mail-data.sql config-db/mail-data.sql

# Installation de Postfix ( SMTP )
RUN apt-get install -y postfix postfix-mysql

# Ajout configuration Postfix
RUN groupadd -g 5000 vhosts && useradd -g vhosts -u 5000 vhosts -d /var/mail/vhosts -s /bin/false -m
COPY config-postfix/main.cf /etc/postfix/main.cf
COPY config-postfix/mysql-virtual-mailbox-domains.cf /etc/postfix/mysql-virtual-mailbox-domains.cf
COPY config-postfix/mysql-virtual-mailbox-maps.cf /etc/postfix/mysql-virtual-mailbox-maps.cf

# Installation de Dovecot ( IMAP )
RUN apt-get install -y dovecot-core dovecot-imapd dovecot-mysql
RUN apt-get install -y dovecot-sieve dovecot-managesieved