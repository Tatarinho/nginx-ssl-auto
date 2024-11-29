FROM nginx:alpine

# Instalacja openssl
RUN apk add --no-cache openssl

# Utworzenie katalogu na certyfikaty
RUN mkdir -p /etc/nginx/ssl

# Generowanie self-signed certyfikatu
RUN openssl req -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=PL/ST=State/L=City/O=Organization/CN=localhost"

# Kopiowanie konfiguracji nginx
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]