# CLAUDE.md - AKA Praha GitHub Pages

Dokumentace pro budoucí kontext. Tento projekt je GitHub Pages web pro Akademický klub alpinistů Praha.

## O projektu

- **URL:** https://aka-praha.github.io/
- **Technologie:** Jekyll 3.9 (statický generátor)
- **Design:** Černobílý moderní konzervativní design podle loga AKA
- **Deployment:** Automatický přes GitHub Actions při push do větve `master`
- **Původní web:** Drupal na http://localhost:8081/ (300+ článků, 150+ akcí k migraci)

## Aktuální stav projektu

✅ **Hotovo:**
- Základní struktura a design
- Hero sekce s fotkou Alp na pozadí
- Responzivní layout
- Jekyll Collections pro akce (_events/)
- Detail stránky akcí s prokliky
- Logo AKA v navigaci

🚧 **TODO:**
- Migrace 300+ článků z Drupalu
- Migrace 150+ akcí z Drupalu
- Fotogalerie
- Filtry pro akce (podle roku/člena)
- Stránky: O nás, Kontakt

## Struktura projektu

```
aka-praha/
├── _config.yml              # Jekyll konfigurace + collections
├── _layouts/                # HTML šablony
│   ├── default.html         # Základní layout
│   ├── home.html            # Homepage s hero
│   ├── page.html            # Běžné stránky
│   └── event.html           # Detail akce
├── _includes/               # Komponenty
│   ├── header.html          # Navigace + logo
│   └── footer.html          # Patička
├── _events/                 # ⭐ Akce jako .md soubory
│   ├── vysocina-2025.md
│   ├── adrspach-2025.md
│   └── ...
├── assets/
│   ├── css/style.css        # Veškerý CSS
│   ├── js/main.js           # JavaScript
│   └── images/
│       └── bg.webp          # Hero pozadí (Alpy)
├── logo.png                 # AKA logo (hexagon)
├── index.md                 # Homepage
├── events.md                # Seznam akcí (permalink: /akce/)
├── Gemfile                  # Ruby závislosti
└── .github/workflows/
    └── jekyll.yml           # CI/CD
```

## Jekyll Collections - Akce

Akce jsou organizované jako Jekyll collection v `_events/`.

### Struktura akce (.md soubor):

```yaml
---
title: Název akce
date_start: 2025-01-10
date_end: 2025-01-12
image: https://url-k-obrazku.jpg
---

Popis akce v Markdown...
```

### URLs:

- Seznam akcí: `/akce/` (soubor: `events.md`)
- Detail akce: `/akce/vysocina-2025/` (automaticky z `_events/vysocina-2025.md`)

### Jak přidat novou akci:

```bash
# 1. Vytvoř nový soubor
cat > _events/nova-akce.md << 'EOF'
---
title: Nová horolezecká akce
date_start: 2025-12-01
date_end: 2025-12-03
image: https://images.unsplash.com/photo-xxx
---

Popis akce, program, co si vzít s sebou...
EOF

# 2. Commit a push
git add _events/nova-akce.md
git commit -m "Přidána akce: Nová horolezecká akce"
git push origin master

# 3. GitHub Actions automaticky buildne a nasadí
# Za 2-3 minuty je akce živá na webu
```

### Jak akce fungují:

1. **`_config.yml`** definuje collection:
```yaml
collections:
  events:
    output: true
    permalink: /akce/:name/
```

2. **`events.md`** loopuje přes všechny akce:
```liquid
{% for event in site.events %}
  <a href="{{ event.url }}">
    {{ event.title }}
    {{ event.date_start | date: "%d.%m.%Y" }}
  </a>
{% endfor %}
```

3. **`_layouts/event.html`** renderuje detail akce

## Design systém

### Barvy

```css
--primary-color: #1a1a1a      /* Černá */
--secondary-color: #333333    /* Tmavě šedá */
--accent-color: #ffffff       /* Bílá */
--dark-color: #000000         /* Úplně černá */
--light-color: #f5f5f5        /* Světle šedá */
```

### Typography

- **Nadpisy:** Montserrat, font-weight: 700
- **Text:** Roboto
- **Styl:** Konzervativní, zaoblené rohy, jemné stíny
- **Letter-spacing:** 0.5px (ne moc)

### Komponenty

**Button:**
```html
<a href="#" class="btn btn-primary">Text</a>
```

**Event Card:**
```html
<div class="event-card">
  <div class="event-image" style="background-image: url(...)"></div>
  <div class="event-content">
    <h3 class="event-title">Název</h3>
    <p class="event-date">Datum</p>
  </div>
</div>
```

**Cards (obecné):**
```html
<div class="cards">
  <div class="card">
    <h3>Nadpis</h3>
    <p>Text</p>
  </div>
</div>
```

## Git Workflow

```bash
# 1. Změny v souborech
vim events.md
# nebo vytvoř novou akci v _events/

# 2. Commit
git add .
git commit -m "Popis změny"

# 3. Push (spustí GitHub Actions)
git push origin master

# 4. Zkontroluj build:
# https://github.com/Aka-Praha/aka-praha.github.io/actions

# 5. Za 2-3 min je změna živá na:
# https://aka-praha.github.io/
```

## Časté úkoly

### Přidat novou stránku

```bash
cat > nova-stranka.md << 'EOF'
---
layout: page
title: Nová stránka
---

# Obsah
EOF

# Přidej do navigace v _includes/header.html:
<li><a href="/nova-stranka/" class="nav-link">Nová stránka</a></li

git add nova-stranka.md _includes/header.html
git commit -m "Přidána stránka: Nová stránka"
git push origin master
```

### Změnit logo

```bash
cp /cesta/k/novemu-logu.png logo.png
git add logo.png
git commit -m "Aktualizace loga"
git push origin master
```

### Upravit CSS/design

Všechny styly jsou v `assets/css/style.css`:

```bash
vim assets/css/style.css

# Změň barvy v CSS proměnných (řádky 1-23)
# Nebo uprav konkrétní komponenty

git add assets/css/style.css
git commit -m "Úprava designu"
git push origin master
```

### Změnit hero pozadí

```bash
# Nahraď obrázek
cp /cesta/k/novy-background.webp assets/images/bg.webp

git add assets/images/bg.webp
git commit -m "Nové hero pozadí"
git push origin master
```

## Troubleshooting

### Build fails na GitHubu

1. Jdi na: https://github.com/Aka-Praha/aka-praha.github.io/actions
2. Klikni na failed build
3. Přečti error log
4. Časté problémy:
   - Chybějící gem → přidej do `Gemfile`
   - Syntax error v YAML front matter
   - Chybný Liquid tag
   - Chybějící layout

### Stránky se neaktualizují

1. Zkontroluj, že build prošel (zelený ✓)
2. Počkej 2-3 minuty
3. Hard refresh (Ctrl+Shift+R)
4. Zkontroluj URL (je správně?)

### Akce se nezobrazuje

1. Zkontroluj YAML front matter:
   ```yaml
   ---
   title: Musí být
   date_start: 2025-01-01
   date_end: 2025-01-03
   image: https://...
   ---
   ```
2. Soubor musí být v `_events/`
3. Zkontroluj Jekyll build log

## Důležité příkazy

```bash
# Git status
git status

# Přidání všech změn
git add .
# nebo konkrétní soubor:
git add _events/nova-akce.md

# Commit
git commit -m "Zpráva"

# Push
git push origin master

# Pull (stáhni změny z GitHubu)
git pull origin master

# Zobrazení historie
git log --oneline

# Kontrola diff před commitem
git diff
```

## Reference

- Jekyll docs: https://jekyllrb.com/docs/
- Liquid template: https://shopify.github.io/liquid/
- Markdown guide: https://www.markdownguide.org/
- GitHub Pages: https://docs.github.com/en/pages
- Jekyll Collections: https://jekyllrb.com/docs/collections/

## Budoucí migrace z Drupalu

Drupal běží na `http://localhost:8081/`

**Co migrovat:**
- 300+ článků
- 150+ akcí (už máme strukturu)
- Fotogalerie/obrázky
- Uživatelské účty? (nejspíš ne)

**Postup:**
1. Export dat z Drupalu (Views export nebo SQL)
2. Konverze do Jekyll formátu (Python/Ruby script)
3. Vytvoření collections pro články
4. Upload fotek na CDN nebo do assets/
5. Nastavení redirectů ze starých URL

## Klíčové konvence

- **Kód v angličtině** (proměnné, CSS třídy, soubory)
- **URL česky** (`/akce/`, ne `/events/`) - použij `permalink:`
- **Commity česky** (pro lepší komunikaci s Ondrou)
- **Větev:** `master` (ne main)
- **No emoji** v commitech (Ondra to nechce)
- **Konzervativní design** (ne příliš moderní/brutalist)

## Poznámky pro Claude

- Tohle je reálný projekt, ne demo
- Ondra chce konzervativní design, ne moc experimentální
- URL musí být česky i když kód je anglicky
- Používáme `master` větev (organizace je old school)
- Nedělej lokální development, vše přes git push
- Vždy aktualizuj tento CLAUDE.md když se něco podstatného změní
