# 🔗 Ouvrir des liens dans Edge depuis Notion

## Principe

```
Clic dans Notion → page GitHub Pages (https://) → redirige vers Edge
```

Un seul fichier HTML hébergé gratuitement sur GitHub Pages. Zéro installation sur les postes.

---

## Mise en place (5 min, une seule fois)

### 1. Créer le dépôt GitHub

1. Allez sur **https://github.com** (créez un compte si nécessaire)
2. Cliquez **New repository** (bouton vert "+")
3. Nom : `suger-edge`
4. Cochez **Public**
5. Cochez **Add a README file**
6. Cliquez **Create repository**

### 2. Ajouter le fichier HTML

1. Dans le dépôt, cliquez **Add file** → **Upload files**
2. Glissez le fichier `index.html` fourni
3. Cliquez **Commit changes**

### 3. Activer GitHub Pages

1. Allez dans **Settings** → **Pages** (menu gauche)
2. Source : **Deploy from a branch**
3. Branch : `main` / `/ (root)`
4. Cliquez **Save**
5. Attendez ~1 minute, votre URL apparaît :
   ```
   https://VOTRE-PSEUDO.github.io/suger-edge/
   ```

### 4. Tester

Ouvrez dans votre navigateur :
```
https://VOTRE-PSEUDO.github.io/suger-edge/?app=silae
```
→ Edge s'ouvre sur Silae ✓

---

## Utilisation dans Notion

Sélectionnez du texte → ajoutez un lien :

| Texte dans Notion | Lien à coller |
|---|---|
| 📋 Ouvrir Silae | `https://PSEUDO.github.io/suger-edge/?app=silae` |
| ⚙️ Google Admin | `https://PSEUDO.github.io/suger-edge/?app=admin` |

---

## Ajouter un nouveau lien

1. Modifiez `index.html` sur GitHub (cliquez le fichier → ✏️ Edit)
2. Ajoutez une entrée dans `APPS` :
   ```javascript
   const APPS = {
       "silae":    "https://sadec-akelys.silae.fr/silae",
       "admin":    "https://admin.google.com",
       "pronote":  "https://votre-instance.pronote.fr",  // ← nouveau
   };
   ```
3. Commit → GitHub Pages met à jour automatiquement (~30s)
4. Dans Notion, utilisez `?app=pronote`
