---
categories: [content, article, others]
permalink: /clanky/ostatni/moznosti-se-skladem/
title: "Možnosti se skladem"
date_created: 2008-11-26
author: "Irena Horáčková"
---

- [Rezervovat věci](pujcit_vec)
- [Smazat mou rezervaci](moje_resty)
- [Editovat poznámku u mých výpůjček](moje_resty)
- [Seznam mých restů](/moje_resty)

uid; $uzivatele = db_query("SELECT * FROM {users_roles} WHERE uid=$uid"); $povoleni = 0; foreach ($uzivatele as $uzivatel){ if (($uzivatel->rid == 4)||($uzivatel->rid == 4)){ $povoleni = 1; } } if ($povoleni){ ?>

**Možnosti pro správce skladu**

- [ Vydat rezervovanou věc](/rezervace_sklad)
- [ Vydat nerezervovanou věc](/pujcit1_bez)
- [ Vrátit věc](/seznam_nevracenych)
- [ Přidat věc do skladu](/pridat_vec)
- [ Smazat věc ze skladu](/smazani_skladu)

**Možnosti výpisů**

- [Seznam skladu](/seznam_skladu)
- [Seznam rezervací](/rezervace_sklad)
- [Seznam nevrácených výpůjček](/seznam_nevracenych)
- [Seznam vrácených výpůjček](/seznam_vracenych)
