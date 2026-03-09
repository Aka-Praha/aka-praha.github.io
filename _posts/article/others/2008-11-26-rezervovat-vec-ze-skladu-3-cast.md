---
categories: [content, article, others]
permalink: /clanky/ostatni/rezervovat-vec-ze-skladu-3-cast/
title: "Rezervovat věc ze skladu 3.část"
date_created: 2008-11-26
author: "Irena Horáčková"
---

uid; $uzivatele = db_query("SELECT * FROM {users_roles} WHERE uid=$uid"); $povoleni = 0; while ( $uzivatel = db_fetch_object($uzivatele)){ if (($uzivatel->rid == 4)||($uzivatel->rid == 4)){ $povoleni = 1; } } if ($povoleni) { $kdo = $_POST['kdo']; $uzivatel = db_fetch_object(db_query("SELECT name FROM users where uid = ".$kdo)); $name = $uzivatel->name; echo 'Uživatel **'.$name. '** si na termín **'.$_POST['odkdy'].' - '.$_POST['dokdy'].'** rezervoval následující:**
'; } else{ echo 'Uživatel '.$user->name. '** si na termín **'.$_POST['odkdy'].' - '.$_POST['dokdy'].'** rezervoval následující:

'; } while ($vec = db_fetch_object($veci)) { if ($_POST[$vec->id] > 0){ $cas = time(); $zacatek = strtotime($_POST['odkdy']); $konec= strtotime($_POST['dokdy']); if ($povoleni){ $values = array ( $kdo, $vec->id, $_POST[$vec->id], $cas, $zacatek, $konec, $_POST['poznamka']); } else{ $values = array ( $user->uid, $vec->id, $_POST[$vec->id], $cas, $zacatek, $konec, $_POST['poznamka']); } $msg = "INSERT INTO vypujcky(idUzivatel, idVec, mnozstvi, termin_rezervace, termin_zacatku, termin_konce, poznamka) VALUES(%d, %d, %d, %d, %d, %d, '%s')"; echo $vec->druh.' ('.$vec->popis.') - množství '.$_POST[$vec->id]; if (db_query($msg, $values)){ echo '
'; } else{ echo ' - CHYBA - nepovedlo se zapsat do databáze.
'; } } } ?>

[Seznam možností práce se skladem](moznosti_sklad)
