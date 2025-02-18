# language: nl
Functionaliteit: gezag van een meerderjarige over een kind

  Regel: een meerderjarige die gezag heeft over een minderjarig kind krijgt de gezagsrelatie geleverd

    Abstract Scenario: persoon heeft gezamenlijk ouderlijk gezag over het minderjarige kind
      Gegeven de persoon 'Aart' met burgerservicenummer '000000012'
      * is ingeschreven in de BRP
      * is meerderjarig
      En de persoon 'Gerda' met burgerservicenummer '000000024'
      * is ingeschreven in de BRP
      * is meerderjarig
      En 'Aart' en 'Gerda' zijn met elkaar gehuwd
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is minderjarig
      * is in Nederland geboren
      * is niet geëmigreerd geweest
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                    |
        | type                             | GezamenlijkOuderlijkGezag |
        | minderjarige.burgerservicenummer |                 000000036 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000024 |

      Voorbeelden:
        | omschrijving            | burgerservicenummer |
        | vraag gezag van ouder 1 |           000000024 |
        | vraag gezag van ouder 2 |           000000012 |

    Scenario: persoon heeft eenhoofdig ouderlijk gezag over het minderjarige kind
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is ingeschreven in de BRP
      * is meerderjarig
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is minderjarig
      * is in Nederland geboren
      * is niet geëmigreerd geweest
      * heeft 'Gerda' als ouder 1
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                   |
        | type                             | EenhoofdigOuderlijkGezag |
        | minderjarige.burgerservicenummer |                000000036 |
        | ouder.burgerservicenummer        |                000000012 |

  Regel: een meerderjarige die geen gezag heeft over een minderjarig kind krijgt de gezagsrelatie niet geleverd

    Scenario: vader heeft geen gezag over minderjarig kind omdat deze niet gehuwd is noch partnerschap heeft met de moeder
      Gegeven de persoon 'Aart' met burgerservicenummer '000000012'
      * is ingeschreven in de BRP
      * is meerderjarig
      En de persoon 'Gerda' met burgerservicenummer '000000024'
      * is ingeschreven in de BRP
      * is meerderjarig
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is minderjarig
      * is in Nederland geboren
      * is niet geëmigreerd geweest
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
      En heeft de persoon geen gezag

    Abstract Scenario: vader heeft geen gezag over minderjarig kind omdat er in een gerechtelijke uitspraak over gezag het gezag is toegewezen aan <omschrijving gezag>
      Gegeven de persoon 'Aart' met burgerservicenummer '000000012'
      * is ingeschreven in de BRP
      * is meerderjarig
      En de persoon 'Gerda' met burgerservicenummer '000000024'
      * is ingeschreven in de BRP
      * is meerderjarig
      En 'Aart' en 'Gerda' zijn met elkaar gehuwd
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is minderjarig
      * is in Nederland geboren
      * is niet geëmigreerd geweest
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      En voor 'Bert' is een gerechtelijke uitspraak over het gezag gedaan met de volgende gegevens
        | indicatie gezag minderjarige (32.10) | ingangsdatum geldigheid (85.10) |
        | <indicatie gezag>                    | gisteren - 1 jaar               |
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
      En heeft de persoon geen gezag

      Voorbeelden:
        | indicatie gezag | omschrijving gezag           |
        | D               | een derde                    |
        |               1 | de andere ouder              |
        |              1D | de andere ouder en een derde |
