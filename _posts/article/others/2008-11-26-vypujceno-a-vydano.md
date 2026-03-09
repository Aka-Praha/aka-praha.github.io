---
categories: [content, article, others]
permalink: /clanky/ostatni/vypujceno-a-vydano/
title: "Vypůjčeno a vydáno"
date_created: 2008-11-26
author: "Irena Horáčková"
---

name. '** si na termín **'.$_POST['odkdy'].' - '.$_POST['dokdy'].'** vypůjčil následující:**
'; while ($vec = db_fetch_object($veci)) { if ($_POST[$vec->id] > 0){ $cas = time(); $zacatek = strtotime($_POST['odkdy']); $konec= strtotime($_POST['dokdy']); $values = array ( $user_id, $vec->id, $_POST[$vec->id], $cas, $zacatek, $konec, $_POST['poznamka']); $msg = "INSERT INTO vypujcky(idUzivatel, idVec, mnozstvi, termin_vyzvednuti, termin_zacatku, termin_konce, poznamka) VALUES(%d, %d, %d, %d, %d, %d, '%s')"; echo $vec->druh.' ('.$vec->popis.') - množství '.$_POST[$vec->id]; if (db_query($msg, $values)){ echo '
'; } else{ echo ' - CHYBA - nepovedlo se zapsat do databáze.
'; } echo "

"; } } ?> Další možnosti výpisů**
- [Seznam možností](moznosti_sklad)
- [Seznam skladu](seznam_skladu)
- [Seznam rezervací](rezervace_sklad)
- [Seznam nevrácených výpůjček](seznam_nevracenych)
- [Seznam vrácených výpůjček](seznam_vracenych)
- [Seznam mých restů](moje_resty)
