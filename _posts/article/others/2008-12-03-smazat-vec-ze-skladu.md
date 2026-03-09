---
categories: [content, article, others]
permalink: /clanky/ostatni/smazat-vec-ze-skladu/
title: "Smazat věc ze skladu"
date_created: 2008-12-03
author: "Irena Horáčková"
---

uid; $uzivatele = db_query("SELECT * FROM {users_roles} WHERE uid=$uid"); $povoleni = 0; while ( $uzivatel = db_fetch_object($uzivatele)){ if (($uzivatel->rid == 4)||($uzivatel->rid == 4)){ $povoleni = 1; } } $veci = db_query("SELECT * FROM sklad WHERE kategorie=1 order by druh"); echo" Druh Popis Množství "; echo "**Lezecký materiál**"; while ($vec = db_fetch_object($veci)) { echo ""; echo $vec->druh; echo ""; echo $vec->popis; echo ""; echo $vec->mnozstvi; if ($povoleni){ echo ""; echo ''; echo 'id; echo '">'; echo ''; } echo ""; } $veci = db_query("SELECT * FROM sklad WHERE kategorie=2 order by druh"); echo " **Lavinový materiál**"; while ($vec = db_fetch_object($veci)) { echo ""; echo $vec->druh; echo ""; echo $vec->popis; echo ""; echo $vec->mnozstvi; if ($povoleni){ echo ""; echo ''; echo 'id; echo '">'; echo ''; } echo ""; } $veci = db_query("SELECT * FROM sklad WHERE kategorie=3 order by druh"); echo "**Zimní materiál lezecký**"; while ($vec = db_fetch_object($veci)) { echo ""; echo $vec->druh; echo ""; echo $vec->popis; echo ""; echo $vec->mnozstvi; if ($povoleni){ echo ""; echo ''; echo 'id; echo '">'; echo ''; } echo ""; } $veci = db_query("SELECT * FROM sklad WHERE kategorie=4 order by druh"); echo "**Skoby a kladiva**"; while ($vec = db_fetch_object($veci)) { echo ""; echo $vec->druh; echo ""; echo $vec->popis; echo ""; echo $vec->mnozstvi; if ($povoleni){ echo ""; echo ''; echo 'id; echo '">'; echo ''; } echo ""; } $veci = db_query("SELECT * FROM sklad WHERE kategorie=5 order by druh"); echo "**Ostatní materiál**"; while ($vec = db_fetch_object($veci)) { echo ""; echo $vec->druh; echo ""; echo $vec->popis; echo ""; echo $vec->mnozstvi; if ($povoleni){ echo ""; echo ''; echo 'id; echo '">'; echo ''; } echo ""; } echo ""; ?>

[Seznam možností práce se skladem](moznosti_sklad)
