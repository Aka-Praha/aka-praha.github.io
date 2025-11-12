---
layout: page
title: Akce
permalink: /akce/
pagination:
  enabled: true
  category: events
  permalink: /strana/:num/
---

<p class="event-intro">Novou akci můžete vložit zde.</p>

<div class="event-grid">
{% for event in paginator.posts %}
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

{% if paginator.total_pages > 1 %}
<div class="pagination">
  <div class="pagination-container">
    {% if paginator.previous_page %}
      <a href="{{ paginator.previous_page_path | relative_url }}" class="pagination-btn">← Předchozí</a>
    {% endif %}

    <div class="pagination-numbers">
      {% for page in (1..paginator.total_pages) %}
        {% if page == 1 or page == paginator.total_pages or page == paginator.page or page == paginator.page | minus: 1 or page == paginator.page | plus: 1 %}
          {% if page == paginator.page %}
            <span class="pagination-number active">{{ page }}</span>
          {% else %}
            {% if page == 1 %}
              <a href="{{ '/akce/' | relative_url }}" class="pagination-number">{{ page }}</a>
            {% else %}
              <a href="{{ site.baseurl }}/akce/strana/{{ page }}/" class="pagination-number">{{ page }}</a>
            {% endif %}
          {% endif %}
        {% elsif page == paginator.page | minus: 2 or page == paginator.page | plus: 2 %}
          <span class="pagination-dots">...</span>
        {% endif %}
      {% endfor %}
    </div>

    {% if paginator.next_page %}
      <a href="{{ paginator.next_page_path | relative_url }}" class="pagination-btn">Další →</a>
    {% endif %}
  </div>
</div>
{% endif %}
