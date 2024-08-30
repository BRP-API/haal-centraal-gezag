#language: nl

Functionaliteit: 1.3 - Is minderjarige naar het buitenland geëmigreerd geweest?


    Achtergrond:
      Gegeven de persoon 'P1' met burgerservicenummer '000000012'
      * is meerderjarig
      * heeft geslachtsnaam gevuld
      En de persoon 'P2' met burgerservicenummer '000000024'
      * is meerderjarig
      * heeft geslachtsnaam gevuld
      En persoon 'P1' heeft geregistreerd partnerschap met persoon 'P2'
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | gisteren - 20 jaar                                                 |


  Regel: Als de minderjarige geëmigreerd is geweest kan het gezag van de persoon niet worden bepaald
    # Dit is het geval wanneer geboorteland is Nederland (6030) en datum vestiging in Nederland heeft een waarde

    Scenario: de minderjarige is geëmigreerd geweest en woont nu weer in Nederland
      Gegeven de persoon 'P3' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft persoon 'P1' als ouder1 vanaf de geboorteaangifte
      * heeft persoon 'P2' als ouder2 vanaf de geboorteaangifte
      * is ingeschreven in de de BRP
      * is geëmigreerd geweest
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
      Gegeven de persoon 'P3' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft persoon 'P1' als ouder1 vanaf de geboorteaangifte
      * heeft persoon 'P2' als ouder2 vanaf de geboorteaangifte
      * is ingeschreven in de de BRP
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
      Gegeven de persoon 'P3' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft persoon 'P1' als ouder1 vanaf de geboorteaangifte
      * heeft persoon 'P2' als ouder2 vanaf de geboorteaangifte
      * is ingeschreven in de de BRP
      * heeft de volgende onderzoek gegevens
      | aanduiding in onderzoek (83.10) |
      | <aanduiding in onderzoek>       |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                          |
      | type        | GezagNietTeBepalen                                                                              |
      | toelichting | gezag is niet te bepalen omdat de volgende relevante gegevens in onderzoek staan: <toelichting> |

      Voorbeelden:
      | aanduiding in onderzoek | onderzoek omschrijving | toelichting                                            |
      | 010000                  | hele categorie persoon | geboortedatum van de persoon, geboorteland van persoon |
      | 010300                  | hele groep geboorte    | geboortedatum van de persoon, geboorteland van persoon |
      | 010330                  | geboorteland           | geboortedatum van de persoon                           |

    Abstract Scenario: gezag kan wel bepaald worden ondanks dat <onderzoek omschrijving> in onderzoek staat
      Gegeven de persoon 'P3' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft persoon 'P1' als ouder1 vanaf de geboorteaangifte
      * heeft persoon 'P2' als ouder2 vanaf de geboorteaangifte
      * is ingeschreven in de de BRP
      * heeft de volgende onderzoek gegevens
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
      Gegeven de persoon 'P3' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft persoon 'P1' als ouder1 vanaf de geboorteaangifte
      * heeft persoon 'P2' als ouder2 vanaf de geboorteaangifte
      * is ingeschreven in de de BRP
      * heeft de volgende onderzoek gegevens
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
      Gegeven de persoon 'P3' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft persoon 'P1' als ouder1 vanaf de geboorteaangifte
      * heeft persoon 'P2' als ouder2 vanaf de geboorteaangifte
      * is ingeschreven in de de BRP
      * de verblijfplaats heeft de volgende onderzoek gegevens
      | aanduiding in onderzoek (83.10) |
      | <aanduiding in onderzoek>       |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                          |
      | type        | GezagNietTeBepalen                                                                              |
      | toelichting | gezag is niet te bepalen omdat de volgende relevante gegevens in onderzoek staan: <toelichting> |

      Voorbeelden:
      | aanduiding in onderzoek | onderzoek omschrijving        | toelichting                  |
      | 080000                  | hele categorie verblijfplaats | datum vestiging in Nederland |
      | 081400                  | hele groep immigratie         | datum vestiging in Nederland |
      | 081420                  | datum vestiging in Nederland  | datum vestiging in Nederland |

    Abstract Scenario: gezag kan wel bepaald worden ondanks dat <onderzoek omschrijving> in onderzoek staat
      Gegeven de persoon 'P3' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft persoon 'P1' als ouder1 vanaf de geboorteaangifte
      * heeft persoon 'P2' als ouder2 vanaf de geboorteaangifte
      * is ingeschreven in de de BRP
      * de verblijfplaats heeft de volgende onderzoek gegevens
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
      Gegeven de persoon 'P3' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft persoon 'P1' als ouder1 vanaf de geboorteaangifte
      * heeft persoon 'P2' als ouder2 vanaf de geboorteaangifte
      * is ingeschreven in de de BRP
      * de verblijfplaats heeft de volgende onderzoek gegevens
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
      Gegeven de persoon 'P3' met burgerservicenummer '000000036'
      * is minderjarig
      * heeft persoon 'P1' als ouder1 vanaf de geboorteaangifte
      * heeft persoon 'P2' als ouder2 vanaf de geboorteaangifte
      * is ingeschreven in de de BRP
      * geboorteland heeft geen waarde
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                |
      | type        | GezagNietTeBepalen                                                                    |
      | toelichting | gezag is niet te bepalen omdat de volgende relevante gegevens ontbreken: geboorteland |
