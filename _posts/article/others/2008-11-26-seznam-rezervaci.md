---
categories: [content, article, others]
permalink: /clanky/ostatni/seznam-rezervaci/
title: "Seznam rezervací"
date_created: 2008-11-26
author: "Irena Horáčková"
---

uid; $uzivatele = db_query("SELECT * FROM {users_roles} WHERE uid=$uid"); $povoleni = 0; foreach ($uzivatele as $uzivatel){ if (($uzivatel->rid == 4)||($uzivatel->rid == 4)){ $povoleni = 1; } } echo "
### Seznam rezervací
"; $vypujcky= db_query("SELECT * FROM vypujcky WHERE termin_vyzvednuti IS NULL ORDER BY termin_zacatku"); echo" Kdo Co Kolik Od kdy Do kdyPoznámka"; foreach ($vypujcky as $vypujcka){ echo ""; $users = user_load_multiple(array(), array('uid' => $vypujcka->idUzivatel)); $kdo= reset($users); echo $kdo->name; echo ""; $db_vec = db_query("SELECT * FROM sklad WHERE id=$vypujcka->idVec"); $vec = $db_vec->fetchObject(); echo $vec->druh.' ('.$vec->popis.')'; echo ""; echo $vypujcka->mnozstvi; echo ""; echo date('d.m.y', $vypujcka->termin_zacatku); echo ""; echo date('d.m.y', $vypujcka->termin_konce); if ($povoleni){ echo ""; echo $vypujcka->poznamka; echo ""; echo ''; echo 'id; echo '">'; echo ''; } echo ""; } echo ""; ?>

[Seznam možností práce se skladem](moznosti_sklad)
