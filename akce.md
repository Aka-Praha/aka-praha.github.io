---
layout: page
title: Akce
---

<p class="akce-intro">Novou akci můžete vložit zde.</p>

<div class="akce-grid">
{% for akce in site.akce %}
  <div class="akce-card">
    <div class="akce-image" style="background-image: url('{{ akce.image }}');"></div>
    <div class="akce-content">
      <h3 class="akce-title">{{ akce.title }}</h3>
      <p class="akce-date">
        <svg class="akce-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
          <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
        </svg>
        {{ akce.date_start | date: "%d.%m.%Y" }}{% if akce.date_end %} - {{ akce.date_end | date: "%d.%m.%Y" }}{% endif %}
      </p>
    </div>
  </div>
{% endfor %}
</div>
