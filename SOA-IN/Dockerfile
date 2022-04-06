#Initialisation à partir de l'image resystit/bind9
FROM resystit/bind9

# Ajout de packages
RUN apk update && apk add curl vim wget nano bash openrc --no-cache

#Copie des fichiers de configuration
COPY named.conf /etc/bind/named.conf
COPY intranet.l2-6.ephec-ti.be /etc/bind/intranet.l2-6.ephec-ti.be
COPY reverse /etc/bind/reverse

#Commande effectuée au démarrage du conteneur
CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]