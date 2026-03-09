---
categories: [content, article, others]
permalink: /clanky/ostatni/testovaci-stranka-pro-buzer-mail/
title: "Testovací stránka pro buzer mail"
date_created: 2012-03-18
author: "Irena Horáčková"
---

uid == 1) // { // $dnes = mktime() - 7 * 24* 60 * 60; // $hrisnici= db_query("SELECT idUzivatel FROM vypujcky WHERE termin_konce"; // $uid = $hrisnik->idUzivatel; // // $kdo = user_load(array('uid' => $uid)); // $users = user_load_multiple(array(), array('uid' => $uid)); // $kdo= reset($users); // // $vypujckyForUser= db_query("SELECT * FROM vypujcky WHERE termin_koncename, ".PHP_EOL. // "máš půjčené následující věci ze skladu:".PHP_EOL; // foreach ($vypujckyForUser as $vypujckaForUser){ // // $db_vec = db_query("SELECT * FROM sklad WHERE id=$vypujckaForUser->idVec"); // $vec = $db_vec->fetchObject(); // // $mail = $mail. $vypujckaForUser->mnozstvi."x ".$vec->druh.' ('.$vec->popis.'),'. // ' - termín vrácení '.date('d.m.Y',$vypujckaForUser->termin_konce).PHP_EOL; // } // $mail = $mail.PHP_EOL; // $mail = $mail."Termín vrácení již o víc než týden prošel, proto vrať tyto věci co nejdříve do skladu. Pokud jsi je už do skladu vrátil, ". // "obrať se na správce skladu, kterému jsi věci vracel, ať tě odšktne ze seznamu nevrácených výpůjček. ". // "Pokud si chceš věc nechat déle, dej vedět správci skladu, ať Ti výpůjčku prodlouží.".PHP_EOL; // $mail = $mail."Děkuje Ti, Tvůj buzerovací web!"; // // // $emailFrom = "irena.horackova@gmail.com"; // //$emailTo = $kdo->mail; // $emailTo = "irena.horackova@gmail.com"; // $hlavicka = "From:".$emailFrom."\\r\\n"; // $hlavicka.= "Reply-To:".$emailFrom."\\r\\n"; // $hlavicka.= "X-Mailer: PHP\\r\\n"; // $hlavicka.= "Content-Type: text/plain; charset=UTF-8"; // $subject = "Nevrácené věci ve skladu AKA"; // // // mail($emailTo, $subject, $mail, $hlavicka); // echo $mail.'

'; // // } // } // ?>
