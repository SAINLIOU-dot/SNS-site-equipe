# Utilise l'image officielle Nginx dans sa variante Alpine légère.
FROM nginx:alpine

# Copie les pages et la feuille de style dans le dossier servi par Nginx.
COPY index.html style.css contact.html /usr/share/nginx/html/

# Copie les ressources du site, notamment le logo, dans l'image.
COPY img/ /usr/share/nginx/html/img/

# Documente le port HTTP utilisé par Nginx dans le conteneur.
EXPOSE 80
