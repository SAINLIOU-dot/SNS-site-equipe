#!/bin/bash

# Arrête immédiatement le script si une commande échoue.
set -e

# Définit le dossier local du dépôt à mettre à jour.
REPO_DIR="${1:-$HOME/serveur/site-equipe}"

# Définit le dossier public du serveur web.
DEPLOY_DIR="${2:-/var/www/html}"

# Crée le dossier parent du dépôt s'il n'existe pas.
mkdir -p "$(dirname "$REPO_DIR")"

# Vérifie si le dépôt a déjà été cloné dans le dossier cible.
if [ -d "$REPO_DIR/.git" ]; then
  # Entre dans le dépôt existant.
  cd "$REPO_DIR"
  # Récupère les derniers changements depuis la branche develop.
  git pull origin develop
else
  # Clone le dépôt depuis GitHub dans le dossier cible.
  git clone --branch develop https://github.com/SAINLIOU-dot/SNS-site-equipe.git "$REPO_DIR"
  # Entre dans le dépôt fraîchement cloné.
  cd "$REPO_DIR"
fi

# Crée le dossier public du serveur s'il n'existe pas.
mkdir -p "$DEPLOY_DIR"

# Copie la page d'accueil dans le dossier public.
cp index.html "$DEPLOY_DIR/index.html"

# Copie la feuille de styles dans le dossier public.
cp style.css "$DEPLOY_DIR/style.css"

# Affiche un message indiquant que le déploiement est terminé.
echo "Déploiement terminé : site disponible dans $DEPLOY_DIR"
