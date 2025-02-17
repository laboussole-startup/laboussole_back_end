#!/bin/bash

# Chemin vers le répertoire du projet
PROJECT_DIR="/var/www/laboussole_back_end"

# Nom du service systemd (si applicable, sinon laissez vide)
SERVICE_NAME="uvicorn_laboussole"

# Naviguer dans le répertoire du projet
echo "Naviguer dans le répertoire : $PROJECT_DIR"
cd $PROJECT_DIR || { echo "Erreur : Impossible de naviguer dans $PROJECT_DIR"; exit 1; }
source env/bin/activate

# Récupérer les dernières mises à jour du dépôt
echo "Mettre à jour le dépôt avec git pull"
git pull || { echo "Erreur : git pull a échoué"; exit 1; }

# Installer les dépendances (si un fichier requirements.txt existe)
if [ -f "requirements.txt" ]; then
    echo "Installation des dépendances Python"
    pip install -r requirements.txt || { echo "Erreur : Installation des dépendances a échoué"; exit 1; }
fi

# Collecter les fichiers statiques (si applicable)
if [ -f "manage.py" ]; then
    echo "Collecte des fichiers statiques"
    python manage.py collectstatic --noinput || { echo "Erreur : Collecte des fichiers statiques a échoué"; exit 1; }
fi

# Appliquer les migrations de la base de données (si applicable)
if [ -f "manage.py" ]; then
    echo "Appliquer les migrations"
    python manage.py migrate || { echo "Erreur : Application des migrations a échoué"; exit 1; }
fi


# Redémarrer le service (si un service est configuré)
if [ -n "$SERVICE_NAME" ]; then
    echo "Redémarrage du service : $SERVICE_NAME"
    sudo systemctl restart "$SERVICE_NAME" || { echo "Erreur : Redémarrage du service a échoué"; exit 1; }
fi

echo "Mise à jour terminée avec succès !"
deactivate