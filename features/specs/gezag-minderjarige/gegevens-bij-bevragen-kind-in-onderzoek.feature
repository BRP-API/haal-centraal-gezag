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

    Abstract Scenario: gezag wordt bepaald met gegeven van persoon: <omschrijving> in onderzoek er is sprake van TweehoofdigOuderlijkGezag
      Gegeven persoon 'Nandy'
      * zijn de volgende gegevens gewijzigd
      | aanduiding in onderzoek (83.10) |
      | <aanduiding onderzoek>          |
      * heeft 'Jorine' als ouder 1
      * heeft 'Bastiaan' als ouder 2
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

    Abstract Scenario: gezag wordt bepaald met aktenummer van persoon in onderzoek er is sprake van TweehoofdigOuderlijkGezag
      Gegeven persoon 'Nandy'
      * zijn de volgende gegevens gewijzigd
      | aanduiding in onderzoek (83.10) |
      | <aanduiding onderzoek>          |
      * heeft 'Jorine' als ouder 1
      * is geadopteerd door 'Bastiaan' als ouder 2
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
      | aanduiding onderzoek | omschrijving             | toelichting                                                                                                                                      |
      | 018120               | aktenummer               | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: aktenummer van persoon.              |
      | 518120               | aktenummer historische   | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: aktenummer van persoon (historie).   |

    Abstract Scenario: gezag wordt bepaald met gegeven van huwelijk: <omschrijving> in onderzoek er is sprake van TweehoofdigOuderlijkGezag
      Gegeven 'Jorine' en 'Bastiaan' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) | aanduiding in onderzoek (83.10) |
      | gisteren - 2 jaar                                                  | <aanduiding onderzoek>          |
      Gegeven persoon 'Nandy'
      * heeft 'Jorine' als ouder 1
      * heeft 'Bastiaan' als ouder 2
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

    Abstract Scenario: gezag wordt bepaald met gegeven van huwelijk bij scheiding: <omschrijving> in onderzoek er is sprake van TweehoofdigOuderlijkGezag
      Gegeven 'Jorine' en 'Bastiaan' zijn met elkaar gehuwd
      En 'Jorine' en 'Bastiaan' zijn gescheiden met de volgende gegevens
      | datum ontbinding huwelijk/geregistreerd partnerschap (07.10) | aanduiding in onderzoek (83.10) |
      | gisteren - 1 jaar                                            | <aanduiding onderzoek>          |
      Gegeven persoon 'Nandy'
      * heeft 'Jorine' als ouder 1
      * heeft 'Bastiaan' als ouder 2
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
      | 050740               | reden ontbinding huwelijk of partnerschap   | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van ouder 1: reden ontbinding van relatie. Persoonslijst van ouder 2: reden ontbinding van relatie. |

    Abstract Scenario: gezag wordt bepaald met gegeven van gerechtelijke uitspraak: <omschrijving> in onderzoek er is sprake van TweehoofdigOuderlijkGezag
      Gegeven voor 'Nandy' is een gerechtelijke uitspraak over het gezag gedaan met de volgende gegevens
        | naam                                 | waarde                  |
        | indicatie gezag minderjarige (32.10) | 12                      |
        | ingangsdatum geldigheid (85.10)      | gisteren - 2 jaar       |
        | aanduiding in onderzoek (83.10)      | <aanduiding onderzoek>  |
      En persoon 'Nandy'
      * heeft 'Jorine' als ouder 1
      * heeft 'Bastiaan' als ouder 2
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

    Abstract Scenario: gezag wordt bepaald met gegeven van gerechtelijke uitspraak voor de ouder 1: <omschrijving> in onderzoek er is sprake van EenhoofdigOuderlijkGezag
      En persoon 'Nandy'
      * heeft 'Jorine' als ouder 1
      * heeft 'Bastiaan' als ouder 2
      Gegeven voor 'Jorine' is een gerechtelijke uitspraak over het gezag gedaan met de volgende gegevens
        | naam                                 | waarde                  |
        | indicatie curateleregister (33.10)   | 1                       |
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
        | type                             | EenhoofdigOuderlijkGezag  |
        | minderjarige.burgerservicenummer | 000000036                 |
        | ouder.burgerservicenummer        | 000000024                 |
        | toelichting                      | <toelichting>             |

        Voorbeelden:
        | aanduiding onderzoek | omschrijving                    | toelichting                                                                                                                                  |
        | 110000               | hele groep                      | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van ouder 1: gezagsverhouding.                |
        | 113310               | indicatie curatele register     | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van ouder 1: indicatie curatele register.     |

    Abstract Scenario: gezag wordt bepaald met gegeven van gerechtelijke uitspraak voor de ouder 2: <omschrijving> in onderzoek er is sprake van EenhoofdigOuderlijkGezag
      En persoon 'Nandy'
      * heeft 'Jorine' als ouder 1
      * heeft 'Bastiaan' als ouder 2
      Gegeven voor 'Bastiaan' is een gerechtelijke uitspraak over het gezag gedaan met de volgende gegevens
        | naam                                 | waarde                  |
        | indicatie curateleregister (33.10)   | 1                       |
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
        | type                             | EenhoofdigOuderlijkGezag  |
        | minderjarige.burgerservicenummer | 000000036                 |
        | ouder.burgerservicenummer        | 000000012                 |
        | toelichting                      | <toelichting>             |

        Voorbeelden:
        | aanduiding onderzoek | omschrijving                    | toelichting                                                                                                                                  |
        | 110000               | hele groep                      | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van ouder 2: gezagsverhouding.                |
        | 113310               | indicatie curatele register     | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van ouder 2: indicatie curatele register.     |

      Abstract Scenario: gezag wordt bepaald met gegeven van ouder 1: <omschrijving> in onderzoek er is sprake van TweehoofdigOuderlijkGezag
        En persoon 'Nandy'
        * heeft 'Jorine' als ouder 1 met de volgende gegevens
          | aanduiding in onderzoek (83.10) | datum ingang familierechtelijke betrekking (62.10) |
          | <aanduiding onderzoek>          | gisteren - 2 jaar                                  | 
        * heeft 'Bastiaan' als ouder 2 
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
          | aanduiding onderzoek | omschrijving                               | toelichting                                                                                                                                             |
          | 020120               | burgerservicenummer                        | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: burgerservicenummer van ouder 1.            |
          | 020240               | geslachtsnaam                              | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: geslachtsnaam van ouder 1.                  |
          | 026210               | datum ingang familierechtelijke betrekking | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: datum ingang familiebetrekking van ouder 1. |
          | 028120               | aktenummer                                 | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: aktenummer van ouder 1.                     |
          | 020000               | hele groep                                 | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: ouder 1.                                    |

      Abstract Scenario: gezag wordt bepaald met gegeven van ouder 2: <omschrijving> in onderzoek er is sprake van TweehoofdigOuderlijkGezag
        En persoon 'Nandy'
        * heeft 'Jorine' als ouder 1
        * heeft 'Bastiaan' als ouder 2 met de volgende gegevens
          | aanduiding in onderzoek (83.10) | datum ingang familierechtelijke betrekking (62.10) |
          | <aanduiding onderzoek>          | gisteren - 2 jaar                                  | 
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
          | aanduiding onderzoek | omschrijving                               | toelichting                                                                                                                                             |
          | 030120               | burgerservicenummer                        | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: burgerservicenummer van ouder 2.            |
          | 030240               | geslachtsnaam                              | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: geslachtsnaam van ouder 2.                  |
          | 036210               | datum ingang familierechtelijke betrekking | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: datum ingang familiebetrekking van ouder 2. |
          | 038120               | aktenummer                                 | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: aktenummer van ouder 2.                     |
          | 030000               | hele groep                                 | Bij de uitspraak zijn de volgende relevante gegevens in onderzoek geconstateerd. Persoonslijst van persoon: ouder 2.                                    |