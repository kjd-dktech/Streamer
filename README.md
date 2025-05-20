# 📺 Streamer

**Streamer** est une application simple qui vous permet de **partager l'écran de votre ordinateur Fedora** vers une **TV ou un navigateur sur le même réseau local**, en utilisant **OBS Studio** pour la capture et **VLC** pour la diffusion HTTP.

🎯 Objectif : reproduire le comportement d’un **câble HDMI sans fil**, mais en pur logiciel libre.

---

## 🖥️ Fonctionnalités

- 🎥 Capture d'écran via OBS Studio
- 📡 Diffusion via VLC (mode `cvlc`) en HTTP
- 🔁 Détection automatique d’un port disponible
- 🌐 Détection automatique de l’adresse IP locale
- 📁 Optionnel : ajout au menu GNOME
- 🧩 Livré sous forme de script ou paquet `.rpm` Fedora

---

## 📦 Installation

### Option 1 : Script seul

```bash
git clone https://github.com/kjd-dktech/streamer.git
cd Streamer
chmod +x StreamerLauncherScript.sh
./StreamerLauncherScript.sh
```

### Option 2 : Paquet RPM

[Télécharger le rpm](https://github.com/kjd-dktech/Streamer/RPMversion/streamer-1.0-1fc41.noarch.rpm) puis installer-le : 

```bash
sudo dnf install ./RPMversion/streamer-1.0-1.noarch.rpm
```
Ensuite, recherchez “Streamer” dans votre menu GNOME.

## 🧰 Prérequis

Avant de lancer l'application, vous devez avoir installé obs-studio, vlc et net-tools.<br>
Si ce n'est pas le cas : 
```bash
sudo dnf install obs-studio vlc net-tools
```


## ▶️ Utilisation

Lancez le script ou l’application, puis :

1. OBS Studio se lance automatiquement.

2. Configurez OBS pour enregistrer votre écran vers le fichier /tmp/screen.mp4.

3. Démarrez l’enregistrement dans OBS.

4. Le script lance VLC pour diffuser le fichier.

5. Une URL comme http://192.168.1.42:8082 s’affiche.

6. Ouvrez cette URL sur votre TV ou autre (via navigateur).


## 🧪 Exemple de session

```bash
📁 Fichier d'enregistrement attendu : /tmp/screen.mp4
✅ Port libre trouvé : 8082
📺 Ouvre ce lien sur ta TV :
➡️  http://192.168.1.42:8082
```

## 🖱️ Ajout au menu GNOME (automatique)

Si vous utilisez le script, il vous demandera si vous souhaitez l’ajouter au menu GNOME.
Si vous installez le `.rpm`, le raccourci sera automatiquement ajouté.



## 📄 Contenu du projet

├── Docs
│   ├── PDF_Doc.pdf
│   └── WEB_Doc.html
├── License.txt
├── README.md
├── RPMversion
│   ├── Streamer-1.0-1.fc41.noarch.rpm
│   ├── streamer.desktop
│   ├── streamer.sh
│   └── streamer.spec
└── StreamerLauncherScript.sh


## 🔒 Remarques de sécurité

Le flux vidéo est transmis en HTTP non chiffré.
Utilisez uniquement ce système sur un réseau local de confiance (LAN).


## 📢 À venir

* Interface graphique simple (GTK ?)

* Compatibilité réseau 10.x.x.x

* Ajout d'un mot de passe (auth HTTP)

* Paquet Flatpak


## 🧑‍💻 Auteur

Développé par [Kodjo Jean DEGBEVI]
Licence : MIT


## 📬 Contributions

Pull requests bienvenues !
