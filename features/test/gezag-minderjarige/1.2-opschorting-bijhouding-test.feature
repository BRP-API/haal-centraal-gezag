#language: nl

Functionaliteit: Als API tester wil ik controleren dat regel "1.2 - Is persoon niet overleden" correct werkt

  Overlijden van een minderjarige wordt afgeleid uit de aanwezigheid van datum opschorting bijhouding.
  De aanname die daaronder ligt is dat een andere reden voor opschorting bijhouding - inschrijving in RNI - als is afgevangen in vraag 1.1.
  Dit houdt echter geen rekening met andere redenen voor opschorting bijhouding.

    Achtergrond:
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd


    Scenario: er is geen opschorting bijhouding en persoon is ingeschreven in de BRP
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * is ingeschreven in de BRP
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
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

    Scenario: De persoon is overleden
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * is ingeschreven in de BRP
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      En 'Bert' is overleden
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon geen gezag

    # Het volgende scenario geeft geen gezag, want interpreteert een waarde voor datum opschorting bijhouding als "is overleden"
    # Dit is naar mijn mening niet correct
    # De beschreven situatie is altijd tijdelijk. De burger meldt bij de eigen gemeente dat deze gaat emigreren.
    # Inschrijving in RNI gebeurt dan binnen enkele dagen.
    # Vervelend als de minderjarige in die dagen het land niet uit mag met de ouders, omdat de ouders volgens de gezag-api geen gezag over het kind hebben...
    Scenario: De persoon heeft bij de gemeente aangegeven te zijn geëmigreerd, maar is nog niet ingeschreven in RNI
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * is ingeschreven in de BRP
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      En 'Bert' is geëmigreerd
      En bijhouding van de persoonsgegevens van 'Bert' is opgeschort met de volgende gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | gisteren                             | E                                    |
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

    # Het volgende scenario geeft geen gezag, want interpreteert een waarde voor datum opschorting bijhouding als "is overleden"
    # Ik weet niet zeker of we in dit geval wel een gezaguitspraak zouden kunnen doen. Bijhouding is immers opgeschort en de verblijfplaats is onbekend.
    # Het scenario gaat er vanuit dat gezag niet te bepalen het juiste antwoord is (de toelichting heb ik zelf verzonnen).
    Scenario: De persoon is NAVO militair en mag volgens ministerieel besluit niet langer als ingezetene geregistreerd zijn
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * is ingeschreven in de BRP
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      # heeft niet de Nederlandse nationaliteit
      # de verblijfplaats van 'Bert' is gewijzigd naar volledig onbekend
      En bijhouding van de persoonsgegevens van 'Bert' is opgeschort met de volgende gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | gisteren - 2 jaar                    | M                                    |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                     |
      | type        | GezagNietTeBepalen                                                         |
      | toelichting | gezag is niet te bepalen omdat minderjarige een diplomatieke status heeft. |

    # Wanneer een ouder NAVO militair wordt bijhouding opgeschort en wordt de verblijfplaats volledig onbekend gemaakt
    # Dit geldt dan voor de militair, de echtgenoot/geregistreerde partner en inwonende minderjarige kinderen.
    # Volgens regel 1.2 en regels 4a en 4b worden dan alle gezinsleden dan beschouwd als overleden en wordt dus geen gezag gegeven
    # Dit speelt dus niet alleen bij vraag 1.2, maar ook in vragen 4a en 4b.
    # Het scenario gaat er vanuit dat gezag niet te bepalen het juiste antwoord is (de toelichting heb ik zelf verzonnen).
    Scenario: De ouder is NAVO militair en mag volgens ministerieel besluit niet langer als ingezetene geregistreerd zijn
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * is ingeschreven in de BRP
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      # heeft niet de Nederlandse nationaliteit
      # de verblijfplaats van 'Bert' is gewijzigd naar volledig onbekend
      En bijhouding van de persoonsgegevens van 'Bert' is opgeschort met de volgende gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | gisteren - 2 jaar                    | M                                    |
      En bijhouding van de persoonsgegevens van 'Gerda' is opgeschort met de volgende gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | gisteren - 2 jaar                    | M                                    |
      En bijhouding van de persoonsgegevens van 'Bert' is opgeschort met de volgende gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | gisteren - 2 jaar                    | M                                    |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                     |
      | type        | GezagNietTeBepalen                                                         |
      | toelichting | gezag is niet te bepalen omdat minderjarige een diplomatieke status heeft. |


    # voor volgende scenario is alleen inschrijving RNI als gemeente van inschrijving relevant
    # opschorting bijhouding en emigratie (verblijfplaats met vertrek land gevuld) worden niet gebruikt
    # is desondanks opgenomen om het scenario overeen te laten komen met hoe het in de werkelijkheid zal uitzien
    Scenario: De persoon is geëmigreerd en staat ingeschreven in RNI
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      En 'Bert' is geëmigreerd
      En bijhouding van de persoonsgegevens van 'Bert' is opgeschort met de volgende gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | gisteren - 1 jaar                    | R                                    |
      En is ingeschreven in de RNI
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                               |
      | type        | GezagNietTeBepalen                                                   |
      | toelichting | gezag is niet te bepalen omdat minderjarige niet in Nederland woont. |
