---
layout: home
title: Domů
---

## Nejbližší akce

<div class="event-grid">
{% assign all_posts = site.posts | sort: 'date' | reverse %}
{% assign event_count = 0 %}
{% for event in all_posts %}
{% if event.categories contains 'event' and event_count < 3 %}
{% assign event_count = event_count | plus: 1 %}
  <a href="{{ event.url | relative_url }}" class="event-card-link">
    <div class="event-card">
      <img src="{% if event.image %}{{ event.image }}{% else %}/logo.png{% endif %}" alt="{{ event.title }}" class="event-image{% unless event.image %} fallback-image{% endunless %}" loading="lazy">
      <div class="event-content">
        <h3 class="event-title">{{ event.title }}</h3>
        <p class="event-date">
          <svg class="event-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
          </svg>
          {{ event.date_begin | date: "%d.%m.%Y" }}{% if event.date_end %} - {{ event.date_end | date: "%d.%m.%Y" }}{% endif %}
        </p>
      </div>
    </div>
  </a>
{% endif %}
{% endfor %}
</div>

<p style="text-align: center; margin-top: 2rem;">
  <a href="/akce/" class="btn btn-primary">Všechny akce →</a>
</p>

## Kalendář

<div class="calendar-wrapper">
<iframe src="https://calendar.google.com/calendar/embed?height=450&wkst=2&ctz=Europe%2FPrague&showCalendars=0&hl=cs&title=AKA%20Praha&src=M2UyN2JiYzVhMzNjYzYzYzgzMGI2NmY5MmRjY2ViYmYyZjIzMjgzODdjNmMwZmY1M2I2NWFlZGE0OWQ1NDMyMkBncm91cC5jYWxlbmRhci5nb29nbGUuY29t&color=%23fc6d41" style="border:0" width="100%" height="450" frameborder="0" scrolling="no"></iframe>
</div>
