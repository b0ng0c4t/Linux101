#Check an SSL connection. All the certificates (including Intermediates) should be displayed
openssl s_client -connect WEBSITE:443

#Generate a new private key and Certificate Signing Request
openssl req -out CSR.csr -new -newkey rsa:2048 -nodes -keyout privateKey.key

#Generate a self-signed certificate
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.crt

#Check a Certificate Signing Request (CSR)
openssl req -text -noout -verify -in CSR.csr

#Check a private key
openssl rsa -in privateKey.key -check

#Check a certificate
openssl x509 -in certificate.crt -text -noout

#Check a PKCS#12 file (.pfx or .p12)
openssl pkcs12 -info -in keyStore.p12

#Convert to DER
openssl x509 -outform der -in certificate.pem -out certificate.der

#Convert to PKCS#12
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile CACert.crt