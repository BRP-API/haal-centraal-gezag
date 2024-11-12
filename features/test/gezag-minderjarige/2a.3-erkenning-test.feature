#language: nl

Functionaliteit: Als API tester wil ik controleren dat regel "2a.3 - erkenning" correct werkt

    Achtergrond:
      Gegeven de persoon 'Lotte' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Dirk' met burgerservicenummer '000000024'
      * is meerderjarig
      En de persoon 'Filip' met burgerservicenummer '000000036'
      * heeft 'Lotte' als ouder 1
      * is in Nederland geboren
      * is ingeschreven in de BRP


  Regel: Bij erkenning van de minderjarige vóór 1-1-2023 is sprake van eenhoofdig ouderlijk gezag voor de geboortemoeder

    Abstract Scenario: Voor één van de ouders <soort erkenning>
      Gegeven persoon 'Filip'
      * is geboren op <geboortedatum>
      * is erkend door 'Dirk' als ouder 2 met <soort erkenning>
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
      | geboortedatum | soort erkenning                                     |
      | 3-1-2019      | erkenning bij geboorteaangifte                      |
      | 31-12-2022    | erkenning bij geboorteaangifte                      |
      | 1-12-2021     | erkenning na geboorteaangifte op 2-1-2022           |
      | 1-12-2022     | erkenning na geboorteaangifte op 31-12-2022         |
      | 1-12-2022     | erkenning bij notariële akte op 31-12-2022          |
      | 1-12-2022     | gerechtelijke vaststelling ouderschap op 31-12-2022 |


  Regel: Bij erkenning van de minderjarige op of na 1-1-2023 is sprake van tweehoofdig ouderlijk gezag

    Abstract Scenario: Minderjarige is <omschrijving>
      Gegeven persoon 'Filip'
      * is geboren op <geboortedatum>
      * is erkend door 'Dirk' als ouder 2 met <soort erkenning>
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
      | geboortedatum | soort erkenning                                   | omschrijving                                                               |
      | 1-1-2023      | erkenning bij geboorteaangifte                    | erkend bij geboorteaangifte op 1-1-2023                                    |
      | 2-1-2023      | erkenning bij geboorteaangifte                    | erkend bij geboorteaangifte na 1-1-2023                                    |
      | 29-12-2022    | erkenning na geboorteaangifte op 1-1-2023         | geboren voor 1-1-2023 en erkend op 1-1-2023                                |
      | 1-1-2023      | erkenning na geboorteaangifte op 2-1-2023         | geboren voor 1-1-2023 en erkend na 1-1-2023                                |
      | 29-12-2022    | erkenning na geboorteaangifte op 2-1-2023         | geboren op 1-1-2023 en erkend na 1-1-2023                                  |
      | 1-3-2023      | erkenning na geboorteaangifte op 2-9-2023         | geboren en erkend na 1-1-2023                                              |
      | 29-12-2022    | erkenning bij notariële akte op 1-1-2023          | geboren voor 1-1-2023 en erkend bij notariële akte op 1-1-2023             |
      | 29-12-2022    | erkenning bij notariële akte op 2-1-2023          | geboren voor 1-1-2023 en erkend bij notariële akte na 1-1-2023             |
      | 1-3-2023      | erkenning bij notariële akte op 2-9-2023          | geboren en erkend bij notariële akte na 1-1-2023                           |
      | 29-12-2022    | gerechtelijke vaststelling ouderschap op 1-1-2023 | geboren voor 1-1-2023 en erkend met gerechtelijke vaststelling op 1-1-2023 |
      | 29-12-2022    | gerechtelijke vaststelling ouderschap op 2-1-2023 | geboren voor 1-1-2023 en erkend met gerechtelijke vaststelling na 1-1-2023 |
      | 1-3-2023      | gerechtelijke vaststelling ouderschap op 2-9-2023 | geboren en erkend met gerechtelijke vaststelling na 1-1-2023               |


  Regel: Bij erkenning van de ongeboren vrucht is gezag niet te bepalen
    In geval van erkenning van ongeboren vrucht staan beide ouders op de geboorteakte. De 3e positie van het aktenummer is dan A bij beide ouders.
    In dit geval is gezag niet te bepalen, omdat niet duidelijk is welke van de twee ouders de geboortemoeder is. Ze staan immers beide op de geboorteakte.

    # Waarom is bij erkenning ongeboren vrucht na 1-1-2023 geen sprake van tweehoofdig ouderlijk gezag?
    # Of waarom moet de geboortemoeder worden bepaald bij tweehoofdig ouderlijk gezag?

    Abstract Scenario: Het kind is erkend als ongeboren vrucht <omschrijving>
      Gegeven persoon 'Filip'
      * is geboren op <geboortedatum>
      * heeft 'Dirk' als ouder 2
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde             |
      | type        | GezagNietTeBepalen |
      | toelichting | <toelichting>      |

      Voorbeelden:
      | geboortedatum | omschrijving  | toelichting                                                                                                                                                                            |
      | 1-12-2022     | vóór 1-1-2023 | gezag kan niet worden bepaald omdat niet kan worden vastgesteld welke ouder de geboortemoeder is.                                                                                      |
      | 1-1-2023      | op 1-1-2023   | gezag kan niet worden bepaald omdat bij het bepalen van erkenning relevante gegevens ontbreken. Het gaat om de volgende gegevens: Geboortemoeder van bevraagde persoon niet te bepalen |
      | 3-4-2024      | na 1-1-2023   | gezag kan niet worden bepaald omdat bij het bepalen van erkenning relevante gegevens ontbreken. Het gaat om de volgende gegevens: Geboortemoeder van bevraagde persoon niet te bepalen |


  Regel: Erkenning kan ook in historische categorie zitten en moet dan gebruikt worden

    Scenario: Minderjarige is erkend bij geboorteaangifte na 1-1-2023 en daarna zijn wijzigingen met andere aktes op minderjarige en op de ouder doorgevoerd
      Gegeven persoon 'Filip'
      * is geboren op 2-9-2023
      * is erkend door 'Dirk' als ouder 2 met erkenning bij geboorteaangifte
      En zijn de volgende gegevens gewijzigd
      | voornamen (02.10) | aktenummer (81.20) |
      | Cees              | 1AH0100            |
      En zijn van ouder 2 de volgende gegevens gewijzigd
      | voornamen (02.10) | aktenummer (81.20) |
      | Dana              | 1AH0200            |
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


  Regel: Bij vernietigde erkenning van de minderjarige is sprake van eenhoofdig ouderlijk gezag voor de geboortemoeder

    Scenario: Minderjarige erkenning door ouder 2 na 1-1-2023 is vernietigd
      Gegeven persoon 'Filip'
      * is geboren op 2-9-2023
      * is erkend door 'Dirk' als ouder 2 met erkenning bij geboorteaangifte
      # erkenning door ouder 2 is vernietigd (rechtelijke uitspraak)
      En zijn van ouder 2 de volgende gegevens gecorrigeerd
      | burgerservicenummer (01.20) | geslachtsnaam (02.40) | geboortedatum (03.10) | datum ingang familierechtelijke betrekking (62.10) | aktenummer (81.20) | datum ingang geldigheid (85.10) |
      |                             |                       |                       |                                                    | 1AN0200            | gisteren                        |
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

    
  Regel: Een onjuist en daarna gecorrigeerd gegeven wordt niet gebruikt

    Scenario: erkenning stond eerst geregistreerd na 1-1-2023 maar is gecorrigeerd naar een datum vóór 1-1-2023  
      Gegeven persoon 'Filip'
      * is geboren op 25-12-2022
      * is erkend door 'Dirk' als ouder 2 met erkenning na geboorteaangifte op 2-1-2023
      En zijn van ouder 2 de volgende gegevens gecorrigeerd
      | datum ingang familierechtelijke betrekking (62.10) | aktenummer (81.20) |
      | 30-12-2022                                         | 1AC0100            |
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

    Scenario: erkenning stond eerst geregistreerd als erkenning na geboorte na 1-1-2023 maar is gecorrigeerd naar erkenning bij geboorte vóór 1-1-2023  
      Gegeven persoon 'Filip'
      * is geboren op 25-12-2022
      * is erkend door 'Dirk' als ouder 2 met erkenning na geboorteaangifte op 2-1-2023
      En zijn van ouder 2 de volgende gegevens gecorrigeerd
      | datum ingang familierechtelijke betrekking (62.10) | aktenummer (81.20) |
      | 25-12-2022                                         | 1AB0100            |
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

    Scenario: erkenning stond eerst geregistreerd als erkenning na geboorte voor 1-1-2023 maar is gecorrigeerd naar erkenning bij geboorte na 1-1-2023  
      Gegeven persoon 'Filip'
      * is geboren op 25-12-2022
      * is erkend door 'Dirk' als ouder 2 met erkenning na geboorteaangifte op 29-12-2022
      En zijn van ouder 2 de volgende gegevens gecorrigeerd
      | datum ingang familierechtelijke betrekking (62.10) | aktenummer (81.20) |
      | 2-1-2023                                           | 1AB0100            |
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
