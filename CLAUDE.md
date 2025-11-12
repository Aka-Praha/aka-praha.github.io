# CLAUDE.md - Context Memory

Memory pro budoucí Claude sessions. Tohle je reálný projekt pro Akademický klub alpinistů Praha.

## Základní info

- **URL:** https://aka-praha.github.io/
- **Repo:** https://github.com/Aka-Praha/aka-praha.github.io
- **Tech:** Jekyll 3.9, GitHub Pages, automatický deploy z `master` větve
- **Uživatel:** Ondra (ondra-pazi na GitHubu)
- **Původní web:** Drupal na http://localhost:8081/ (300+ článků, 150+ akcí čeká na migraci)

## Aktuální stav (November 2025)

**✅ Hotovo:**
- Základní struktura webu + design
- Černobílý konzervativní design podle loga AKA (hexagon s horami)
- Hero sekce s fotkou Alp na pozadí (assets/images/bg.webp)
- Responzivní layout
- Jekyll Collections pro akce (_events/)
- Event listing page (/akce/) s gridem karet
- Event detail pages (/akce/nazev-akce/) s prokliky
- Logo v navigaci
- 6 demo akcí jako příklady

**🚧 Ještě není:**
- Migrace 300+ článků z Drupalu
- Migrace 150+ akcí z Drupalu
- Fotogalerie
- Filtry pro akce (rok/člen)
- Stránky: O nás, Kontakt (jen dummy v menu)

## Důležité konvence (MUSÍŠ DODRŽET)

1. **Kód anglicky, URL česky**
   - Složky: `_events/` ne `_akce/`
   - CSS třídy: `.event-card` ne `.akce-card`
   - Ale URL: `/akce/` pomocí `permalink: /akce/`

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
_config.yml              # Jekyll config
_layouts/
  ├── default.html       # Base layout
  ├── home.html          # Homepage s jednoduchým headerem
  ├── page.html          # Běžné stránky
  └── post.html          # Detail akce/článku
_includes/
  ├── header.html        # Nav + logo
  └── footer.html        # Footer
_posts/                  # ⭐ Posts - akce (events) a články (diaries)
  ├── 2025-01-10-vysocina-2025.md
  ├── 2025-07-07-adrspach-2025.md
  └── ... (18 eventů)
assets/
  ├── css/style.css      # Veškerý CSS (600+ řádků)
  ├── js/main.js         # JS pro nav toggle, smooth scroll
  └── images/
      └── bg.webp        # Hero background (Alpy) - použito na celém body
logo.png                 # AKA hexagon logo
index.md                 # Homepage
events.md                # Event listing (permalink: /akce/) s pagination
Gemfile                  # Jekyll 3.9, kramdown-parser-gfm
```

## Jekyll Posts s kategoriemi - jak to funguje

**Post file (_posts/2025-01-10-vysocina-2025.md):**
```yaml
---
category: events
permalink: /akce/:title/
title: Vysočina 2025
date: 2025-01-10
date_end: 2025-01-12
image: https://url-obrazku.jpg
---
Popis v markdown...
```

**Výsledek:**
- Jekyll vytvoří stránku: `/akce/vysocina-2025/`
- `events.md` loopuje přes `site.categories.events`
- JavaScript pagination - 9 eventů na stránku
- Layout `post.html` renderuje detail (article styl)

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

**Event se nezobrazuje:**
- Musí být v `_events/`
- YAML front matter musí být validní
- Soubor musí být commitnutý a pushnutý

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
- Vytvořit collection pro články (_posts/ nebo _articles/)
- Fotogalerie (možná external service?)
- Filtry JS pro akce (rok, člen)
- Stránky: O nás, Kontakt
- Možná blog/novinky

## Reference (když budeš potřebovat)

- Jekyll Collections: https://jekyllrb.com/docs/collections/
- Liquid syntax: https://shopify.github.io/liquid/
- Jekyll na GitHub Pages: https://docs.github.com/en/pages

## Klíčové věci pro debugging

**Když něco nefunguje, zkontroluj:**
1. Je to v masteru? (ne main)
2. YAML front matter validní?
3. Collection správně v _config.yml?
4. CSS třídy anglicky?
5. Permalink nastavený správně pro české URL?
6. Build prošel na GitHubu?
7. Čekal jsi 2-3 minuty?

---

**Poslední update:** 11.11.2025
**Status:** Fungující základní web s event collections, čeká se na další instrukce od Ondry.
