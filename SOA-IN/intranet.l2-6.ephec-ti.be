$ORIGIN intranet.l2-6.ephec-ti.be.
$TTL 604800
@       IN      SOA     ns.intranet.l2-6.ephec-ti.be. admin.l2-6.ephec-ti.be. (
                        2022     ; Serial
                        3600     ; Refresh [1 h]
                        600      ; Retry [10 min]
                        86400    ; Expire [1 jour ]
                        600 )    ; Negative Cache TTL [1 h ]
;
; name servers => RR de type NS
            IN      NS      ns.intranet.l2-6.ephec-ti.be.

; name servers => RR de type A
ns          IN      A       172.16.0.3

; services web
erp         IN      A       172.16.0.4
DB          IN      A       172.16.0.5

; service cloud
ftp         IN      A       172.16.0.6