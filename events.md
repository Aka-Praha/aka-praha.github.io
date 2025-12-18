---
layout: default
permalink: /akce/
---

<div class="content-wrapper page-content">
<div class="page-header-with-pagination">
  <h1>Akce</h1>
  <div class="pagination" id="paginationTop"></div>
</div>

<div class="event-grid" id="eventGrid">
{% assign all_posts = site.posts | sort: 'date' | reverse %}
{% for post in all_posts %}
  {% if post.categories contains 'event' %}
  <a href="{{ post.url | relative_url }}" class="event-card-link" data-event-item>
    <div class="event-card">
      <img src="{% if post.image %}{{ post.image }}{% else %}/assets/images/placeholder.svg{% endif %}" alt="{{ post.title }}" class="event-image" loading="lazy">
      <div class="event-content">
        <h3 class="event-title">{{ post.title }}</h3>
        <p class="event-date">
          <svg class="event-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
          </svg>
          {{ post.date | date: "%d.%m.%Y" }}{% if post.date_end %} - {{ post.date_end | date: "%d.%m.%Y" }}{% endif %}
        </p>
      </div>
    </div>
  </a>
  {% endif %}
{% endfor %}
</div>

<div class="pagination" id="pagination"></div>

<script>
(function() {
    const itemsPerPage = 9;
    let currentPage = 1;

    const eventItems = document.querySelectorAll('[data-event-item]');
    const paginationTop = document.getElementById('paginationTop');
    const paginationBottom = document.getElementById('pagination');
    const totalPages = Math.ceil(eventItems.length / itemsPerPage);

    function showPage(page, scrollToTop = true) {
        currentPage = page;

        // Hide all items
        eventItems.forEach((item, index) => {
            const startIndex = (page - 1) * itemsPerPage;
            const endIndex = startIndex + itemsPerPage;

            if (index >= startIndex && index < endIndex) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });

        renderPagination();
        if (scrollToTop) {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    }

    function renderPagination() {
        if (totalPages <= 1) {
            paginationTop.innerHTML = '';
            paginationBottom.innerHTML = '';
            return;
        }

        let html = '<div class="pagination-container">';

        // Previous button
        if (currentPage > 1) {
            html += `<button class="pagination-btn" onclick="eventPagination.goToPage(${currentPage - 1})">← Předchozí</button>`;
        }

        // Page numbers
        html += '<div class="pagination-numbers">';
        for (let i = 1; i <= totalPages; i++) {
            if (i === 1 || i === totalPages || (i >= currentPage - 1 && i <= currentPage + 1)) {
                const activeClass = i === currentPage ? 'active' : '';
                html += `<button class="pagination-number ${activeClass}" onclick="eventPagination.goToPage(${i})">${i}</button>`;
            } else if (i === currentPage - 2 || i === currentPage + 2) {
                html += '<span class="pagination-dots">...</span>';
            }
        }
        html += '</div>';

        // Next button
        if (currentPage < totalPages) {
            html += `<button class="pagination-btn" onclick="eventPagination.goToPage(${currentPage + 1})">Další →</button>`;
        }

        html += '</div>';
        paginationTop.innerHTML = html;
        paginationBottom.innerHTML = html;
    }

    // Expose functions globally
    window.eventPagination = {
        goToPage: showPage
    };

    // Initialize (don't scroll on first load)
    showPage(1, false);
})();
</script>
</div>
