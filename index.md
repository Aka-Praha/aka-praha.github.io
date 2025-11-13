---
layout: home
title: Domů
---

<section id="o-nas">

## O nás

Akademický klub alpinistů Praha (AKA Praha) je společenství nadšenců pro horolezectví, skalní lezení a outdoorové aktivity. Spojujeme studenty a absolventy vysokých škol, kteří sdílejí lásku k horám a přírodě.

## Nejbližší akce

<div class="event-grid">
{% assign sorted_events = site.categories.events | sort: 'date' | reverse %}
{% for event in sorted_events limit:3 %}
  <a href="{{ event.url | relative_url }}" class="event-card-link">
    <div class="event-card">
      <div class="event-image" style="background-image: url('{{ event.image }}');"></div>
      <div class="event-content">
        <h3 class="event-title">{{ event.title }}</h3>
        <p class="event-date">
          <svg class="event-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
          </svg>
          {{ event.date | date: "%d.%m.%Y" }}{% if event.date_end %} - {{ event.date_end | date: "%d.%m.%Y" }}{% endif %}
        </p>
      </div>
    </div>
  </a>
{% endfor %}
</div>

<p style="text-align: center; margin-top: 2rem;">
  <a href="/akce/" class="btn btn-primary">Všechny akce →</a>
</p>

</section>

<div class="rope-divider"></div>

<section id="aktivity">

## Naše aktivity

- **Pravidelné tréninky** na lezeckých stěnách
- **Víkendové výjezdy** na české i zahraniční skály
- **Horolezecké expedice** do Alp, Tater a dalších pohoří
- **Kurzy a workshopy** pro začátečníky i pokročilé
- **Společenské akce** a setkání členů

</section>

<div class="rope-divider"></div>

<section id="kontakt">

## Připojte se k nám

Zajímá vás horolezectví? Chcete se k nám připojit? Kontaktujte nás!

**Email:** info@aka-praha.cz

</section>
