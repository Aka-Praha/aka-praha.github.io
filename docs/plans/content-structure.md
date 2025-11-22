# Content Structure Plan

Plán pro reorganizaci obsahu webu AKA Praha s třístupňovou hierarchií kategorií.

## Konvence

- **Kód**: Anglicky (jednotné číslo: `methodology`, `diary`, `club`, `news`)
- **URL**: Česky (`/clanky/metodika/`, `/clanky/denicek/`)
- **Categories**: Anglicky, malá písmena, bez diakritiky, jednotné číslo

## Struktura adresářů

```
_posts/
├── event/
│   ├── 2025-01-10-vysocina-2025.md           → categories: [content, event]
│   └── 2025-07-07-adrspach-2025.md           → categories: [content, event]
└── article/
    ├── methodology/
    │   └── 2024-05-15-zakladni-technika.md   → categories: [content, article, methodology]
    ├── diary/
    │   └── 2024-08-20-tatry.md               → categories: [content, article, diary]
    ├── club/
    │   └── 2024-12-01-valna-hromada.md       → categories: [content, article, club]
    └── news/
        └── 2024-11-15-nova-stena.md          → categories: [content, article, news]
```

## Kategorie metadata

Soubor `_data/categories.yml`:

```yaml
article:
  methodology:
    title: "Metodika"
    description: "Lezecké návody a techniky"
    color: "#2c3e50"
    icon: "📚"
    permalink: /clanky/metodika/

  diary:
    title: "Deníček"
    description: "Deníčky z výprav a akcí"
    color: "#16a085"
    icon: "✍️"
    permalink: /clanky/denicek/

  club:
    title: "Klub"
    description: "Zprávy o klubu AKA Praha"
    color: "#e74c3c"
    icon: "🏔️"
    permalink: /clanky/klub/

  news:
    title: "Různé zprávy"
    description: "Novinky a aktuality"
    color: "#f39c12"
    icon: "📰"
    permalink: /clanky/zpravy/
```

## Front Matter příklady

### Event (akce)

```yaml
---
categories: [content, event]
permalink: /akce/:title/
title: Vysočina 2025
date: 2025-01-10
date_end: 2025-01-12
image: https://images.unsplash.com/...
---
```

### Article - Methodology (metodika)

```yaml
---
categories: [content, article, methodology]
permalink: /clanky/metodika/:title/
title: Základní lezecká technika
date: 2024-05-15
image: https://images.unsplash.com/...
---
```

### Article - Diary (deníček)

```yaml
---
categories: [content, article, diary]
permalink: /clanky/denicek/:title/
title: Deníček z Vysokých Tater 2024
date: 2024-08-20
image: https://images.unsplash.com/...
---
```

### Article - Club (klub)

```yaml
---
categories: [content, article, club]
permalink: /clanky/klub/:title/
title: Valná hromada 2024
date: 2024-12-01
---
```

### Article - News (různé zprávy)

```yaml
---
categories: [content, article, news]
permalink: /clanky/zpravy/:title/
title: Nová lezecká stěna v Praze
date: 2024-11-15
---
```

## URL struktura

```
/                                           → homepage (3 nejnovější z content)
/akce/                                      → všechny akce (event)
/akce/vysocina-2025/                       → detail akce

/clanky/                                    → všechny články (přehled podkategorií)
/clanky/metodika/                          → články metodiky (methodology)
/clanky/denicek/                           → deníčky (diary)
/clanky/klub/                              → zprávy o klubu (club)
/clanky/zpravy/                            → různé zprávy (news)
/clanky/metodika/zakladni-technika/        → detail článku
```

## Fyzická struktura stránek

```
clanky/
  index.html                  → /clanky/ (přehled všech podkategorií)
  metodika/
    index.html                → /clanky/metodika/ (listing methodology)
  denicek/
    index.html                → /clanky/denicek/ (listing diary)
  klub/
    index.html                → /clanky/klub/ (listing club)
  zpravy/
    index.html                → /clanky/zpravy/ (listing news)
```

## Filtrování v šablonách

### Homepage - 3 nejnovější z content
```liquid
{% assign latest_content = site.posts | where_exp: "post", "post.categories contains 'content'" | limit: 3 %}
```

### /akce/ - jen události
```liquid
{% for post in site.posts %}
  {% if post.categories contains 'event' %}
    <!-- zobraz akci -->
  {% endif %}
{% endfor %}
```

### /clanky/ - všechny články
```liquid
{% for post in site.posts %}
  {% if post.categories contains 'article' %}
    <!-- zobraz článek -->
  {% endif %}
{% endfor %}
```

### /clanky/metodika/ - jen methodology
```liquid
{% for post in site.posts %}
  {% if post.categories contains 'article' and post.categories contains 'methodology' %}
    <!-- zobraz článek metodiky -->
  {% endif %}
{% endfor %}
```

## Hierarchie kategorií

```
content (pro homepage feed)
├── event → /akce/
│   └── jednotlivé akce
└── article → /clanky/
    ├── methodology → /clanky/metodika/
    ├── diary → /clanky/denicek/
    ├── club → /clanky/klub/
    └── news → /clanky/zpravy/
```

## Best Practices (podle Codex)

1. **Konzistence** - fyzická složka musí odpovídat kategorii v front matter
2. **Malá písmena bez diakritiky** v categories (methodology, diary, club, news)
3. **Jednotné číslo** - používáme singular form (event, article, methodology)
4. **Jeden zdroj pravdy** - kategorie v front matter, ne z cesty
5. **Metadata v _data/categories.yml** - barvy, ikony, titulky pro UI
6. **Content kategorie** - používáme jen pro homepage feed

## Layout strategie

Každá podkategorie může mít vlastní layout nebo parametry:

### Možnost 1: Společný layout s parametry
```yaml
---
layout: article-category
category: methodology
---
```

### Možnost 2: Vlastní layout
```yaml
---
layout: article-methodology
---
```

### Možnost 3: Vlastní HTML v souboru
```html
---
layout: page
---
<div class="methodology-specific-content">
  <!-- vlastní HTML pro metodiku -->
</div>
```

## Migrace stávajících postů

1. Přesunout eventy do `_posts/event/`
2. Přesunout články do `_posts/article/{subcategory}/`
3. Aktualizovat front matter - přidat categories (singular form)
4. Zkontrolovat permalinky

## Implementační kroky

1. ✅ Vytvořit `docs/plans/content-structure.md`
2. ⏳ Vytvořit adresářovou strukturu v `_posts/`
3. ⏳ Vytvořit `_data/categories.yml`
4. ⏳ Aktualizovat stávající posty (categories + přesun)
5. ⏳ Vytvořit listing stránky pro podkategorie
6. ⏳ Aktualizovat `/clanky/` - přehled podkategorií
7. ⏳ Aktualizovat `/akce/` - přidat content kategorii
8. ⏳ Přidat homepage feed s 3 nejnovějšími z content
9. ⏳ Testovat a commitnout

---

**Datum vytvoření**: 2025-01-22
**Status**: Plánování dokončeno, čeká se na implementaci
