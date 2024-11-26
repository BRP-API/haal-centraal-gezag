#language: nl

Functionaliteit: Als API tester wil ik controleren dat regel "2b.1 - is staande huwelijk of partnerschap geboren" correct werkt

    Achtergrond:
      Gegeven de persoon 'Saskia' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Maarten' met burgerservicenummer '000000024'
      * is meerderjarig
      En de persoon 'Rik' met burgerservicenummer '000000048'
      * is meerderjarig
      En de persoon 'Rachel' met burgerservicenummer '000000036'
      * heeft 'Saskia' als ouder 1 
      * is geboren op 1-12-2022
      * is in Nederland geboren
      * is ingeschreven in de BRP

  
  Regel: Als de ouder op de geboortedatum van de minderjarige een partner had, is sprake van gezamenlijk gezag

    Abstract Scenario: Ouder had bij geboorte van minderjarige partner tot nu toe
      Gegeven 'Saskia' en 'Maarten' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | <datum huwelijk>                                                   |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | GezamenlijkGezag          |
      | minderjarige.burgerservicenummer | 000000036                 |
      | ouder.burgerservicenummer        | 000000012                 |
      | derde.burgerservicenummer        | 000000024                 |

      Voorbeelden:
      | datum huwelijk | omschrijving                   |
      | 20100401       | voor geboorte minderjarige     |
      | 20221130       | dag voor geboorte minderjarige |
      | 20221201       | geboortedag van minderjarige   |

    Scenario: Ouder had bij geboorte van minderjarige een partner en relatie is beëindigd na geboorte van de minderjarige
      Gegeven 'Saskia' en 'Maarten' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | 20100401                                                           |
      En 'Saskia' en 'Maarten' zijn gescheiden met de volgende gegevens
      | datum ontbinding huwelijk/geregistreerd partnerschap (07.10) |
      | 20231101                                                     |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | GezamenlijkGezag          |
      | minderjarige.burgerservicenummer | 000000036                 |
      | ouder.burgerservicenummer        | 000000012                 |
      | derde.burgerservicenummer        | 000000024                 |

    Abstract Scenario: Ouder had bij geboorte van minderjarige partner en relatie is daarna beëindigd en is daarna <omschrijving>
      Gegeven 'Saskia' en 'Maarten' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | 20100401                                                           |
      En 'Saskia' en 'Maarten' zijn gescheiden met de volgende gegevens
      | datum ontbinding huwelijk/geregistreerd partnerschap (07.10) |
      | 20231101                                                     |
      En 'Saskia' en '<persoon tweede huwelijk>' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | 20240526                                                           |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | GezamenlijkGezag          |
      | minderjarige.burgerservicenummer | 000000036                 |
      | ouder.burgerservicenummer        | 000000012                 |
      | derde.burgerservicenummer        | 000000024                 |

      Voorbeelden:
      | persoon tweede huwelijk | omschrijving                   |
      | Maarten                 | hertrouwd met dezelfde persoon |
      | Rik                     | getrouwd met andere persoon    |

    
  Regel: Als de ouder op de geboortedatum van de minderjarige geen partner had, is sprake van eenhoofdig ouderlijk gezag

    Abstract Scenario: Ouder had bij geboorte van minderjarige geen partner en is na geboorte van minderjarige getrouwd
      Gegeven 'Saskia' en 'Maarten' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | <datum huwelijk>                                                   |
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

      Voorbeelden:
      | datum huwelijk | omschrijving                     |
      | 20230401       | na geboorte van minderjarige     |
      | 20221202       | dag na geboorte van minderjarige |

    Abstract Scenario: Ouder had huwelijk die voor geboorte minderjarige is beëindigd
      Gegeven 'Saskia' en 'Maarten' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | 20100401                                                           |
      En 'Saskia' en 'Maarten' zijn gescheiden met de volgende gegevens
      | datum ontbinding huwelijk/geregistreerd partnerschap (07.10) |
      | <datum ontbinding>                                           |
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

      Voorbeelden:
      | datum ontbinding | omschrijving                                          |
      | 20221101         | voor geboorte van minderjarige                        |
      | 20221201         | geboortedag van minderjarige                          |
      | 20100401         | per datum huwelijkssluiting (bijv. nietig verklaring) |

    Abstract Scenario: Ouder had huwelijk die voor geboorte minderjarige is beëindigd en is na geboorte <omschrijving>
      Gegeven 'Saskia' en 'Maarten' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | 20100401                                                           |
      En 'Saskia' en 'Maarten' zijn gescheiden met de volgende gegevens
      | datum ontbinding huwelijk/geregistreerd partnerschap (07.10) |
      | 20221101                                                     |
      En 'Saskia' en '<persoon tweede huwelijk>' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | 20240526                                                           |
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

      Voorbeelden:
      | persoon tweede huwelijk | omschrijving                   |
      | Maarten                 | hertrouwd met dezelfde persoon |
      | Rik                     | getrouwd met andere persoon    |


  Regel: In geval van ontkenning van het door huwelijk of geregistreerd partnerschap ontstane ouderschap is er eenhoofdig ouderlijk gezag

    # uit stroomschema afleidingsregels kan ik dit niet herleiden. Dat dit gebeurt blijkt uit volgende scenario.
    # uit de logging blijkt dat OG1 is bepaald op route 40o1
    # v0101='Ja', v0102='Ja', v0103='Nee', v0103A='Nee', v0103B='null', v0104='Nee', v0201='Een_ouder', v02A01='null', v02A02='null', v02A03='null', v02B01='Nee', v0301='null', v0302='null', v04A02='null', v04A03='Nee_ouder1', v04B01='null'
    # dus regel 2b.1 denkt dat er geen huwelijk is van de ouder (wanneer alle stappen vanaf "En persoon'Rachel'" weg worden gelaten denkt de regel wél dat er een huwelijk is en wordt gezamenlijk gezag gegeven)

    # Deze regel/uitkomst is wenselijk, maar de reden waarom lijkt niet correct, althans 
    # - is erg verwarrend wanneer deze regel onderdeel is van 'is staande huwelijk of partnerschap geboren'
    # - de feature zegt dat deze uitkomst niet is geïmplementeerd

    # Zie opmerking in de feature:
    #   Opmerkingen
    #   Bij deze vraag kan een erkenning nietig verklaard zijn en heeft de minderjarige nog maar één ouder. Echter, als gekeken wordt of
    #   de overgebleven ouder een relatie had tijdens de geboorte van de minderjarige kan het voorkomen dat de partner van de ouder
    #   uitgerekend de persoon is waar de nietig verklaarde erkenning betrekking op heeft. In zo’n geval heeft de partner geen gezag over de
    #   minderjarige dus geen gezamenlijk gezag. De huidige afleiding voorziet hier niet in.
    #   Aanbevelingen

    #   Voorstel is ook te kijken naar een nietig verklaarde erkenning in de aktenummers van de ouders. Daarmee wordt het antwoord Nee
    #   aangevuld met “of nietig verklaarde erkenning” en krijgt de partner met nietig verklaarde erkenning geen gezag.

    # Dit lijkt dus toch geïmplementeerd, ook al zegt de feature van niet.

    Scenario: Ouder had bij geboorte van minderjarige partner tot nu toe en de partner heeft het ouderschap ontkend
      Gegeven 'Saskia' en 'Maarten' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | 20221014                                                           |
      En persoon 'Rachel'
      * heeft 'Maarten' als ouder 2
      # ouder 2 ontkent ouderschap:
      En zijn van ouder 2 de volgende gegevens gecorrigeerd
      | burgerservicenummer (01.20) | geslachtsnaam (02.40) | datum ingang familierechtelijke betrekking (62.10) | aktenummer (81.20) |
      |                             |                       |                                                    | 1AE0100            |
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


  Regel: Als de partner van de ouder niet staat in geschreven in de BRP of RNI, dan ...
    Dit is het geval wanneer er wel een partner bij de ouder staat, maar zonder burgerservicenummer

    Scenario: Ouder had bij geboorte van minderjarige partner die niet in de BRP of het RNI staat ingeschreven
      Gegeven 'Saskia' is gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) | geslachtsnaam (02.40) | geboortedatum (03.10) |
      | 20221014                                                           | Serge                 | 20010928              |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                                               |
      | type        | GezagNietTeBepalen                                                                                                                   |
      | toelichting | Gezag is niet te bepalen, omdat de volgende relevante gegevens in onderzoek staan. Persoonslijst van ouder 1: ... |

