---
categories: [content, article, others]
permalink: /clanky/ostatni/pridani-veci-do-skladu/
title: "Přidání věcí do skladu"
date_created: 2008-11-25
author: "Irena Horáčková"
---

$_POST['druh'], 'popis' => $_POST['popis'], 'mnozstvi' => $_POST['mnozstvi'], 'umisteni' => $_POST['umisteni'], 'kategorie' => $_POST['kategorie'], ); $db_id = db_insert('sklad')->fields($data)->execute(); if ($db_id){ echo '
(zapsani ok, id='.$db_id.')
'; echo 'Přidání proběhlo úspěšně!

[Přidej další](?q=pridat_vec)

'; } else{ echo ' - CHYBA** - nepovedlo se zapsat do databáze: id='.$db_id.')
'; echo 'Přidání proběhlo úspěšně!

[Přidej další](?q=pridat_vec)

'; } } else{ global $user; $uid = $user->uid; $uzivatele = db_query("SELECT * FROM {users_roles} WHERE uid=$uid"); $povoleni = 0; foreach ($uzivatele as $uzivatel){ if (($uzivatel->rid == 4)||($uzivatel->rid == 4)){ $povoleni = 1; } } if ($povoleni){ ?> Druh: Popis: Množství: Umístění: Kategorie Lezecký materiál Lavinový materiál Zimní materiál lezecký Skoby a kladiva Ostatní materiál

[Seznam možností práce se skladem](moznosti_sklad)
