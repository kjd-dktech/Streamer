#!/bin/bash

FILE="/tmp/screen.mp4"
PORT=8080

echo "🖥️  Lancement du partage d'écran avec OBS + VLC"
echo "📁 Fichier d'enregistrement attendu : $FILE"

# ✅ Vérification si VLC est installé
if ! command -v cvlc >/dev/null; then
    echo "❌ VLC (cvlc) n'est pas installé. Installe-le avec :"
    echo "sudo dnf install vlc"
    exit 1
fi

# ✅ Vérification si OBS est installé
if ! command -v obs >/dev/null; then
    echo "❌ OBS n'est pas installé. Installe-le avec :"
    echo "sudo dnf install obs-studio"
    exit 1
fi

# ✅ Trouve l'adresse IP locale
IP=$(ip -4 addr show | grep -oP '(?<=inet\s)192\.168\.\d+\.\d+' | head -n 1)

if [ -z "$IP" ]; then
    echo "❌ Impossible de trouver une IP locale (192.168.x.x)"
    echo "Assure-toi que tu es connecté à un réseau local."
    exit 1
fi



# ✅ Lance OBS s'il n'est pas déjà en cours d'exécution
if ! pgrep -x "obs" > /dev/null; then
    echo "🚀 Lancement d'OBS..."
    nohup obs > /dev/null 2>&1 &
    # Vérification si OBS a bien démarré
    if ! pgrep -x "obs" > /dev/null; then
        echo "❌ Échec du lancement d'OBS."
        exit 1
    else
        echo "✅ OBS lancé avec succès."
    fi
else
    echo "✅ OBS est déjà en cours d'exécution."
fi


# ✅ Attend que le fichier soit créé
echo "⏳ En attente de l'enregistrement dans OBS..."
while [ ! -f "$FILE" ]; do
    sleep 5
done

echo "✅ Fichier détecté : $FILE !"



# ✅ Vérifie si le port est déjà utilisé et trouve un port libre
while netstat -tuln | grep ":$PORT" > /dev/null; do
    echo "❌ Port $PORT occupé. Recherche d’un port libre..."
    PORT=$((PORT + 2))
done

echo "✅ Port libre trouvé : $PORT"
echo ""



# ✅ Lance VLC pour diffuser en HTTP
cvlc "$FILE" --sout "#standard{access=http,mux=ts,dst=:$PORT}" --loop &

sleep 7
# Vérification si VLC a bien démarré
if ! pgrep -x "cvlc" > /dev/null; then
    echo "❌ Échec du lancement de VLC."
    exit 1
else
    echo "✅ VLC lancé avec succès pour diffuser sur http://$IP:$PORT"
fi

echo ""
echo "📺 Ouvre ce lien sur ta TV ou ton navigateur :"
echo "➡️  http://$IP:$PORT"
