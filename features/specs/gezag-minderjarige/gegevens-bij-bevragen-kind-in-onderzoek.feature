#language: nl

Functionaliteit: wanneer gegevens van het kind in onderzoek staan wordt een gezag uitspraak geleverd met een toelichting welke gegevens in onderzoek zijn

    Achtergrond:
      Gegeven de persoon 'Jorine' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Bastiaan' met burgerservicenummer '000000024'
      * is meerderjarig
      En de persoon 'Nandy' met burgerservicenummer '000000036'
      * is minderjarig
      * is in Nederland geboren
      * is ingeschreven in de BRP
      * heeft 'Jorine' als ouder 1
      * heeft 'Bastiaan' als ouder 2

    Abstract Scenario: gezag wordt bepaald met gegeven van persoon: <omschrijving> in onderzoek er is sprake van TweehoofdigOuderlijkGezag
      Gegeven persoon 'Nandy'
      * zijn de volgende gegevens gewijzigd
      | aanduiding in onderzoek (83.10) |
      | <aanduiding onderzoek>          |
      En 'Jorine' en 'Bastiaan' zijn met elkaar gehuwd
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | TweehoofdigOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000036                 |
      | toelichting                      | <toelichting>             |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |

      Voorbeelden:
      | aanduiding onderzoek | omschrijving             | toelichting                                                                                                                                |
      | 010310               | geboortedatum            | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: geboortedatum van persoon.     |
      | 010330               | geboorteland             | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: geboorteland van persoon.      |
      | 010000               | hele categorie           | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: persoon.                       |

      Abstract Scenario: gezag wordt bepaald met gegeven van huwelijk: <omschrijving> in onderzoek er is sprake van TweehoofdigOuderlijkGezag
        Gegeven 'Jorine' en 'Bastiaan' zijn met elkaar gehuwd met de volgende gegevens
        | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) | aanduiding in onderzoek (83.10) |
        | gisteren - 2 jaar                                                  | <aanduiding onderzoek>          |
        Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde    |
        | burgerservicenummer | 000000036 |
        Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000036 |
        En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                    |
        | type                             | TweehoofdigOuderlijkGezag |
        | minderjarige.burgerservicenummer | 000000036                 |
        | toelichting                      | <toelichting>             |
        En heeft 'gezag' een 'ouder' met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
        En heeft 'gezag' een 'ouder' met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000024 |

        Voorbeelden:
        | aanduiding onderzoek | omschrijving                                | toelichting                                                                                                                                                                                                              |
        | 050120               | burgerservicenummer partner                 | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van ouder 1: burgerservicenummer partner van relatie. Persoonslijst van ouder 2: burgerservicenummer partner van relatie. |
        | 050000               | hele categorie partnerschap                 | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van ouder 1: relatie. Persoonslijst van ouder 2: relatie.                                                                 |
        | 050600               | hele groep aangaan huwelijk of partnerschap | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van ouder 1: datum voltrokken van relatie. Persoonslijst van ouder 2: datum voltrokken van relatie.                       |
        | 050610               | datum aangaan huwelijk of partnerschap      | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van ouder 1: datum voltrokken van relatie. Persoonslijst van ouder 2: datum voltrokken van relatie.                       |    
        | 050710               | datum ontbinding huwelijk of partnerschap   | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van ouder 1: datum ontbinding van relatie. Persoonslijst van ouder 2: datum ontbinding van relatie.                       |    

    Abstract Scenario: gezag wordt bepaald met gegeven van gerechtelijke uitspraak: <omschrijving> in onderzoek er is sprake van TweehoofdigOuderlijkGezag
      Gegeven voor 'Nandy' is een gerechtelijke uitspraak over het gezag gedaan met de volgende gegevens
        | naam                                 | waarde                  |
        | indicatie gezag minderjarige (32.10) | 12                      |
        | ingangsdatum geldigheid (85.10)      | gisteren - 2 jaar       |
        | aanduiding in onderzoek (83.10)      | <aanduiding onderzoek>  |
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde    |
        | burgerservicenummer | 000000036 |
        Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000036 |
        En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                    |
        | type                             | TweehoofdigOuderlijkGezag |
        | minderjarige.burgerservicenummer | 000000036                 |
        | toelichting                      | <toelichting>             |
        En heeft 'gezag' een 'ouder' met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
        En heeft 'gezag' een 'ouder' met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000024 |

        Voorbeelden:
        | aanduiding onderzoek | omschrijving                    | toelichting                                                                                                                                  |
        | 113210               | indicatie gezag minderjarig     | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: indicatie gezag minderjarige.    |
        | 118510               | ingangsdatum geldigheid gezag   | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: ingangsdatum geldigheid gezag.   |
        | 110000               | hele groep                      | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: gezagsverhouding.                |
            
# nog te doen
#Persoon:
#	aktenummer - 018120

#Persoon historie:
#	aktenummer - 518120

#Ouder 1 / ouder 2:
#	burgerservicenummer - 020120 / 030120
#	geslachtsnaam - 020240 / 030240
#	datum ingang famlieibetrekking - 026210 / 036210
#	aktenummer - 028120 / 038120

#HuwelijkOfPartnerschap
#	reden ontbinding van relatie - 050740

#GeschiedenisHuwelijkOfPartnerschap
#!	burgerservicenummer partner van relatie - 550120
#	datum voltrokken van relatie - 550610
#	datum ontbinding van relatie - 550710
#	reden ontbinding van relatie - 550740

#Gezagsverhouding:
#	indicatie curatele register - 113310

#Ouder 1 historie / Ouder 2 historie:
#	aktenummer - 528120 / 530240
