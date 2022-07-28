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
@                       IN      MX  10  mail

; name servers - A record
ns          IN      A       176.96.231.189


; Services Web
serverWeb       IN          A           188.166.78.92
b2b         IN      CNAME   serverWeb
www         IN      CNAME   serverWeb

; Service Web secu Arnaud
serverWebArnaud       IN          A          82.165.248.136
secu IN      CNAME   serverWebArnaud

; SPF
@           IN      TXT     "v=spf1 a:mail.l2-6.ephec-ti.be  mx:mail.l2-6.ephec-ti.be  ip4:82.165.248.136  ~all"

;DMARC
_dmarc           IN      TXT   "v=DMARC1; p=reject;pct=100;sp=reject;adkim=s;aspf=s;rua=mailto:a.leveau@students.ephec-ti.be;ruf=mailto:a.leveau@students.ephec-ti.be;"

;DKIM
default._domainkey      IN      TXT     ( "v=DKIM1; h=sha256; k=rsa; "
          "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAox/Q3g6/1LLhTA/zdwHjrFG3RHy2QkOk+LKm9r9ql24Z7RVszq/o4+VM17uUGkP5qHnwMVHJXcPSIJPrQDSsb/B9MUYdsZR5M+2bA7xDRywC5qBEvlI6Yv4Ps7igcG4RNzOEXKxUtyVjEpwLUbgBdKh9BCSODousB7h2UHkiN1fyBnRmjx8VRHQntEC6Y3WjkeGWqP1r2xPT/G"
          "w4pigIkhAOhm8w/6hknUlVcxWG0kBOyvg0xDAOQzkomr4PXiD3+gBFLhoBHrSBWaahOHniS3LoQfeuq2qCUaR+cJaCqV2IJQykE6V5N5v34eayxVyyrqBru7hLxioY3onLVt2u3wIDAQAB" )
; Services Mail
mail        IN      A       82.165.248.136
smtp        IN      CNAME   mail
pop3        IN      CNAME   mail
imap        IN      CNAME   mail


; PTR serveur mail
136.248.165.82.in-addr.arpa. IN PTR mail.l2-6.ephec-ti.be

; Services VoIP
sip             IN          A       188.166.78.92;
_sip._udp       86400	SRV     10       100       5060        sip
_sip._tcp       86400	SRV     10       100       5060        sip


