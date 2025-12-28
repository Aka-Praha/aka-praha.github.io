# CLAUDE.md - Context Memory

Memory pro budoucí Claude sessions. Tohle je reálný projekt pro Akademický klub alpinistů Praha.

## Základní info

- **URL:** https://aka-praha.github.io/
- **Repo:** https://github.com/Aka-Praha/aka-praha.github.io
- **Tech:** Jekyll 3.9, GitHub Pages, automatický deploy z `master` větve
- **Uživatel:** Ondra (ondra-pazi na GitHubu)

## Aktuální stav (Prosinec 2025)

**✅ Hotovo:**
- Základní struktura webu + design
- Černobílý konzervativní design podle loga AKA (hexagon s horami)
- Background image (assets/images/bg.webp) použito na celém body
- Responzivní layout
- **Posts s kategoriemi** v podadresářích (`_posts/event/`, `_posts/article/`, `_posts/gallery/`)
- **Podkategorie článků**: methodology, diary, club, area
- Event listing page (/akce/) s **JavaScript pagination** (9 eventů/stránka)
- Articles listing page (/clanky/) s dropdown menu pro podkategorie
- Fotogalerie (/galerie/) - přesunuto do `_posts/gallery/`
- Stránky: Historie, Kontakt
- Logo v navigaci
- Dropdown menu pro Články s podkategoriemi
- **Migrace z Drupalu dokončena** - metodika, deníčky, oblasti, klub

**🚧 Ještě není:**
- Filtry pro akce (rok/člen)
- Fulltext search

## Důležité konvence (MUSÍŠ DODRŽET)

1. **Kód/soubory anglicky, URL česky**
   - Složky: `_posts/`, `events/`, `articles/`, `gallery/`
   - Soubory: `history.md`, `contact.md` (ne `historie.md`, `kontakt.md`)
   - CSS třídy: `.event-card` ne `.akce-card`
   - Ale URL: `/akce/`, `/clanky/`, `/galerie/`, `/historie/`, `/kontakt/`

2. **Kategorie vždy SINGULAR**
   - `event`, `article`, `gallery`
   - Podkategorie: `methodology`, `diary`, `club`, `area` (ne `areas`!)

3. **Větev: master** (ne main)

4. **Commity česky, bez emoji**

5. **Konzervativní design**
   - Zaoblené rohy, jemné stíny
   - Font-weight: 700 (ne 900)

6. **Žádný lokální development**
   - Vše přes git push
   - GitHub Actions buildne a nasadí
   - Čeká se 2-3 minuty na deploy

7. **Fallback obrázek je logo.png**
   - Když post nemá `image:`, použije se `/logo.png`
   - Třída `.fallback-image` přidává `object-fit: contain`

## Struktura projektu

```
_config.yml              # Jekyll config (paginate: 9)
_data/
  └── categories.yml     # Definice podkategorií článků
_layouts/
  ├── default.html       # Base layout
  ├── home.html          # Homepage
  ├── page.html          # Běžné stránky
  ├── post.html          # Detail akce/článku
  └── album.html         # Detail alba (fotogalerie)
_includes/
  ├── header.html        # Nav + logo + dropdown menu
  └── footer.html        # Footer
_posts/                  # ⭐ Všechny posts v podadresářích
  ├── event/             # Akce (categories: [event])
  ├── article/           # Články s podkategoriemi
  │   ├── methodology/   # Metodiky a návody
  │   ├── diary/         # Deníčky z výprav
  │   ├── club/          # Klubové zprávy
  │   └── area/          # Popisy oblastí
  └── gallery/           # Fotogalerie (categories: [gallery])
assets/
  ├── css/style.css      # Veškerý CSS
  ├── js/main.js         # JS pro nav toggle
  └── images/
      └── bg.webp        # Body background
events/index.html        # Event listing (permalink: /akce/)
articles/                # Articles s podkategoriemi
  ├── index.html         # Hlavní listing (permalink: /clanky/)
  ├── metodika/index.html
  ├── denicek/index.html
  ├── oblasti/index.html
  └── klub/index.html
gallery/index.html       # Gallery listing (permalink: /galerie/)
history.md               # Historie klubu (permalink: /historie/)
contact.md               # Kontakt (permalink: /kontakt/)
index.md                 # Homepage
logo.png                 # AKA hexagon logo (fallback pro obrázky)
```

## Navigace

Pořadí položek v menu:
1. Domů
2. Akce
3. Články (dropdown s podkategoriemi)
   - Deníčky
   - Metodika
   - Popisy oblastí
   - Z klubu
4. Galerie
5. Historie
6. Kontakt

## Posts - frontmatter

**Event (_posts/event/YYYY-MM-DD-nazev.md):**
```yaml
---
categories: [event]
permalink: /akce/:title/
title: Název akce
date_begin: 2025-01-10
date_end: 2025-01-12
author: "Jméno"
image: https://url-obrazku.jpg
---
```

**Article (_posts/article/{podkategorie}/YYYY-MM-DD-nazev.md):**
```yaml
---
categories: [article, methodology]  # nebo diary, club, area
permalink: /clanky/:title/
title: Název článku
date_created: 2024-01-15
author: "Jméno"
image: https://url-obrazku.jpg
---
```

**Gallery (_posts/gallery/YYYY-MM-DD-nazev.md):**
```yaml
---
layout: album
categories: [gallery]
permalink: /galerie/:title/
title: Název alba
date_created: 2024-07-10
cover: https://url-cover.jpg
photos:
  - url: https://url-fotky.jpg
    caption: Popis fotky
---
```

## JavaScript pagination

Všechny listing stránky používají JavaScript pagination (9 položek/stránka):
- `events/index.html` - `eventPagination`
- `articles/index.html` - `articlePagination`
- `articles/*/index.html` - `articlePagination`
- `gallery/index.html` - `galleryPagination`

## Design systém

**Barvy:**
- Primary: #1d1d1b
- Secondary: #333333
- Light: #f5f5f5
- Text: #1d1d1b

**Komponenty:**
- `.event-card` - karta pro event/článek/album
- `.event-grid` - grid layout (3 sloupce)
- `.event-image` - obrázek v kartě
- `.fallback-image` - logo jako placeholder (object-fit: contain)
- `.dropdown-menu` - dropdown pro Články v navigaci

## Git workflow

```bash
git add -A
git commit -m "Popis změny česky bez emoji"
git push origin master
# Čekat 2-3 min na deploy
```

## Debugging checklist

1. Je to v masteru?
2. YAML front matter validní?
3. Správná kategorie (singular)?
4. Správný adresář v `_posts/`?
5. Správný `permalink:`?
6. Build prošel na GitHubu?
7. Čekal jsi 2-3 minuty?

---

**Poslední update:** 28.12.2025
**Status:** Fungující web s migrovanými články z Drupalu. Posts v podadresářích (event/article/gallery). Dropdown menu pro články. JavaScript pagination všude. Fallback obrázek = logo.png.
