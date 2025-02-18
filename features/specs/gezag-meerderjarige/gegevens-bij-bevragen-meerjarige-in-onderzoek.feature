#language: nl

Functionaliteit: wanneer gegevens in onderzoek staan wordt een gezag uitspraak geleverd met een toelichting welke gegevens in onderzoek zijn

    Achtergrond:
      Gegeven de persoon 'Rianne' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Roel' met burgerservicenummer '000000024'
      * is meerderjarig
      En 'Rianne' en 'Roel' zijn met elkaar gehuwd
      En de persoon 'Richard' met burgerservicenummer '000000036'
      * is minderjarig
      * is in Nederland geboren
      * is ingeschreven in de BRP
      * heeft 'Rianne' als ouder 1
      * heeft 'Roel' als ouder 2
      En de persoon 'Randy' met burgerservicenummer '000000048'
      * is minderjarig
      * is in Nederland geboren
      * is ingeschreven in de BRP
      * heeft 'Rianne' als ouder 1
      * heeft 'Roel' als ouder 2
      En de persoon 'Rijk' met burgerservicenummer '000000061'
      * is minderjarig
      * is in Nederland geboren
      * is ingeschreven in de BRP
      * heeft 'Rianne' als ouder 1
      * heeft 'Roel' als ouder 2

    Abstract Scenario: gezag wordt bepaald met gegeven van 1 van de kinderen: <omschrijving> in onderzoek er is sprake van GezamenlijkOuderlijkGezag
      Gegeven persoon 'Richard'
      * zijn de volgende gegevens gewijzigd
      | aanduiding in onderzoek (83.10) |
      | <aanduiding onderzoek>          |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | GezamenlijkOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000036                 |
      | inOnderzoek                      | true                      |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | GezamenlijkOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000048                 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | GezamenlijkOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000061                 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |

      Voorbeelden:
      | aanduiding onderzoek | omschrijving             |
      | 010310               | geboortedatum            |
      | 010330               | geboorteland             |
      | 010000               | hele categorie           |

    Abstract Scenario: gezag wordt bepaald met gegeven van de ouder 2: <omschrijving> in onderzoek er is sprake van GezamenlijkOuderlijkGezag
      Gegeven persoon '<persoon>'
      * zijn de volgende gegevens gewijzigd
      | aanduiding in onderzoek (83.10) |
      | <aanduiding onderzoek>          |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | GezamenlijkOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000036                 |
      | inOnderzoek                      | true                      |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | GezamenlijkOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000048                 |
      | inOnderzoek                      | true                      |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | GezamenlijkOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000061                 |
      | inOnderzoek                      | true                      |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |

      Voorbeelden:
      | aanduiding onderzoek | omschrijving                       | persoon |
      | 010000               | hele categorie van deze ouder      | Roel    |
      | 010000               | hele categorie van de andere ouder | Rianne  |
