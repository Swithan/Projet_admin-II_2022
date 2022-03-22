$ORIGIN l2-6.ephec-ti.be.
$TTL 604800
@       IN      SOA     ns.l2-6.ephec-ti.be. a.leveau.students.ephec.be. (
                        2021081814           ; Serial
                        43200      ; Refresh
                        7200       ; Retry
                        2419200     ; Expire
                        86400 )    ; Negative Cache TTL
;
; name servers - NS record
@           IN      NS      ns.l2-6.ephec-ti.be.
; MX record
@			      IN      MX  10  mail

; name servers - A record
ns          IN      A       176.96.231.190


; Services Web
serverWeb	IN	    A		176.96.231.190
b2b         IN      CNAME   serverWeb
www         IN      CNAME   serverWeb

; SPF ( empêche le spoofing )
@           IN	    TXT     "v=spf1 a mx ip4:176.96.231.190 include:_spf.google.com ~all"

; Services Mail
mail        IN      A       176.96.231.190
smtp        IN      CNAME   mail
pop3        IN      CNAME   mail
imap        IN      CNAME   mail

; Services VoIP
_sip._udp	SRV     0       0       5060        sip 
_sip._tcp 	SRV     0       0       5060        sip
sip 		IN	    A	    176.96.231.190
