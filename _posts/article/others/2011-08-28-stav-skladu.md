---
categories: [content, article, others]
permalink: /clanky/ostatni/stav-skladu/
title: "Stav skladu"
date_created: 2011-08-28
author: "Irena Horáčková"
---

Hodnoty zobrazené modře nejsou v danou dobu v plném množství. Při najetí myši nad modré číslo se zobrazí kdo má danou věc půjčenou, v jakém množství a na jakou dobu. **
uid; $uzivatele = db_query("SELECT * FROM {users_roles} WHERE uid=$uid"); $povoleni = 0; foreach ($uzivatele as $uzivatel){ if (($uzivatel->rid == 4)||($uzivatel->rid == 4)){ $povoleni = 1; } } $dnes = time(); $den = 24* 60 * 60; // $kolikDni = 21; $kolikDni = 7; // $zacatek = strtotime('2011-08-28'); // $konec= strtotime('2011-08-28'); echo" Druh Popis"; for ($d=$dnes-$kolikDni*$den; $d '.date('d.',$d).''; } echo""; for ($j = 1; $j "; switch ($j) { case 1: echo "Lezecký materiál"; break; case 2: echo "Lavinový materiál"; break; case 3: echo "Zimní materiál lezecký"; break; case 4: echo "Skoby a kladiva "; break; case 5: echo "Ostatní materiál"; break; } echo ""; echo "**"; foreach ($veci as $vec){ $vypujcky= db_query("SELECT * FROM vypujcky WHERE idVec=$vec->id AND termin_vraceni IS NULL"); $pujceno = 0; $dispozice = $vec->mnozstvi; echo ""; echo $vec->druh; echo ""; echo substr($vec->popis,0,15); echo ""; for ($d=$dnes- $kolikDni*$den; $d id AND termin_vraceni IS NULL"); $dispozice = $vec->mnozstvi; $pujceno = 0; $text = ""; foreach ($vypujcky as $vypujcka){ if ((($vypujcka->termin_zacatkutermin_konce>$d))){ $pujceno = $pujceno + $vypujcka->mnozstvi; $dispozice = $dispozice - $vypujcka->mnozstvi; $db_uziv = db_query("SELECT name FROM users WHERE uid=$vypujcka->idUzivatel"); $uziv = $db_uziv->fetchObject(); $text = $text.$uziv->name.'('.$vypujcka->mnozstvi.'x '.date('d.m.-',$vypujcka->termin_zacatku).date('d.m.',$vypujcka->termin_konce).') '; } } echo ""; if ($dispozice mnozstvi) echo '['.$dispozice.'](#)'; else echo $dispozice; echo ""; } echo ""; } } echo ''; echo ''; echo ""; ?>
