#language: nl

Functionaliteit: gezag van een meerderjarige over een kind


  Regel: een meerderjarige die gezag heeft over een minderjarig kind krijgt de gezagsrelatie geleverd

  Abstract Scenario: persoon heeft tweehoofdig ouderlijk gezag over het minderjarige kind
    Gegeven de persoon 'Henk' met burgerservicenummer '000000012'
    * is ingeschreven in de BRP
    * is meerderjarig
    En de persoon 'Ingrid' met burgerservicenummer '000000024'
    * is ingeschreven in de BRP
    * is meerderjarig
    En 'Henk' en 'Ingrid' zijn met elkaar gehuwd
    En de persoon 'Jaimy' met burgerservicenummer '000000036'
    * is ingeschreven in de BRP
    * is minderjarig
    * is in Nederland geboren
    * is niet geëmigreerd geweest
    * heeft 'Ingrid' als ouder 1
    * heeft 'Henk' als ouder 2
    Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde                |
      | burgerservicenummer | <burgerservicenummer> |
    Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde                |
      | burgerservicenummer | <burgerservicenummer> |
    En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | TweehoofdigOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000036                 |
    En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
    En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |

    Voorbeelden:
      | omschrijving            | burgerservicenummer |
      | vraag gezag van ouder 1 | 000000024           |
      | vraag gezag van ouder 2 | 000000012           |

  Scenario: persoon heeft eenhoofdig ouderlijk gezag over het minderjarige kind
    Gegeven de persoon 'Ingrid' met burgerservicenummer '000000012'
    * is ingeschreven in de BRP
    * is meerderjarig
    En de persoon 'Jaimy' met burgerservicenummer '000000036'
    * is ingeschreven in de BRP
    * is minderjarig
    * is in Nederland geboren
    * is niet geëmigreerd geweest
    * heeft 'Ingrid' als ouder 1

    Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
    Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
    En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                   |
      | type                             | EenhoofdigOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000036                |
    En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
    En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
