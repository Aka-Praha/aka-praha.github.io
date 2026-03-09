---
categories: [content, article, others]
permalink: /clanky/ostatni/moje-resty/
title: "Moje resty"
date_created: 2008-11-26
author: "Irena Horáčková"
---

uid; $vypujcky= db_query("SELECT * FROM vypujcky WHERE termin_vyzvednuti IS NULL AND idUzivatel = $uid ORDER BY termin_zacatku"); echo" Kdo Co Kolik Od kdy Do kdyPoznámka"; foreach ($vypujcky as $vypujcka){ echo ""; $users = user_load_multiple(array(), array('uid' => $vypujcka->idUzivatel)); $kdo= reset($users); echo $kdo->name; echo ""; $db_vec = db_query("SELECT * FROM sklad WHERE id=$vypujcka->idVec"); $vec = $db_vec->fetchObject(); echo $vec->druh.' ('.$vec->popis.')'; echo ""; echo $vypujcka->mnozstvi; echo ""; echo date('d.m.y', $vypujcka->termin_zacatku); echo ""; echo date('d.m.y', $vypujcka->termin_konce); echo ""; echo $vypujcka->poznamka; echo ""; echo ''; echo 'id; echo '">'; echo ''; echo ""; } echo ""; echo "

### Seznam mých nevrácených výpůjček
"; $vypujcky= db_query("SELECT * FROM vypujcky WHERE termin_vyzvednuti IS NOT NULL AND termin_vraceni IS NULL AND idUzivatel = $uid ORDER BY termin_zacatku"); echo" Kdo Co Kolik Od kdy Do kdy Vyzvednuto Poznámka"; foreach ($vypujcky as $vypujcka){ echo ""; $users = user_load_multiple(array(), array('uid' => $vypujcka->idUzivatel)); $kdo= reset($users); echo $kdo->name; echo ""; $db_vec = db_query("SELECT * FROM sklad WHERE id=$vypujcka->idVec"); $vec = $db_vec->fetchObject(); echo $vec->druh.' ('.$vec->popis.')'; echo ""; echo $vypujcka->mnozstvi; echo ""; echo date('d.m.y', $vypujcka->termin_zacatku); echo ""; echo date('d.m.y', $vypujcka->termin_konce); echo ""; echo date('d.m.y', $vypujcka->termin_vyzvednuti); echo ""; echo $vypujcka->poznamka; echo ""; echo ''; echo 'id; echo '">'; echo ''; echo ""; } echo ""; echo "

### Seznam mých vrácených výpůjček
"; $vypujcky= db_query("SELECT * FROM vypujcky WHERE termin_vraceni IS NOT NULL AND idUzivatel = $uid ORDER BY termin_zacatku"); echo" Kdo Co Kolik Od kdy Do kdy Vyzvednuto Vráceno Poznámka"; foreach ($vypujcky as $vypujcka){ echo ""; $users = user_load_multiple(array(), array('uid' => $vypujcka->idUzivatel)); $kdo= reset($users); echo $kdo->name; echo ""; $db_vec = db_query("SELECT * FROM sklad WHERE id=$vypujcka->idVec"); $vec = $db_vec->fetchObject(); echo $vec->druh.' ('.$vec->popis.')'; echo ""; echo $vypujcka->mnozstvi; echo ""; echo date('d.m.y', $vypujcka->termin_zacatku); echo ""; echo date('d.m.y', $vypujcka->termin_konce); echo ""; echo date('d.m.y', $vypujcka->termin_vyzvednuti); echo ""; echo date('d.m.y', $vypujcka->termin_vraceni); echo ""; echo $vypujcka->poznamka; echo ""; } echo ""; ?>

[Seznam možností práce se skladem](moznosti_sklad)
