# 🌲 WoodWideWeb - Galerie AR

Galerie de réalité augmentée avec détection de 24 œuvres d'art via MindAR.

## 🌐 Accès en ligne

**URL de la galerie :** https://epure.github.io/woodwideweb/

Scannez le QR code avec votre smartphone pour accéder directement à l'expérience AR :

[QR Code sera généré automatiquement vers l'URL ci-dessus]

## 📱 Comment utiliser

1. **Ouvrez l'URL** sur votre smartphone
2. **Autorisez l'accès à la caméra** quand demandé
3. **Pointez vers une œuvre** numérotée de 01 à 24
4. **La vidéo AR s'affiche** automatiquement !

## 📁 Structure du repository

```
woodwideweb/
├── index.html          # Application AR principale
├── targets.mind        # Fichier de détection MindAR (24 images compilées)
├── images/             # Images marqueurs sources (optionnel, pour référence)
│   ├── 01.jpeg
│   ├── 02.jpeg
│   └── ... (jusqu'à 24.jpeg)
└── README.md          # Ce fichier
```

## 🚀 Déploiement sur GitHub Pages

### Configuration initiale

1. **Clonez ce repository** :
   ```bash
   git clone https://github.com/epure/woodwideweb.git
   cd woodwideweb
   ```

2. **Ajoutez vos fichiers** :
   ```bash
   # Ajoutez index.html et targets.mind
   git add index.html targets.mind
   git commit -m "Initial commit: AR gallery"
   git push origin main
   ```

3. **Activez GitHub Pages** :
   - Allez dans `Settings` → `Pages`
   - Source : `Deploy from a branch`
   - Branch : `main` / `root`
   - Cliquez sur `Save`

4. **Attendez le déploiement** (1-2 minutes)
   - L'URL sera : https://epure.github.io/woodwideweb/

### Mises à jour

Pour mettre à jour la galerie :

```bash
# Modifier vos fichiers localement
# Puis :
git add .
git commit -m "Update: description des changements"
git push origin main
```

Le site se mettra à jour automatiquement en 1-2 minutes.

## 🎬 Configuration actuelle

### Vidéo
- **URL actuelle** : Vidéo unique hébergée sur Cloudinary
- Toutes les 24 œuvres affichent la même vidéo (test)
- Format : MP4, 720p, ratio 1:1 (carré)

### Images marqueurs
- **Nombre** : 24 images (01.jpeg → 24.jpeg)
- **Format** : Carré (1:1)
- **DPI recommandé** : 300+
- **Impression** : Minimum 20x20 cm pour détection optimale

### Paramètres MindAR
```javascript
maxTrack: 1              // Une seule image détectée à la fois
filterMinCF: 0.001       // Stabilité du tracking
filterBeta: 100          // Réactivité
missTolerance: 15        // Tolérance avant perte de détection
warmupTolerance: 5       // Frames avant confirmation détection
```

## 🔄 Passer aux vidéos individuelles

Quand vous aurez vos 24 vidéos finales :

### Option 1 : Vidéos sur Cloudinary (recommandé)

1. **Uploadez vos 24 vidéos** sur Cloudinary

2. **Modifiez `index.html`** :
   ```html
   <!-- Remplacez la section <a-assets> -->
   <a-assets>
       <video id="video-01" src="https://res.cloudinary.com/.../WoodWideWeb_01.mp4" ...></video>
       <video id="video-02" src="https://res.cloudinary.com/.../WoodWideWeb_02.mp4" ...></video>
       <!-- ... jusqu'à 24 -->
   </a-assets>
   
   <!-- Remplacez src="#shared-video" par les IDs individuels -->
   <a-entity mindar-image-target="targetIndex: 0">
       <a-video src="#video-01" ...></a-video>
   </a-entity>
   ```

3. **Committez et pushez** :
   ```bash
   git add index.html
   git commit -m "Update: vidéos individuelles pour chaque œuvre"
   git push origin main
   ```

### Option 2 : Vidéos dans le repository

⚠️ **Attention** : GitHub a une limite de 100 MB par fichier

Si vos vidéos sont < 100 MB chacune :

1. **Créez un dossier `videos/`** :
   ```bash
   mkdir videos
   ```

2. **Ajoutez vos vidéos** :
   ```bash
   cp WoodWideWeb_*.mp4 videos/
   ```

3. **Modifiez `index.html`** :
   ```html
   <video id="video-01" src="./videos/WoodWideWeb_01.mp4" ...></video>
   ```

4. **Committez** (peut prendre du temps) :
   ```bash
   git add videos/
   git commit -m "Add: all 24 videos"
   git push origin main
   ```

## 📊 Compilation du fichier targets.mind

Le fichier `targets.mind` contient les 24 images compilées pour la détection AR.

### Créer/Mettre à jour targets.mind

**En ligne (recommandé) :**

1. Allez sur : https://hiukim.github.io/mind-ar-js-doc/tools/compile/

2. **IMPORTANT** : Uploadez vos images **dans l'ordre** :
   ```
   01.jpeg (sera targetIndex: 0)
   02.jpeg (sera targetIndex: 1)
   ...
   24.jpeg (sera targetIndex: 23)
   ```

3. Cliquez sur "Start"

4. Téléchargez `targets.mind`

5. Remplacez le fichier dans le repository :
   ```bash
   git add targets.mind
   git commit -m "Update targets.mind"
   git push origin main
   ```

**En local :**

```bash
# Installer le compilateur
npm install -g mind-ar

# Compiler (dans le dossier images/)
cd images
mind-ar-compiler -i 01.jpeg 02.jpeg ... 24.jpeg -o ../targets.mind
```

## 🖨️ Impression des marqueurs

Pour une détection optimale :

### Spécifications
- **Taille** : Minimum 20x20 cm (30x30 cm recommandé)
- **DPI** : 300 ou plus
- **Support** : Papier mat (éviter brillant)
- **Montage** : Support rigide (carton plume, dibond)

### Éclairage
- Lumière uniforme et diffuse
- Éviter les reflets directs
- Pas de contre-jour

### Positionnement
- Surface plane verticale
- Hauteur des yeux
- Distance optimale : 30-50 cm du smartphone

## 🔧 Dépannage

### Le site ne se charge pas
- Vérifiez que GitHub Pages est activé dans Settings
- Attendez 2-3 minutes après le push
- Videz le cache navigateur (Ctrl+F5)

### targets.mind trop lourd
- Fichier > 150 MB peut causer des problèmes
- Solution : Diviser en plusieurs pages (6-8 images par page)

### Images non détectées
- Vérifiez DPI de l'image (≥ 300)
- Améliorez le contraste
- Imprimez plus grand
- Vérifiez l'éclairage

### Vidéo ne se charge pas
- Vérifiez l'URL Cloudinary
- Testez sur 3G/4G/Wi-Fi
- Vérifiez la console navigateur (F12)

## 📱 Compatibilité

### Navigateurs supportés
- ✅ Safari iOS 11.3+
- ✅ Chrome Android 67+
- ✅ Firefox Android
- ✅ Samsung Internet

### Non supportés
- ❌ Navigateurs desktop (pas de caméra AR)
- ❌ iOS Chrome (limitations WebRTC)

## 📈 Analytics (optionnel)

Pour suivre l'utilisation, ajoutez Google Analytics dans `index.html` :

```html
<head>
  <!-- ... -->
  
  <!-- Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'GA_MEASUREMENT_ID');
  </script>
</head>
```

## 🎨 Personnalisation

### Changer les couleurs de chargement

Dans `index.html`, modifiez le CSS :

```css
#loading-screen {
    background: linear-gradient(135deg, #VOTRE_COULEUR1 0%, #VOTRE_COULEUR2 100%);
}

.logo {
    color: #VOTRE_COULEUR;
}
```

### Ajuster la taille des vidéos

```html
<a-video 
    width="1.5"    <!-- Plus grande -->
    height="1.5"   <!-- Plus grande -->
    ...
></a-video>
```

## 🌐 Custom Domain (optionnel)

Pour utiliser votre propre domaine :

1. **Ajoutez un fichier `CNAME`** :
   ```bash
   echo "votre-domaine.com" > CNAME
   git add CNAME
   git commit -m "Add custom domain"
   git push origin main
   ```

2. **Configurez votre DNS** :
   - Type A : `185.199.108.153`
   - Type A : `185.199.109.153`
   - Type A : `185.199.110.153`
   - Type A : `185.199.111.153`

3. **Dans GitHub** :
   - Settings → Pages → Custom domain
   - Entrez votre domaine
   - Cochez "Enforce HTTPS"

## 📝 Licence

MIT License - Libre d'utilisation

## 🤝 Contributions

Les contributions sont les bienvenues ! N'hésitez pas à :
- Ouvrir une issue pour signaler un bug
- Proposer une pull request pour améliorer le code
- Partager vos suggestions

## 📞 Contact

Pour toute question sur le projet WoodWideWeb :
- GitHub Issues : https://github.com/epure/woodwideweb/issues
- Repository : https://github.com/epure/woodwideweb

## 🙏 Crédits

- **MindAR** : https://github.com/hiukim/mind-ar-js
- **A-Frame** : https://aframe.io
- **Cloudinary** : Hébergement vidéo

---

**Version actuelle** : Test avec vidéo unique partagée  
**Dernière mise à jour** : Février 2025

🌲 Profitez de votre galerie AR ! 🌲
