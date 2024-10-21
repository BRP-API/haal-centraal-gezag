#language: nl

Functionaliteit: 1.3 - Is minderjarige naar het buitenland geëmigreerd geweest?


    Achtergrond:
      Gegeven de persoon 'Lydia' met burgerservicenummer '000000012'
      * is ingeschreven in de BRP
      * is meerderjarig
      En de persoon 'Hans' met burgerservicenummer '000000024'
      * is ingeschreven in de BRP
      * is meerderjarig
      En 'Lydia' en 'Hans' zijn met elkaar gehuwd


  Regel: Als de minderjarige geëmigreerd is geweest kan het gezag van de persoon niet worden bepaald
    # Dit is het geval wanneer geboorteland is Nederland (6030) en datum vestiging in Nederland heeft een waarde

    Scenario: de minderjarige is geëmigreerd geweest en woont nu weer in Nederland
      Gegeven de persoon 'Nancy' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Lydia' als ouder 1
      * heeft 'Hans' als ouder 2
      * is geëmigreerd geweest met de volgende gegevens
      | datum vestiging in Nederland (14.20) |
      | 20231014                             |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                        |
      | type        | GezagNietTeBepalen                                                            |
      | toelichting | gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven. |

    Scenario: de minderjarige is nooit geëmigreerd geweest
      Gegeven de persoon 'Nancy' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Lydia' als ouder 1
      * heeft 'Hans' als ouder 2
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
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |

  
  Regel: Wanneer er onderzoek loopt naar het geboorteland is gezag niet te bepalen
    # er loopt onderzoek wanneer aanduiding in onderzoek (83.10) een waarde heeft en datum einde onderzoek (83.30) geen waarde heeft
    # er loopt onderzoek naar geboorteland wanneer aanduiding in onderzoek op de actuele persoon is 010330, 010330 of 010000

    Abstract Scenario: gezag kan niet bepaald worden omdat <onderzoek omschrijving> staat in onderzoek
      Gegeven de persoon 'Nancy' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Lydia' als ouder 1
      * heeft 'Hans' als ouder 2
      * zijn de volgende gegevens gewijzigd
      | aanduiding in onderzoek (83.10) |
      | <aanduiding in onderzoek>       |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                                       |
      | type        | GezagNietTeBepalen                                                                                                           |
      | toelichting | Gezag is niet te bepalen, omdat de volgende relevante gegevens in onderzoek staan. Persoonslijst van persoon: <toelichting>. |

      Voorbeelden:
      | aanduiding in onderzoek | onderzoek omschrijving | toelichting                                         |
      | 010000                  | hele categorie persoon | persoon                                             |
      | 010300                  | hele groep geboorte    | geboortedatum van persoon, geboorteland van persoon |
      | 010330                  | geboorteland           | geboorteland van persoon                            |

    Abstract Scenario: gezag kan wel bepaald worden ondanks dat <onderzoek omschrijving> in onderzoek staat
      Gegeven de persoon 'Nancy' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Lydia' als ouder 1
      * heeft 'Hans' als ouder 2
      * zijn de volgende gegevens gewijzigd
      | aanduiding in onderzoek (83.10) |
      | <aanduiding in onderzoek>       |
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
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |

      Voorbeelden:
      | aanduiding in onderzoek | onderzoek omschrijving |
      | 010120                  | burgerservicenummer    |
      | 010200                  | hele groep naam        |
      | 010240                  | geslachtsnaam          |
      | 010320                  | geboorteplaats         |

    Scenario: gezag kan wel bepaald worden omdat onderzoek naar geboorteland is beëindigd
      Gegeven de persoon 'Nancy' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Lydia' als ouder 1
      * heeft 'Hans' als ouder 2
      * zijn de volgende gegevens gewijzigd
      | aanduiding in onderzoek (83.10) | datum einde onderzoek (83.30) |
      | 010330                          | 20230526                      |
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
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |

  Regel: Wanneer er onderzoek loopt naar datum vestiging in Nederland is gezag niet te bepalen
    # er loopt onderzoek wanneer aanduiding in onderzoek (83.10) een waarde heeft en datum einde onderzoek (83.30) geen waarde heeft
    # er loopt onderzoek naar datum vestiging in Nederland wanneer aanduiding in onderzoek op de actuele verblijfplaats is 081420, 081400 of 080000

    Abstract Scenario: gezag kan niet bepaald worden omdat <onderzoek omschrijving> staat in onderzoek
      Gegeven de persoon 'Nancy' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Lydia' als ouder 1
      * heeft 'Hans' als ouder 2
      * zijn de volgende verblijfplaats gegevens gewijzigd
      | aanduiding in onderzoek (83.10) |
      | <aanduiding in onderzoek>       |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                                       |
      | type        | GezagNietTeBepalen                                                                                                           |
      | toelichting | Gezag is niet te bepalen, omdat de volgende relevante gegevens in onderzoek staan. Persoonslijst van persoon: <toelichting>. |

      Voorbeelden:
      | aanduiding in onderzoek | onderzoek omschrijving        | toelichting                  |
      | 080000                  | hele categorie verblijfplaats | datum vestiging in Nederland |
      | 081400                  | hele groep immigratie         | datum vestiging in Nederland |
      | 081420                  | datum vestiging in Nederland  | datum vestiging in Nederland |

    Abstract Scenario: gezag kan wel bepaald worden ondanks dat <onderzoek omschrijving> in onderzoek staat
      Gegeven de persoon 'Nancy' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Lydia' als ouder 1
      * heeft 'Hans' als ouder 2
      * zijn de volgende verblijfplaats gegevens gewijzigd
      | aanduiding in onderzoek (83.10) |
      | <aanduiding in onderzoek>       |
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
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |

      Voorbeelden:
      | aanduiding in onderzoek | onderzoek omschrijving              |
      | 081410                  | land vanwaar ingeschreven           |
      | 081100                  | hele groep adres                    |
      | 081030                  | datum aanvang adreshouding          |
      | 089999                  | vastgesteld verblijft niet op adres |

    Scenario: gezag kan wel bepaald worden omdat onderzoek naar datum vestiging in Nederland is beëindigd
      Gegeven de persoon 'Nancy' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Lydia' als ouder 1
      * heeft 'Hans' als ouder 2
      * zijn de volgende verblijfplaats gegevens gewijzigd
      | aanduiding in onderzoek (83.10) | datum einde onderzoek (83.30) |
      | 081420                          | 20230526                      |
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
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
      En heeft 'gezag' een 'ouder' met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |


  Regel: Wanneer het geboorteland geen waarde heeft is gezag niet te bepalen

    Scenario: geboorteland is niet ingevuld
      Gegeven de persoon 'Nancy' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is minderjarig
      * heeft 'Lydia' als ouder 1
      * heeft 'Hans' als ouder 2
      #* geboorteland heeft geen waarde
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                                                                                   |
      | type        | GezagNietTeBepalen                                                                                                                                                       |
      | toelichting | gezag is niet te bepalen. Neem contact op met RvIG via info@RvIG onder vermelding van BRP API route 3e. Vermeld de volgende foutcode: Geboorteland van bevraagde persoon |
