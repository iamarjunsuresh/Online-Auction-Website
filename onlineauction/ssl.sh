openssl genrsa -des3 -out server.orig.key 2048
openssl rsa -in server.orig.key -out server.key
openssl req -new -key server.key -out server.csr
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
echo "127.0.0.1 localhost.ssl" | sudo tee -a /etc/hosts
rails server puma -b 'ssl://0.0.0.0:3000?key=server.key&cert=server.crt&mode=peer'
