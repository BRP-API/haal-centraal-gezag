#language: nl

Functionaliteit: het overlijden van een persoon heeft invloed op de gezagsuitspraak

  Voor een overleden ouder kan geen gezag worden opgevraagd.
  De gezagsmodule geeft alleen gezagsuitspraken voor levende meerderjarigen.
  Wanneer een minderjarige overlijdt, komt deze niet meer voor in de gezagsuitspraak van de ouder voor.

    Achtergrond:
      Gegeven de persoon 'Hendrik' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Laura' met burgerservicenummer '000000024'
      * is ingeschreven in de BRP
      * is minderjarig
      * is in Nederland geboren
      * heeft 'Hendrik' als ouder 1
      En de persoon 'Arjan' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is minderjarig
      * is in Nederland geboren
      * heeft 'Hendrik' als ouder 1
       En de persoon 'Jan' met burgerservicenummer '000000048'
      * is ingeschreven in de BRP
      * is minderjarig
      * is in Nederland geboren
      * heeft 'Hendrik' als ouder 1

  Regel: een gezagsbevraging voor een meerderjarige levert een gezagsresultaat op

    Scenario: voor een meerderjarige wordt gezag over alle drie de kinderen geleverd
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                   |
      | type                             | EenhoofdigOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000024                |
      | ouder.burgerservicenummer        | 000000012                |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                   |
      | type                             | EenhoofdigOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000036                |
      | ouder.burgerservicenummer        | 000000012                |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                   |
      | type                             | EenhoofdigOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000048                |
      | ouder.burgerservicenummer        | 000000012                |

    Scenario: voor een meerderjarige die is overleden wordt geen gezag geleverd
      Gegeven persoon 'Hendrik'
      * is overleden
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft de persoon geen gezag

    Scenario: voor een meerderjarige waarvan een minderjarige is overleden wordt gezag geleverd voor de twee niet overleden minderjarige geleverd
      Gegeven persoon 'Laura'
      * is overleden
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
      | ouder.burgerservicenummer        | 000000012                |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                   |
      | type                             | EenhoofdigOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000048                |
      | ouder.burgerservicenummer        | 000000012                |

    Scenario: voor een meerderjarige waarvan alle minderjarige zijn overleden wordt geen gezag geleverd
      Gegeven persoon 'Laura'
      * is overleden
      Gegeven persoon 'Arjan'
      * is overleden
      Gegeven persoon 'Jan'
      * is overleden
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft de persoon geen gezag