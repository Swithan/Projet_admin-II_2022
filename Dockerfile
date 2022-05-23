# Utilisation d'une image d Ubuntu vers 20.04
FROM ubuntu:20.04
RUN apt-get update -y


# Installation des différents outils permettant de tester et configurer les services

RUN apt-get install -y nano telnet mutt dnsutils net-tools iputils-ping mailutils

## Certificat SSL

# Création du certificat SSL via openssl

RUN openssl req -new -x509 -days 3650 -nodes -newkey rsa:4096 -out /etc/ssl/certs/mailserver.pem -keyout /etc/ssl/private/mailserver.pem -subj "/C=BE/ST=Braban-wallon/L=Wavre/O=Ephec/OU=IT/CN=mail.l2-6.ephec-ti.be"

# ------------------- 


## Base de donnee

# Installation du serveur SQL MariaDB

RUN apt-get install -y mariadb-server

# Configuration de la base de donnée 
# Creation des tables
# Ajout des données dans les différentes tables

COPY sql/create-db.sql configuration-sql/create-db.sql
COPY sql/create-users.sql configuration-sql/create-users.sql

# -------------------

## Postfix ( SMTP )

# Installation de Postfix

RUN apt-get install -y postfix postfix-mysql

# Configuration de  Postfix
# Creation du groupe et de l'utilisateur vhosts
# Copie des différents fichiers de configuartion
# Compilation de nos fichiers via postmap

RUN groupadd -g 5000 vhosts && useradd -g vhosts -u 5000 vhosts -d /var/mail/vhosts -s /bin/false -m
COPY postfix/main.cf /etc/postfix/main.cf
COPY postfix/master.cf /etc/postfix/master.cf
COPY postfix/generic /etc/postfix/generic
COPY postfix/mysql-virtual-mailbox-domains.cf /etc/postfix/mysql-virtual-mailbox-domains.cf
COPY postfix/mysql-virtual-mailbox-maps.cf /etc/postfix/mysql-virtual-mailbox-maps.cf
COPY postfix/vmailbox /etc/postfix/vmailbox
RUN postmap /etc/postfix/vmailbox
RUN postmap /etc/postfix/generic

# -------------------

## Dovecot ( IMAP )

# Installation de dovecot ainsi que son plugin sieve

RUN apt-get install -y dovecot-core dovecot-imapd dovecot-mysql
RUN apt-get install -y dovecot-sieve dovecot-managesieved

# Configuration de Dovecot 
# Copie des différents fichiers de configuration
# Modification des droits pour la reception des mails

COPY dovecot/dovecot.conf /etc/dovecot/dovecot.conf
COPY dovecot/dovecot-sql.conf.ext /etc/dovecot/dovecot-sql.conf.ext
COPY dovecot/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
COPY dovecot/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
COPY dovecot/10-master.conf /etc/dovecot/conf.d/10-master.conf
COPY dovecot/auth-sql.conf.ext /etc/dovecot/conf.d/auth-sql.conf.ext
COPY dovecot/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf

COPY dovecot/20-lmtp.conf /etc/dovecot/conf.d/20-lmtp.conf
COPY dovecot/default.sieve /var/lib/dovecot/sieve/default.sieve
RUN sievec /var/lib/dovecot/sieve/default.sieve
RUN chown -R vhosts:vhosts /var/lib/dovecot/sieve/*
RUN chmod a+x /var/lib/dovecot

# -------------------

## Spamassassin

# Installation de Spamassasin
RUN apt-get install -y spamassassin spamc

# Creation du groupe et de l'utilisateur smapd
# Creation du dossier spamassassin pour les logs
# Copie des fichier de configuaration
RUN groupadd spamd
RUN useradd -g spamd -s /bin/false -d /var/log/spamassassin spamd
RUN mkdir /var/log/spamassassin
RUN chown spamd:spamd /var/log/spamassassin
COPY spamassassin/spamassassin /etc/default/spamassassin
COPY spamassassin/local.cf /etc/spamassassin/local.cf


# -------------------

# lancement du containeur

CMD ["sh", "-c", "service mysql start; mysql -u root < configuration-sql/create-db.sql; mysql -u root < configuration-sql/create-users.sql; service postfix start; service spamassassin start;; service dovecot start; tail -F /var/log/mail.log"]
