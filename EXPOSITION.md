# 🎨 Guide d'exposition - WoodWideWeb AR Gallery

Instructions pour préparer et gérer votre exposition AR.

## 📱 QR Code pour les visiteurs

### URL à encoder

```
https://epure.github.io/woodwideweb/
```

### Générer le QR code

**Option 1 - En ligne (gratuit) :**

1. **QR Code Generator** : https://www.qr-code-generator.com/
   - Collez l'URL
   - Type: URL
   - Téléchargez en haute résolution

2. **QR Code Monkey** : https://www.qrcode-monkey.com/
   - Plus d'options de personnalisation
   - Logo personnalisé possible
   - Format PNG/SVG

3. **Canva** : https://www.canva.com/
   - Recherchez "QR code"
   - Design personnalisable
   - Peut ajouter texte/graphiques autour

**Option 2 - Via Python :**

```python
# Installer qrcode
pip install qrcode[pil]

# Générer le QR code
import qrcode

url = "https://epure.github.io/woodwideweb/"
qr = qrcode.QRCode(version=1, box_size=10, border=5)
qr.add_data(url)
qr.make(fit=True)

img = qr.make_image(fill_color="black", back_color="white")
img.save("woodwideweb_qr.png")
```

### Spécifications d'impression

- **Taille minimale** : 10x10 cm
- **Taille recommandée** : 15x15 cm (pour scan facile)
- **Format** : PNG haute résolution (300 DPI)
- **Contraste** : Noir sur blanc (meilleure lisibilité)

## 🖨️ Matériel d'exposition

### 1. Panneaux d'instructions

**Exemple de texte :**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🌲 WOODWIDEWEB - AR GALLERY 🌲
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Découvrez les œuvres en réalité augmentée

📱 ÉTAPE 1
Scannez ce QR code avec votre smartphone

📷 ÉTAPE 2
Autorisez l'accès à la caméra

🎨 ÉTAPE 3
Pointez vers l'une des 24 œuvres numérotées

✨ ÉTAPE 4
Profitez de l'animation AR !

[QR CODE ICI]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    Connexion Wi-Fi recommandée
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 2. Étiquettes pour les œuvres

Pour chaque œuvre, préparez une petite étiquette :

```
━━━━━━━━━━━━━━━━━━━━━
  🌲 WoodWideWeb
     Œuvre N°XX
  
  Pointez votre caméra
  pour voir l'animation
━━━━━━━━━━━━━━━━━━━━━
```

### 3. Checklist matériel

- [ ] QR codes imprimés (2-3 exemplaires)
- [ ] Panneaux d'instructions (entrée + salle)
- [ ] 24 marqueurs d'images imprimés
- [ ] Supports rigides (carton plume/dibond)
- [ ] Étiquettes numérotées (01-24)
- [ ] Patafix/adhésif pour montage
- [ ] Éclairage d'appoint si nécessaire

## 📏 Installation des œuvres

### Positionnement optimal

```
Hauteur des yeux
     │
     ▼
┌────────┐  ← 30cm minimum entre œuvres
│ Œuvre │
│  XX   │  ← Image 20x20 cm minimum
└────────┘
     │
     ▼
80-150 cm du sol (hauteur standard)
```

### Espacement

- **Entre œuvres** : 30 cm minimum (évite confusion détection)
- **Du mur** : Montage plat ou léger relief (< 3 cm)
- **Hauteur** : 80-150 cm du sol (confort visuel)

### Éclairage

**Idéal :**
- Lumière diffuse et uniforme
- Éviter spots directs (créent reflets)
- Température : 4000-5000K (blanc neutre)
- Intensité : 300-500 lux

**À éviter :**
- Contre-jour
- Éclairage latéral créant ombres
- Lumière naturelle directe (fenêtres)

## 🌐 Configuration Wi-Fi

### Option 1 : Wi-Fi existant

1. **Affichez le nom/mot de passe Wi-Fi** clairement
2. **Testez la connexion** avant l'ouverture
3. **Bande passante** : 10 Mbps minimum pour 10 utilisateurs

### Option 2 : Réseau dédié

```
Nom réseau : WoodWideWeb_Gallery
Mot de passe : [votre_mdp]
Type : WPA2
Bande : 2.4 GHz (meilleure portée)
```

### Option 3 : Sans Wi-Fi

⚠️ Les visiteurs utiliseront leur 4G/5G
- Fichier `targets.mind` se chargera via réseau mobile
- Prévoyez temps de chargement plus long
- Testez en 4G avant l'expo

## 📊 Suivi des visiteurs

### Google Analytics (optionnel)

Si vous avez ajouté GA dans `index.html`, vous pourrez voir :

- **Nombre de visiteurs**
- **Temps moyen passé**
- **Appareils utilisés** (iOS/Android)
- **Heures de pointe**

Accès : https://analytics.google.com/

### Compteur simple

Utilisez un outil comme :
- **Statcounter** : https://statcounter.com/
- **GoatCounter** : https://www.goatcounter.com/

## 🎯 FAQ Visiteurs

Préparez des réponses aux questions fréquentes :

### "Ça ne marche pas !"

**Vérifier :**
1. Caméra autorisée dans navigateur ?
2. Image marqueur bien visible/éclairée ?
3. Distance correcte (30-50 cm) ?
4. Wi-Fi/4G connecté ?

### "La vidéo ne se lance pas"

**Solutions :**
1. Rafraîchir la page (tirer vers bas)
2. Vider cache navigateur
3. Réessayer avec une autre œuvre
4. Redémarrer le navigateur

### "C'est compatible avec mon téléphone ?"

**Compatibilité :**
- ✅ iPhone iOS 11.3+
- ✅ Android 7.0+ avec Chrome/Firefox
- ❌ Téléphones très anciens (< 2017)

### "Puis-je prendre des photos/vidéos ?"

Décidez de votre politique :
- Photos autorisées ? Oui/Non
- Partage sur réseaux sociaux ?
- Hashtag dédié ?

Exemple :
```
📸 Photos autorisées !
Partagez avec #WoodWideWeb
```

## 🛠️ Kit de dépannage sur site

### Matériel à avoir

- [ ] Tablette de démonstration (pré-chargée)
- [ ] Chargeurs/batteries externes
- [ ] Marqueurs de rechange (imprimés)
- [ ] Ruban adhésif/patafix
- [ ] Lampe d'appoint
- [ ] Notice imprimée (troubleshooting)

### Contacts d'urgence

```
Technique :
- Support site : [votre email]
- Hébergeur : GitHub Pages
- Cloudinary : [si utilisé]

Logistique :
- Responsable lieu : [nom/tél]
- Électricien : [tél]
```

## 📅 Timeline d'installation

### J-7 : Préparation

- [ ] Impression de tous les marqueurs
- [ ] Test complet du site en ligne
- [ ] Préparation QR codes et panneaux
- [ ] Montage sur supports rigides

### J-1 : Installation

- [ ] Accrochage des œuvres
- [ ] Test éclairage
- [ ] Vérification Wi-Fi
- [ ] Test avec plusieurs appareils
- [ ] Placement panneaux instructions

### Jour J : Ouverture

- [ ] Test final le matin
- [ ] Présence staff formé
- [ ] Kit dépannage prêt
- [ ] Monitoring des visites

### Jour J+X : Fin

- [ ] Décrochage soigneux
- [ ] Récupération matériel
- [ ] Export analytics
- [ ] Feedback visiteurs

## 📈 Optimisations en cours d'expo

### Si trop de monde

1. **Limiter visiteurs simultanés** par salle
2. **Créer file d'attente** organisée
3. **Proposer horaires** moins chargés

### Si détection difficile

1. **Ajuster éclairage** (éviter reflets)
2. **Repositionner œuvres** (plus grandes/mieux éclairées)
3. **Fournir tablettes** pré-configurées

### Si connexion lente

1. **Passer à l'Ethernet** (router)
2. **Augmenter bande passante**
3. **Limiter nombre d'utilisateurs**

## 🎉 Marketing & Communication

### Avant l'expo

```
📣 Annonce :
"Découvrez WoodWideWeb, une expérience AR unique !
24 œuvres prennent vie via votre smartphone.
Du [date] au [date] - [lieu]
Plus d'infos : [lien]"
```

### Pendant l'expo

- Stories Instagram : visiteurs avec œuvres AR
- Posts Facebook : meilleurs moments
- Twitter : statistiques temps réel

### Hashtags suggérés

```
#WoodWideWeb
#ARArt
#RealiteAugmentee
#ExpoAR
#[VotreVille]Art
```

## 📊 Métriques de succès

À suivre :

| Métrique | Objectif | Réel |
|----------|----------|------|
| Visiteurs uniques | 500 | ___ |
| Taux de conversion (scan QR) | 70% | ___ |
| Temps moyen | 15 min | ___ |
| Satisfaction | 4/5 | ___ |
| Partages sociaux | 50 | ___ |

## ✅ Checklist finale

### Technique
- [ ] Site en ligne et fonctionnel
- [ ] Tests iOS et Android OK
- [ ] Toutes les 24 œuvres détectées
- [ ] Vidéos se chargent rapidement
- [ ] QR code fonctionne

### Logistique
- [ ] Œuvres installées et numérotées
- [ ] Éclairage optimal
- [ ] Wi-Fi stable
- [ ] Panneaux en place
- [ ] Staff formé

### Communication
- [ ] Annonces publiées
- [ ] Presse informée (si applicable)
- [ ] Réseaux sociaux prêts
- [ ] Matériel photo/vidéo

---

**Prêt pour l'expo ! 🌲✨**

Bon courage et profitez de cette belle expérience AR !
