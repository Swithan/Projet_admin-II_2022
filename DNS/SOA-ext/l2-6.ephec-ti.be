$ORIGIN l2-6.ephec-ti.be.
$TTL 604800
@       IN      SOA     ns.l2-6.ephec-ti.be. admin.ephec-ti.be. (
                        20222    ; Serial
                        3600     ; Refresh [1 h]
                        600      ; Retry [10 min]
                        86400    ; Expire [1 jour ]
                        600 )    ; Negative Cache TTL [1 h ]
;
; name servers - NS record
@           IN      NS      ns.l2-6.ephec-ti.be.

; name servers - A record
ns          IN      A       188.166.78.92


; Services Web
www       IN          A           188.166.78.92

; Services VoIP
sip             IN          A       188.166.78.92;
_sip._udp       86400	IN	SRV     10	100     5060	sip
_sip._tcp       86400	IN	SRV     10	100     5060	sip

