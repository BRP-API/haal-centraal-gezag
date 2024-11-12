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
      | 1-12-2022     | erkenning bij geboorteaangifte                      |
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

    Abstract Scenario: Het kind is erkend als ongeboren vrucht <omschrijving>
      Gegeven persoon 'Filip'
      * is geboren op 1-12-2022
      * heeft 'Dirk' als ouder 2
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                                                                                            |
      | type                             | GezagNietTeBepalen                                                                                |
      | toelichting                      | gezag kan niet worden bepaald omdat niet kan worden vastgesteld welke ouder de geboortemoeder is. |

      Voorbeelden:
      | geboortedatum | omschrijving  |
      | 1-12-2022     | vóór 1-1-2023 |
      | 1-1-2023      | op 1-1-2023   |
      | 3-4-2024      | na 1-1-2023   |


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

    Scenario: Minderjarige is erkend bij geboorteaangifte na 1-1-2023 en daarna zijn wijzigingen met andere aktes op minderjarige en op de ouder doorgevoerd
      Gegeven persoon 'Filip'
      * is geboren op 2-9-2023
      * is erkend door 'Dirk' als ouder 2 met erkenning bij geboorteaangifte
      # erkenning door ouder 2 is vernietigd (rechtelijke uitspraak)
      En zijn van ouder 2 de volgende gegevens gewijzigd
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

    