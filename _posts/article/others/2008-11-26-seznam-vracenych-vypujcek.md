---
categories: [content, article, others]
permalink: /clanky/ostatni/seznam-vracenych-vypujcek/
title: "Seznam vrácených výpůjček"
date_created: 2008-11-26
author: "Irena Horáčková"
---

Kdo Co Kolik Od kdy Do kdy Vyzvednuto Vráceno Poznámka"; foreach ($vypujcky as $vypujcka){ echo ""; $users = user_load_multiple(array(), array('uid' => $vypujcka->idUzivatel)); $kdo= reset($users); echo $kdo->name; echo ""; $db_vec = db_query("SELECT * FROM sklad WHERE id=$vypujcka->idVec"); $vec = $db_vec->fetchObject(); echo $vec->druh.' ('.$vec->popis.')'; echo ""; echo $vypujcka->mnozstvi; echo ""; echo date('d.m.y', $vypujcka->termin_zacatku); echo ""; echo date('d.m.y', $vypujcka->termin_konce); echo ""; echo date('d.m.y', $vypujcka->termin_vyzvednuti); echo ""; echo date('d.m.y', $vypujcka->termin_vraceni); echo ""; echo $vypujcka->poznamka; echo ""; echo ''; echo 'id; echo '">'; echo ''; echo ""; } echo ""; ?> **Další možnosti výpisů**
- [Seznam možností](moznosti_sklad)
- [Seznam skladu](seznam_skladu)
- [Seznam rezervací](rezervace_sklad)
- [Seznam nevrácených výpůjček](seznam_nevracenych)
- [Seznam mých restů](moje_resty)
