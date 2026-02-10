#!/bin/bash

# Script de déploiement automatique pour WoodWideWeb AR Gallery
# Usage: ./deploy.sh "Message de commit"

set -e

# Couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🌲 WoodWideWeb - Déploiement GitHub Pages${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Vérifier si Git est installé
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git n'est pas installé${NC}"
    exit 1
fi

# Vérifier si nous sommes dans un repo Git
if [ ! -d .git ]; then
    echo -e "${YELLOW}⚠️  Pas de repository Git détecté${NC}"
    read -p "Voulez-vous initialiser Git ? (o/N): " INIT_GIT
    
    if [[ "$INIT_GIT" =~ ^[oO]$ ]]; then
        echo -e "${GREEN}🔧 Initialisation de Git...${NC}"
        git init
        git branch -M main
        
        read -p "URL du repository GitHub (ex: https://github.com/epure/woodwideweb.git): " REPO_URL
        git remote add origin "$REPO_URL"
        
        echo -e "${GREEN}✅ Git initialisé !${NC}"
    else
        echo -e "${RED}❌ Opération annulée${NC}"
        exit 1
    fi
fi

# Message de commit
COMMIT_MSG="${1:-Update: $(date +%Y-%m-%d\ %H:%M)}"

echo ""
echo -e "${YELLOW}📝 Message de commit:${NC} $COMMIT_MSG"
echo ""

# Vérifier les fichiers essentiels
echo -e "${YELLOW}🔍 Vérification des fichiers...${NC}"

MISSING_FILES=()

if [ ! -f "index.html" ]; then
    MISSING_FILES+=("index.html")
fi

if [ ! -f "targets.mind" ]; then
    MISSING_FILES+=("targets.mind")
fi

if [ ${#MISSING_FILES[@]} -gt 0 ]; then
    echo -e "${RED}❌ Fichiers manquants:${NC}"
    for file in "${MISSING_FILES[@]}"; do
        echo "  - $file"
    done
    exit 1
fi

echo -e "${GREEN}✅ Fichiers essentiels présents${NC}"
echo ""

# Vérifier la taille de targets.mind
MIND_SIZE=$(du -m targets.mind | cut -f1)
echo -e "${YELLOW}📦 Taille de targets.mind: ${MIND_SIZE} MB${NC}"

if [ $MIND_SIZE -gt 100 ]; then
    echo -e "${YELLOW}⚠️  Attention: targets.mind > 100 MB${NC}"
    echo "GitHub peut rejeter ce fichier."
    echo "Solutions:"
    echo "  1. Utiliser Git LFS (Large File Storage)"
    echo "  2. Héberger targets.mind sur un CDN"
    echo "  3. Diviser en plusieurs fichiers .mind"
    echo ""
    read -p "Continuer quand même ? (o/N): " CONTINUE
    
    if [[ ! "$CONTINUE" =~ ^[oO]$ ]]; then
        echo -e "${RED}❌ Déploiement annulé${NC}"
        exit 1
    fi
fi

# Afficher le statut Git
echo ""
echo -e "${YELLOW}📊 Statut Git:${NC}"
git status --short

echo ""
read -p "Continuer avec le déploiement ? (o/N): " CONFIRM

if [[ ! "$CONFIRM" =~ ^[oO]$ ]]; then
    echo -e "${RED}❌ Déploiement annulé${NC}"
    exit 1
fi

# Ajouter les fichiers
echo ""
echo -e "${GREEN}📤 Ajout des fichiers...${NC}"
git add .

# Vérifier s'il y a des changements
if git diff --staged --quiet; then
    echo -e "${YELLOW}⚠️  Aucun changement à committer${NC}"
    exit 0
fi

# Commit
echo -e "${GREEN}💾 Commit...${NC}"
git commit -m "$COMMIT_MSG"

# Push
echo -e "${GREEN}🚀 Push vers GitHub...${NC}"
git push origin main

# Résultat
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}✅ Déploiement réussi !${NC}"
echo ""
echo -e "${YELLOW}🌐 Votre site sera disponible dans 1-2 minutes:${NC}"
echo "   https://epure.github.io/woodwideweb/"
echo ""
echo -e "${YELLOW}💡 Conseils:${NC}"
echo "   - Videz le cache navigateur (Ctrl+F5) si changements invisibles"
echo "   - Testez sur mobile pour l'expérience AR complète"
echo "   - Vérifiez le déploiement: https://github.com/epure/woodwideweb/deployments"
echo ""
echo -e "${GREEN}🌲 Bonne exposition AR ! 🌲${NC}"
