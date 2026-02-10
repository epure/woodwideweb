# 🚀 Guide de déploiement rapide - GitHub Pages

## Étapes essentielles

### 1. Préparation des fichiers

Assurez-vous d'avoir :
- ✅ `index.html` (le fichier AR principal)
- ✅ `targets.mind` (images compilées MindAR)
- ✅ `README.md` (documentation)
- ✅ `.gitignore` (optionnel)

### 2. Créer le repository GitHub

**Option A - Via l'interface GitHub :**

1. Allez sur : https://github.com/new
2. Repository name : `woodwideweb`
3. Public ✅
4. Initialize : **NON** (déjà des fichiers locaux)
5. Cliquez "Create repository"

**Option B - Repository existe déjà :**

Passez directement à l'étape 3.

### 3. Initialiser Git localement

```bash
# Dans le dossier de votre projet
cd /chemin/vers/woodwideweb

# Initialiser git
git init

# Ajouter tous les fichiers
git add index.html targets.mind README.md .gitignore

# Premier commit
git commit -m "Initial commit: WoodWideWeb AR Gallery"

# Lier au repository GitHub
git remote add origin https://github.com/epure/woodwideweb.git

# Pousser vers GitHub
git branch -M main
git push -u origin main
```

### 4. Activer GitHub Pages

**Via l'interface GitHub :**

1. Allez sur : https://github.com/epure/woodwideweb
2. Cliquez sur `Settings` (en haut)
3. Dans le menu gauche : `Pages`
4. Dans "Build and deployment" :
   - **Source** : Deploy from a branch
   - **Branch** : main
   - **Folder** : / (root)
5. Cliquez `Save`

**Attendez 1-2 minutes**, puis votre site sera en ligne à :

```
https://epure.github.io/woodwideweb/
```

### 5. Vérifier le déploiement

1. Ouvrez : https://epure.github.io/woodwideweb/
2. Vous devriez voir l'écran de chargement
3. Autorisez la caméra
4. Testez avec une image marqueur

## 🔄 Mettre à jour le site

Pour toute modification :

```bash
# Modifier vos fichiers localement

# Ajouter les modifications
git add .

# Commit avec message descriptif
git commit -m "Update: description de vos changements"

# Pousser vers GitHub
git push origin main
```

Le site se mettra à jour automatiquement en 1-2 minutes.

## 📋 Checklist de déploiement

- [ ] Repository créé sur GitHub
- [ ] Fichiers ajoutés et committés
- [ ] Poussé vers GitHub (`git push`)
- [ ] GitHub Pages activé dans Settings
- [ ] URL accessible : https://epure.github.io/woodwideweb/
- [ ] Test caméra fonctionne
- [ ] Test détection image fonctionne
- [ ] Vidéo se lance correctement

## ⚠️ Problèmes courants

### "git push" échoue - Authentication

**Solution 1 - Personal Access Token :**

1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token (classic)
3. Cochez : `repo`
4. Copiez le token
5. Lors du push, utilisez :
   - Username : `epure`
   - Password : `[votre_token]`

**Solution 2 - SSH :**

```bash
# Générer clé SSH
ssh-keygen -t ed25519 -C "votre@email.com"

# Copier la clé publique
cat ~/.ssh/id_ed25519.pub

# Ajouter sur GitHub : Settings → SSH and GPG keys → New SSH key

# Changer l'URL remote
git remote set-url origin git@github.com:epure/woodwideweb.git
```

### targets.mind trop gros pour GitHub

Si `targets.mind` > 100 MB :

**Solution 1 - Git LFS :**

```bash
# Installer Git LFS
git lfs install

# Tracker les fichiers .mind
git lfs track "*.mind"

# Commit du fichier .gitattributes
git add .gitattributes
git commit -m "Add Git LFS for .mind files"

# Ajouter targets.mind
git add targets.mind
git commit -m "Add targets.mind via Git LFS"
git push origin main
```

**Solution 2 - Héberger ailleurs :**

1. Uploadez `targets.mind` sur Cloudinary ou un CDN
2. Modifiez `index.html` :
   ```html
   imageTargetSrc: https://votre-cdn.com/targets.mind;
   ```

### Page 404 après activation

**Vérifications :**

1. Branch correcte ? (doit être `main`)
2. Folder correct ? (doit être `/` root)
3. Fichier s'appelle bien `index.html` ? (pas `index.htm`)
4. Attendu 2-3 minutes après activation ?

### Changements ne s'affichent pas

**Solutions :**

```bash
# Vider le cache du navigateur
Ctrl + F5 (Windows/Linux)
Cmd + Shift + R (Mac)

# Ou en navigation privée
Ctrl + Shift + N (Chrome)
Cmd + Shift + N (Safari)

# Vérifier le dernier commit sur GitHub
https://github.com/epure/woodwideweb/commits/main
```

## 🎯 Commandes Git essentielles

```bash
# Voir le statut
git status

# Voir les modifications
git diff

# Voir l'historique
git log --oneline

# Annuler modifications non committées
git checkout -- fichier.html

# Voir les branches
git branch

# Créer une branche
git checkout -b nouvelle-branche

# Revenir à main
git checkout main
```

## 📱 Tester en local avant déploiement

```bash
# Serveur Python
python -m http.server 8080

# Serveur Node.js
npx http-server -p 8080

# Ouvrir dans le navigateur
http://localhost:8080
```

## 🔐 Sécurité

**Ne JAMAIS committer :**
- Clés API privées
- Tokens d'authentification
- Mots de passe
- Fichiers `.env`

**Utilisez `.gitignore` pour exclure ces fichiers.**

## 📊 Monitoring

### Voir les visites (via GitHub)

1. Repository → Insights → Traffic
2. Vous verrez :
   - Nombre de vues
   - Visiteurs uniques
   - Sites référents

### Analytics avancé

Ajoutez Google Analytics dans `index.html` (voir README.md)

## 🌐 Custom domain

Si vous avez un nom de domaine :

1. Créez `CNAME` :
   ```bash
   echo "woodwideweb.votredomaine.com" > CNAME
   git add CNAME
   git commit -m "Add custom domain"
   git push
   ```

2. Configurez DNS chez votre registrar :
   - Type CNAME : `woodwideweb` → `epure.github.io`

3. GitHub → Settings → Pages → Custom domain

## ✅ Prêt !

Votre galerie AR est maintenant en ligne à :

**https://epure.github.io/woodwideweb/**

Partagez cette URL ou générez un QR code pour faciliter l'accès !

---

Pour plus de détails, consultez le README.md principal.
