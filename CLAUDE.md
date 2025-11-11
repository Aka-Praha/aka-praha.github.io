# CLAUDE.md - AKA Praha GitHub Pages

Dokumentace pro práci s tímto projektem pomocí Claude.

## O projektu

Webové stránky Akademického klubu alpinistů Praha na GitHub Pages.

- **URL:** https://aka-praha.github.io/
- **Technologie:** Jekyll 3.9 (statický generátor)
- **Design:** Černobílý moderní design podle loga AKA
- **Deployment:** Automatický přes GitHub Actions při push do větve `master`

## Struktura projektu

```
aka-praha/
├── _config.yml           # Hlavní konfigurace Jekyll
├── _layouts/             # HTML šablony
│   ├── default.html      # Základní layout
│   ├── home.html         # Layout pro homepage
│   └── page.html         # Layout pro běžné stránky
├── _includes/            # Komponenty
│   ├── header.html       # Navigace a logo
│   └── footer.html       # Patička
├── assets/               # Statické soubory
│   ├── css/style.css     # Hlavní CSS
│   └── js/main.js        # JavaScript
├── logo.png              # Logo AKA
├── index.md              # Úvodní stránka
├── Gemfile               # Ruby závislosti
└── .github/workflows/    # GitHub Actions
    └── jekyll.yml        # Build & deploy workflow
```

## Jak upravovat stránky

### 1. Úprava obsahu

Stránky jsou psané v Markdown (.md):

```markdown
---
layout: home
title: Název stránky
---

# Nadpis

Text stránky...
```

### 2. Přidání nové stránky

Vytvoř nový `.md` soubor:

```bash
# Vytvoření nové stránky
cat > nova-stranka.md << 'EOF'
---
layout: page
title: Nová stránka
---

# Obsah
EOF
```

Pak přidej odkaz do navigace v `_includes/header.html`.

### 3. Úprava CSS/designu

Všechny styly jsou v `assets/css/style.css`:

- **CSS proměnné** (řádky 1-21): Barvy a nastavení
- **Navigace** (řádky 55-145): Header a menu
- **Hero sekce** (řádky 147-270): Úvodní fullscreen sekce
- **Karty** (řádky 326-364): Card komponenty
- **Footer** (řádky 366-410): Patička

### 4. Přidání loga/obrázků

```bash
# Zkopíruj obrázek do projektu
cp /cesta/k/obrazku.png assets/images/

# Použij v markdown:
![Alt text](/assets/images/obrazek.png)

# Nebo v HTML:
<img src="/assets/images/obrazek.png" alt="Popis">
```

## Git workflow

```bash
# 1. Změny v souborech
vim index.md

# 2. Commit
git add .
git commit -m "Popis změny"

# 3. Push (spustí automatický build)
git push origin master

# 4. Zkontroluj build na GitHubu:
# https://github.com/Aka-Praha/aka-praha.github.io/actions
```

## Design systém

### Barvy

```css
--primary-color: #1a1a1a    /* Černá */
--secondary-color: #333333   /* Tmavě šedá */
--accent-color: #ffffff      /* Bílá */
--dark-color: #000000        /* Úplně černá */
--light-color: #f5f5f5       /* Světle šedá */
```

### Typography

- **Nadpisy:** Montserrat (uppercase, bold, letter-spacing: 2px)
- **Text:** Roboto
- **Styl:** Brutalist, ostré hrany, žádné rounded corners

### Komponenty

**Buttony:**
```html
<a href="#" class="btn btn-primary">Text</a>
```

**Karty:**
```html
<div class="cards">
  <div class="card">
    <h3>Nadpis</h3>
    <p>Text</p>
  </div>
</div>
```

**Sekce:**
```html
<section id="sekce">
  <h2>Nadpis sekce</h2>
  <p>Obsah...</p>
</section>
```

## Lokální vývoj

```bash
# 1. Instalace závislostí
bundle install

# 2. Spuštění lokálního serveru
bundle exec jekyll serve

# 3. Otevři v prohlížeči
http://localhost:4000
```

## Časté úkoly

### Změna loga

```bash
# Nahraď soubor
cp /cesta/k/novemu-logu.png logo.png

# Commit
git add logo.png
git commit -m "Aktualizace loga"
git push origin master
```

### Přidání social media linků

Uprav `_includes/footer.html`:

```html
<a href="https://facebook.com/aka" aria-label="Facebook">FB</a>
```

### Změna barev

Uprav CSS proměnné v `assets/css/style.css`:

```css
:root {
    --primary-color: #nová-barva;
}
```

## Troubleshooting

### Build fails na GitHubu

1. Zkontroluj Actions: https://github.com/Aka-Praha/aka-praha.github.io/actions
2. Přečti error log
3. Časté problémy:
   - Chybějící gem → přidej do `Gemfile`
   - Syntax error v YAML → zkontroluj `_config.yml`
   - Chybný markdown → zkontroluj `.md` soubory

### Stránky se neaktualizují

1. Počkej 2-3 minuty (GitHub Actions trvá)
2. Zkontroluj, že build prošel (zelený ✓)
3. Hard refresh v prohlížeči (Ctrl+Shift+R)
4. Vymaž cache

### Lokální Jekyll nefunguje

```bash
# Přeinstaluj závislosti
rm Gemfile.lock
bundle install

# Zkus starší verzi Ruby
rbenv install 3.1.0
rbenv local 3.1.0
```

## Budoucí rozšíření

### Plánované funkce

1. **Články/blog** - Jekyll posts s pagination
2. **Galerie akcí** - Collections pro akce + fotogalerie
3. **Kalendář** - Integrace s Google Calendar API
4. **Filtry** - JavaScript filtering akcí podle roku/člena
5. **Migrace z Drupalu** - Export 300+ článků a 150+ akcí

### Migrace z Drupalu

Drupal web běží na `http://localhost:8081/`

**TODO:**
- Export článků z Drupalu (Views export nebo SQL)
- Konverze do Jekyll posts
- Export galerie/fotek
- Nastavení redirectů ze starých URL

## Kontakt

- **Repozitář:** https://github.com/Aka-Praha/aka-praha.github.io
- **Live web:** https://aka-praha.github.io/
- **Drupal web:** http://localhost:8081/

## Důležité příkazy

```bash
# Status repozitáře
git status

# Přidání všech změn
git add .

# Commit
git commit -m "Zpráva"

# Push
git push origin master

# Pull (stáhni změny)
git pull origin master

# Zobrazení logů
git log --oneline

# Jekyll build lokálně
bundle exec jekyll build

# Jekyll serve
bundle exec jekyll serve --livereload
```

## Reference

- Jekyll docs: https://jekyllrb.com/docs/
- Liquid template: https://shopify.github.io/liquid/
- Markdown guide: https://www.markdownguide.org/
- GitHub Pages: https://docs.github.com/en/pages
