# CLAUDE.md - Context Memory

Memory pro budoucí Claude sessions. Tohle je reálný projekt pro Akademický klub alpinistů Praha.

## Základní info

- **URL:** https://aka-praha.github.io/
- **Repo:** https://github.com/Aka-Praha/aka-praha.github.io
- **Tech:** Jekyll 3.9, GitHub Pages, automatický deploy z `master` větve
- **Uživatel:** Ondra (ondra-pazi na GitHubu)
- **Původní web:** Drupal na http://localhost:8081/ (300+ článků, 150+ akcí čeká na migraci)

## Aktuální stav (Prosinec 2025)

**✅ Hotovo:**
- Základní struktura webu + design
- Černobílý konzervativní design podle loga AKA (hexagon s horami)
- Background image (assets/images/bg.webp) použito na celém body
- Responzivní layout
- **Posts s kategoriemi** v podadresářích (`_posts/event/` a `_posts/article/`)
- **Podkategorie článků** definované v `_data/categories.yml` (methodology, diary, club, news, archive)
- Event listing page (/akce/) s **JavaScript pagination** (9 eventů/stránka)
- Event detail pages (/akce/nazev-akce/)
- Articles listing page (/clanky/)
- Fotogalerie (/galerie/) s albums collection
- Stránky: O nás, Kontakt
- Logo v navigaci
- 18 demo akcí, 1 demo článek, 3 demo alba

**🚧 Ještě není:**
- Migrace 300+ článků z Drupalu
- Migrace 150+ akcí z Drupalu
- Filtry pro akce (rok/člen)
- Fulltext search

## Důležité konvence (MUSÍŠ DODRŽET)

1. **Kód anglicky, URL česky**
   - Složky: `_posts/`, `_albums/` (ne `_akce/`, `_clanky/`)
   - CSS třídy: `.event-card` ne `.akce-card`
   - Ale URL: `/akce/`, `/clanky/`, `/galerie/` pomocí `permalink:`

2. **Větev: master** (ne main - organizace je old school)

3. **Commity česky** (Ondra je Čech)

4. **No emoji v commitech** (Ondra nechce 🚫)

5. **Konzervativní design**
   - Ne příliš brutalist/moderní
   - Zaoblené rohy, jemné stíny
   - Font-weight: 700 (ne 900)
   - Letter-spacing: 0.5px (ne 2px)

6. **Žádný lokální development**
   - Vše přes git push
   - GitHub Actions buildne a nasadí
   - Čeká se 2-3 minuty na deploy

## Struktura projektu

```
_config.yml              # Jekyll config (paginate: 9, collections: albums)
_data/
  └── categories.yml     # Definice podkategorií článků
_layouts/
  ├── default.html       # Base layout
  ├── home.html          # Homepage
  ├── page.html          # Běžné stránky
  ├── post.html          # Detail akce/článku
  └── album.html         # Detail alba (fotogalerie)
_includes/
  ├── header.html        # Nav + logo
  └── footer.html        # Footer
_posts/                  # ⭐ Posts v podadresářích podle typu
  ├── event/             # Akce (categories: [event])
  │   ├── 2025-01-10-vysocina-2025.md
  │   ├── 2025-07-07-adrspach-2025.md
  │   └── ... (18 eventů)
  └── article/           # Články s podkategoriemi
      ├── archive/       # Archivní články
      ├── club/          # Klubové zprávy
      ├── diary/         # Deníčky z výprav
      ├── methodology/   # Metodiky a návody
      │   └── 2024-01-15-zakladni-lezecka-metodika.md
      └── news/          # Různé zprávy
_albums/                 # 🖼️ Fotogalerie alba
  ├── adrspach-2024.md
  ├── tatry-2024.md
  └── treninky-2024.md
assets/
  ├── css/style.css      # Veškerý CSS (600+ řádků)
  ├── js/main.js         # JS pro nav toggle, smooth scroll
  └── images/
      ├── bg.webp        # Body background (Alpy)
      └── placeholder.svg # Placeholder pro obrázky
docs/
  └── plans/             # Plány migrace a dokumentace
logo.png                 # AKA hexagon logo
index.md                 # Homepage
events.md                # Event listing (permalink: /akce/) - JavaScript pagination
articles/index.html      # Articles listing (permalink: /clanky/)
gallery/index.html       # Gallery listing (permalink: /galerie/)
kontakt.md               # Kontakt stránka
o-nas.md                 # O nás stránka
robots.txt               # SEO
Gemfile                  # Jekyll 3.9, jekyll-paginate (nepoužívá se)
```

## Jekyll Posts s kategoriemi - jak to funguje

**DŮLEŽITÉ:** Posts jsou organizované v podadresářích podle typu!

**Event file (_posts/event/2025-01-10-vysocina-2025.md):**
```yaml
---
categories: [event]      # ⭐ Jednotné číslo "event"!
permalink: /akce/:title/
title: Vysočina 2025
date_begin: 2025-01-10   # ⭐ Začátek akce (ne "date"!)
date_end: 2025-01-12     # Konec akce (volitelné)
author: "John Doe"       # Autor/organizátor
image: https://url-obrazku.jpg
---
Popis v markdown...
```

**Article file (_posts/article/methodology/2024-01-15-zakladni-lezecka-metodika.md):**
```yaml
---
categories: [article, methodology]  # Hlavní + podkategorie
permalink: /clanky/:title/
title: Základní lezecká metodika
date: 2024-01-15         # Pro Jekyll řazení
date_created: 2024-01-15 # Datum vytvoření článku
author: "John Doe"       # Autor článku
image: https://url-obrazku.jpg
---
Popis v markdown...
```

**Výsledek:**
- Jekyll vytvoří stránku: `/akce/vysocina-2025/` nebo `/clanky/zakladni-lezecka-metodika/`
- `events.md` loopuje přes `site.posts` s filtrem `post.categories contains 'event'`
- **JavaScript pagination** - 9 eventů na stránku (ne jekyll-paginate!)
- Layout `post.html` renderuje detail (article styl)

**Proč JavaScript pagination?**
- `jekyll-paginate` v1.1 (GitHub Pages) funguje POUZE na `index.html` v root
- Nepodporuje pagination v podadresářích (např. `akce/index.html`)
- JavaScript řešení je spolehlivější a flexibilnější

## Podkategorie článků (_data/categories.yml)

Články mají podkategorie definované v `_data/categories.yml`:

| Podkategorie | Popis | Permalink |
|--------------|-------|-----------|
| `methodology` | Metodiky a návody | `/clanky/metodika/` |
| `diary` | Deníčky z výprav | `/clanky/denicek/` |
| `club` | Klubové zprávy | `/clanky/klub/` |
| `news` | Různé zprávy | `/clanky/zpravy/` |
| `archive` | Archivní články | `/clanky/archiv/` |

Soubory článků jsou uloženy v odpovídajících podadresářích:
`_posts/article/{podkategorie}/YYYY-MM-DD-nazev.md`

## Jekyll Albums collection - fotogalerie

**Album file (_albums/tatry-2024.md):**
```yaml
---
title: Vysoké Tatry 2024
date: 2024-08-15
cover_image: URL
images:
  - url: URL
    caption: Popis fotky
---
Popis alba...
```

**Výsledek:**
- Layout `album.html` s lightbox funkčností
- Gallery listing na `/galerie/`
- Permalink: `/galerie/tatry-2024/`

## Design systém

**Barvy:**
- Primary: #1a1a1a (černá)
- Secondary: #333333
- Accent: #ffffff
- Light: #f5f5f5

**Fonts:**
- Headings: Montserrat, weight 700
- Body: Roboto
- Letter-spacing: 0.5px

**Styl:**
- Konzervativní, ne příliš moderní
- Zaoblené rohy (border-radius: 8px, 12px)
- Jemné stíny
- Smooth transitions

**Komponenty:**
- `.btn.btn-primary` - button
- `.event-card` - event karta
- `.event-grid` - grid pro events (3 sloupce)
- `.card` / `.cards` - obecné karty
- `.album-card` - album karta pro galerii

## Git workflow reminder

```bash
git add .
git commit -m "České zprávy bez emoji"
git push origin master
# Pak čekat 2-3 min na GitHub Actions
# Kontrola: https://github.com/Aka-Praha/aka-praha.github.io/actions
```

## Časté problémy

**Build fails:**
- Kontroluj GitHub Actions log
- Častá chyba: chybějící gem, syntax error v YAML
- Jekyll 3.9 potřebuje kramdown-parser-gfm

**Stránky se neaktualizují:**
- Zkontroluj že build prošel (zelený ✓)
- Počkej 2-3 minuty
- Hard refresh (Ctrl+Shift+R)

**Event se nezobrazuje na /akce/:**
- ⭐ Musí být v `_posts/event/` podadresáři!
- ⭐ Musí mít `categories: [event]` (jednotné číslo!)
- Musí mít `permalink: /akce/:title/`
- YAML front matter musí být validní
- Soubor musí být commitnutý a pushnutý
- JavaScript v `events.md` filtruje podle `post.categories contains 'event'`

**Pagination nefunguje:**
- Aktuálně se používá **JavaScript pagination**, ne jekyll-paginate
- Pokud děláš změny v pagination logikou, uprav JavaScript v `events.md`
- Jekyll-paginate v1.1 má omezení a NEpoužívá se

## Co si pamatovat o Ondrovi

- Akademický klub alpinistů (horolezci, ne anatomové!)
- Chce konzervativní design
- Není fan emoji
- Používá master větev
- Má přístup jako ondra-pazi na GitHubu
- SSH klíč sdílený mezi více účty
- Pracujeme přes git push, ne lokálně

## Budoucí práce (až Ondra řekne)

- Migrace dat z Drupalu (300+ článků, 150+ akcí)
- Filtry JS pro akce (rok, člen)
- Fulltext search
- Rozšíření fotogalerie (více alb)
- Možná RSS feed pro články

## Reference (když budeš potřebovat)

- Jekyll Posts: https://jekyllrb.com/docs/posts/
- Jekyll Collections: https://jekyllrb.com/docs/collections/
- Liquid syntax: https://shopify.github.io/liquid/
- Jekyll na GitHub Pages: https://docs.github.com/en/pages

## Klíčové věci pro debugging

**Když něco nefunguje, zkontroluj:**
1. Je to v masteru? (ne main)
2. YAML front matter validní?
3. Event má `categories: [event]` a je v `_posts/event/`?
4. Article má `categories: [article, podkategorie]` a je v `_posts/article/{podkategorie}/`?
5. Post má správný `permalink:`?
6. CSS třídy anglicky?
7. Build prošel na GitHubu?
8. Čekal jsi 2-3 minuty?
9. JavaScript v events.md správně filtruje podle kategorie?

## Technické detaily

**Jekyll paginate:**
- Plugin `jekyll-paginate` je v Gemfile, ale NEpoužívá se
- Důvod: Nefunguje v podadresářích, pouze na root index.html
- Místo toho: JavaScript pagination v events.md

**Categories vs Category:**
- ⭐ **Vždy používej `categories:` (množné číslo)!**
- Jekyll podporuje obojí, ale `categories:` je standard
- Filtrování eventů: `post.categories contains 'event'`
- Filtrování článků: `post.categories contains 'article'`

**Posts s více kategoriemi:**
```yaml
categories: [article, methodology]  # Článek + podkategorie
categories: [event, featured]       # Event + featured (možné do budoucna)
```

---

**Poslední update:** 20.12.2025
**Status:** Fungující web s posts v podadresářích (event/article), fotogalerií, kontaktem. Články mají podkategorie (methodology, diary, club, news, archive). Eventy používají date_begin/date_end/author, články date_created/author. Používá JavaScript pagination. Čeká se na migraci dat z Drupalu.
