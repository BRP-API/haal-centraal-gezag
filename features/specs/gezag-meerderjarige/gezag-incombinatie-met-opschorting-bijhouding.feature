# language: nl
Functionaliteit: opschorten van het bijhouden van de persoonslijst van een meerjarige heeft invloed op de gezagsbepaling

  Een persoonslijst kan om verschillende redenen zijn opgeschort.
  Opschorting betekent dat de gegevens op de PL niet worden bijgehouden.
  Informatie die binnenkomt nadat de PL is opgeschort, wordt bewaard tot
  het moment waarop een niet-ingezetene (weer) ingezetene wordt.
  
  De volgende redenen zijn mogelijk:
   - F - fout
   - O - overlijden
   - E - emigratie
   - M - ministerieel besluit (navo militair)

  Bijzondere reden:
   - R - RNI PL, gegevens worden wel bijgehouden
  
    Achtergrond:
      Gegeven de persoon 'Uwe' met burgerservicenummer '000000012'
      * is meerderjarig
      * is in Nederland geboren
      En de persoon 'Eefke' met burgerservicenummer '000000024'
      * is meerderjarig
      * is in Nederland geboren
      En 'Uwe' en 'Eefke' zijn met elkaar gehuwd
      En de persoon 'Beatrix' met burgerservicenummer '000000036'
      * is minderjarig
      * is in Nederland geboren
      * is ingeschreven in de BRP
      * heeft 'Uwe' als ouder 1
      * heeft 'Eefke' als ouder 2

  Regel: bij opschorting bijhouding is er invloed op de gezagsbepaling
  
    # Op dit moment geeft gezagsmodule: relevante gegevens ontbreken. Het gaat om de volgende gegevens: ouder1 van bevraagde persoon is niet in BRP geregistreerd
    Abstract Scenario: een van de ouders heeft bij de gemeente aangegeven te zijn geëmigreerd, maar is nog niet ingeschreven in RNI gezag is te bepalen er is sprake van TweehoofdigOuderlijkGezag
      Gegeven bijhouding van de persoonsgegevens van 'Uwe' is opgeschort met de volgende gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | gisteren                             | E                                    |
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
      | burgerservicenummer  |
      | 000000012            |
      | 000000024            |
      | 000000036            |

    # Op dit moment geeft gezagsmodule: wel gezagsuitspraak!
    # Let op: toelichting is verzonnen
    Scenario: van een van de ouders is een persoonslijst onterecht dubbel opgevoerd, de persoonslijst is opgeschort als fout en wordt niet gebruikt voor gezag bepaling er is sprake van GezagNietTeBepalen
      Gegeven bijhouding van de persoonsgegevens van 'Uwe' is opgeschort met de volgende gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | gisteren                             | F                                    |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde                |
      | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde                |
      | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                                                                |
      | type                             | GezagNietTeBepalen                                                    |
      | minderjarige.burgerservicenummer | 000000036                                                             |
      | toelichting                      | gezag is niet te bepalen omdat een foutieve persoonslijst is gevonden |

      Voorbeelden:
      | burgerservicenummer  |
      | 000000012            |
      | 000000024            |
      | 000000036            |

    # Op dit moment geeft gezagsmodule: wel gezagsuitspraak!
    # Let op: toelichting is verzonnen
    Scenario: een van de ouders is NAVO militair en mag volgens ministerieel besluit niet langer als ingezetene geregistreerd zijn er is sprake van GezagNietTeBepalen
      Gegeven bijhouding van de persoonsgegevens van 'Uwe' is opgeschort met de volgende gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | gisteren                             | M                                    |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde                |
      | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde                |
      | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                                                                     |
      | type                             | GezagNietTeBepalen                                                         |
      | minderjarige.burgerservicenummer | 000000036                                                                  |
      | toelichting                      | gezag is niet te bepalen omdat minderjarige een diplomatieke status heeft. |

      Voorbeelden:
      | burgerservicenummer  |
      | 000000012            |
      | 000000024            |
      | 000000036            |

    # Op dit moment geeft gezagsmodule: relevante gegevens ontbreken. Het gaat om de volgende gegevens: ouder1 van bevraagde persoon is niet in BRP geregistreerd
    # Volgens overheids documentatie betekend 'R': R - RNI PL, gegevens worden wel bijgehouden. Willen we hier wel gezagsuitspraak?
    Scenario: een ouder staat ingeschreven in RNI
      Gegeven bijhouding van de persoonsgegevens van 'Uwe' is opgeschort met de volgende gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | gisteren                             | R                                    |
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
      | burgerservicenummer  |
      | 000000012            |
      | 000000024            |
      | 000000036            |

    # werkt nu zo
    Scenario: een ouder is overleden en de persoonslijst gemarkeerd als opgeschort met 'O' alleen de andere ouder heeft gezag er is sprake van EenhoofdigOuderlijkGezag
      Gegeven bijhouding van de persoonsgegevens van 'Uwe' is opgeschort met de volgende gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | gisteren                             | O                                    |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde                |
      | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde                |
      | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | EenhoofdigOuderlijkGezag  |
      | minderjarige.burgerservicenummer | 000000036                 |
      | ouder.burgerservicenummer        | 000000024                 |
      
      Voorbeelden:
      | burgerservicenummer  |
      | 000000024            |
      | 000000036            |