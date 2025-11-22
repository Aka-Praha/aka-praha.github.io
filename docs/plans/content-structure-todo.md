# Content Structure - Detailní TODO List

Elementární kroky pro implementaci nové struktury obsahu.

## 1. Příprava - Vytvoření adresářové struktury

- [ ] Vytvořit adresář `_posts/event/`
- [ ] Vytvořit adresář `_posts/article/`
- [ ] Vytvořit adresář `_posts/article/methodology/`
- [ ] Vytvořit adresář `_posts/article/diary/`
- [ ] Vytvořit adresář `_posts/article/club/`
- [ ] Vytvořit adresář `_posts/article/news/`
- [ ] Vytvořit adresář `_data/` (pokud neexistuje)

## 2. Vytvoření metadata - _data/categories.yml

- [ ] Vytvořit soubor `_data/categories.yml`
- [ ] Přidat sekci `article:` do categories.yml
- [ ] Přidat metadata pro `methodology` (title, description, color, icon, permalink)
- [ ] Přidat metadata pro `diary`
- [ ] Přidat metadata pro `club`
- [ ] Přidat metadata pro `news`

## 3. Migrace stávajících postů - Events

- [ ] Najít všechny stávající event posty (grep/glob)
- [ ] Přesunout první event post do `_posts/event/`
- [ ] Aktualizovat front matter: přidat `categories: [content, event]`
- [ ] Zkontrolovat permalink: `permalink: /akce/:title/`
- [ ] Opakovat pro všechny zbývající event posty (18 eventů)
- [ ] Otestovat, že eventy se zobrazují na /akce/

## 4. Migrace stávajících postů - Articles

- [ ] Najít všechny stávající article posty
- [ ] Rozhodnout kategorii pro každý článek (methodology/diary/club/news)
- [ ] Přesunout články do příslušných adresářů v `_posts/article/{subcategory}/`
- [ ] Aktualizovat front matter: přidat `categories: [content, article, {subcategory}]`
- [ ] Aktualizovat permalink podle podkategorie:
  - [ ] methodology: `permalink: /clanky/metodika/:title/`
  - [ ] diary: `permalink: /clanky/denicek/:title/`
  - [ ] club: `permalink: /clanky/klub/:title/`
  - [ ] news: `permalink: /clanky/zpravy/:title/`

## 5. Vytvoření listing stránek - Struktura

- [ ] Vytvořit adresář `clanky/metodika/`
- [ ] Vytvořit adresář `clanky/denicek/`
- [ ] Vytvořit adresář `clanky/klub/`
- [ ] Vytvořit adresář `clanky/zpravy/`

## 6. Vytvoření listing stránky - Methodology

- [ ] Vytvořit soubor `clanky/metodika/index.html`
- [ ] Nastavit front matter (layout, title, permalink)
- [ ] Přidat Liquid filtr pro `article` AND `methodology`
- [ ] Přidat grid/list zobrazení článků
- [ ] Přidat CSS styling (použít barvu z categories.yml)
- [ ] Přidat breadcrumb navigaci
- [ ] Přidat pagination (pokud potřeba)

## 7. Vytvoření listing stránky - Diary

- [ ] Vytvořit soubor `clanky/denicek/index.html`
- [ ] Nastavit front matter
- [ ] Přidat Liquid filtr pro `article` AND `diary`
- [ ] Přidat zobrazení článků
- [ ] Přidat CSS styling
- [ ] Přidat breadcrumb navigaci

## 8. Vytvoření listing stránky - Club

- [ ] Vytvořit soubor `clanky/klub/index.html`
- [ ] Nastavit front matter
- [ ] Přidat Liquid filtr pro `article` AND `club`
- [ ] Přidat zobrazení článků
- [ ] Přidat CSS styling
- [ ] Přidat breadcrumb navigaci

## 9. Vytvoření listing stránky - News

- [ ] Vytvořit soubor `clanky/zpravy/index.html`
- [ ] Nastavit front matter
- [ ] Přidat Liquid filtr pro `article` AND `news`
- [ ] Přidat zobrazení článků
- [ ] Přidat CSS styling
- [ ] Přidat breadcrumb navigaci

## 10. Aktualizace hlavní stránky článků - /clanky/

- [ ] Otevřít `articles/index.html`
- [ ] Změnit filtr z `categories contains 'events'` na `categories contains 'article'`
- [ ] Přidat sekci s přehledem podkategorií (4 karty: methodology, diary, club, news)
- [ ] Použít data z `_data/categories.yml` (title, description, icon, color)
- [ ] Přidat CSS pro category cards
- [ ] Přidat hover efekty
- [ ] Přidat odkazy na jednotlivé podkategorie

## 11. Aktualizace stránky akcí - /akce/

- [ ] Otevřít `events.md`
- [ ] Změnit filtr z `post.categories contains 'events'` na `post.categories contains 'event'`
- [ ] Otestovat, že pagination funguje
- [ ] Otestovat, že JavaScript filtry fungují (pokud jsou)

## 12. Homepage feed - Přidání 3 nejnovějších z content

- [ ] Otevřít `index.md`
- [ ] Přidat sekci "Nejnovější aktuality"
- [ ] Přidat Liquid filtr: `where_exp: "post", "post.categories contains 'content'" | limit: 3`
- [ ] Vytvořit HTML strukturu pro feed items
- [ ] Rozlišit eventy vs články (icon, barva, label)
- [ ] Přidat obrázky (pokud existují)
- [ ] Přidat datum a kategorie
- [ ] Přidat excerpt/popis
- [ ] Přidat CSS styling pro homepage feed
- [ ] Přidat responzivní layout

## 13. CSS - Nové styly

- [ ] Přidat CSS pro `.category-cards` (přehled podkategorií)
- [ ] Přidat CSS pro `.category-card` (jednotlivá karta)
- [ ] Přidat CSS pro `.homepage-feed` (homepage aktuality)
- [ ] Přidat CSS pro `.feed-item` (jednotlivá položka feedu)
- [ ] Přidat CSS pro `.breadcrumb` (breadcrumb navigace)
- [ ] Přidat responzivní media queries pro nové komponenty
- [ ] Otestovat na mobilních zařízeních

## 14. Testování - Lokální kontrola

- [ ] Zkontrolovat všechny URL:
  - [ ] `/` - homepage s feedem
  - [ ] `/akce/` - listing událostí
  - [ ] `/akce/{event-name}/` - detail události
  - [ ] `/clanky/` - přehled podkategorií
  - [ ] `/clanky/metodika/` - listing methodology
  - [ ] `/clanky/denicek/` - listing diary
  - [ ] `/clanky/klub/` - listing club
  - [ ] `/clanky/zpravy/` - listing news
  - [ ] `/clanky/{category}/{article-name}/` - detail článku
- [ ] Zkontrolovat kategorizaci všech postů
- [ ] Zkontrolovat, že homepage feed obsahuje mix eventů a článků
- [ ] Zkontrolovat responzivitu na mobilu

## 15. Testování - Validace dat

- [ ] Ověřit, že všechny posty mají `categories: [content, ...]`
- [ ] Ověřit, že všechny eventy mají `categories: [content, event]`
- [ ] Ověřit, že všechny články mají `categories: [content, article, {subcategory}]`
- [ ] Ověřit, že všechny permalinky jsou správně nastavené
- [ ] Ověřit, že fyzická složka odpovídá kategorii v front matter

## 16. Dokumentace

- [ ] Aktualizovat `CLAUDE.md` s novou strukturou kategorií
- [ ] Přidat příklady front matter pro každou podkategorii
- [ ] Zdokumentovat, jak přidat nový článek do konkrétní podkategorie
- [ ] Aktualizovat sekci "Struktura projektu" v CLAUDE.md

## 17. Git - Commit a push

- [ ] Přidat všechny nové soubory do stage
- [ ] Přidat všechny změněné soubory do stage
- [ ] Vytvořit commit s popisem změn
- [ ] Pushnout do master větve
- [ ] Počkat 2-3 minuty na GitHub Actions build
- [ ] Zkontrolovat build log (zelený ✓)

## 18. Testování - Produkce

- [ ] Otevřít https://aka-praha.github.io/
- [ ] Zkontrolovat homepage feed
- [ ] Zkontrolovat /akce/
- [ ] Zkontrolovat /clanky/
- [ ] Zkontrolovat všechny podkategorie článků
- [ ] Zkontrolovat detaily eventů a článků
- [ ] Zkontrolovat responzivitu
- [ ] Zkontrolovat v různých prohlížečích

## 19. Cleanup (volitelné)

- [ ] Smazat staré prázdné adresáře (pokud existují)
- [ ] Zkontrolovat, že nejsou žádné duplicitní soubory
- [ ] Zkontrolovat console errors v prohlížeči
- [ ] Optimalizovat CSS (odstranit nepoužívané styly)

## 20. Budoucí vylepšení (backlog)

- [ ] Přidat filtry na /clanky/ (filtrovat podle podkategorie)
- [ ] Přidat tagy kromě kategorií
- [ ] Přidat fulltext search
- [ ] Přidat RSS feed pro články
- [ ] Přidat RSS feed pro události
- [ ] Přidat "Související články" na detail stránce
- [ ] Přidat počítadlo článků pro každou podkategorii
- [ ] Přidat archiv podle roku

---

**Status**: Připraveno k implementaci
**Celkem úkolů**: ~100+
**Odhadovaný čas**: 3-4 hodiny práce + waiting na builds

**Poznámka**: Implementace by měla probíhat postupně s commitováním po každé větší části (např. po migraci eventů, po vytvoření listing stránek, atd.), ne všechno najednou.
