#language: nl

Functionaliteit: Als API tester wil ik controleren dat regel "2a.2 - adoptie" correct werkt

    Achtergrond:
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is ingeschreven in de BRP


  Regel: Als er één ouder is, heeft die ouder eenhoofdig ouderlijk gezag

    Abstract Scenario: Minderjarige met één ouder die is <omschrijving>
      Gegeven persoon 'Bert'
      * is geboren op <geboortedatum>
      * <gebeurtenis>
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                   |
      | type                             | EenhoofdigOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000036                |
      | ouder.burgerservicenummer        | 000000012                |


      Voorbeelden:
      | gebeurtenis                                    | geboortedatum | omschrijving                    |
      | heeft 'Gerda' als ouder 1                      | 3-1-2019      | de geboortemoeder vóór 1-1-2023 |
      | heeft 'Gerda' als ouder 1                      | 3-1-2024      | de geboortemoeder ná 1-1-2023   |
      | 'Bert' is geadopteerd door 'Gerda' als ouder 1 | 3-1-2019      | de adoptieouder vóór 1-1-2023   |
      | 'Bert' is geadopteerd door 'Gerda' als ouder 1 | 3-1-2024      | de adoptieouder ná 1-1-2023     |


  Regel: Als er twee ouders zijn en die ouders zijn ooit getrouwd geweest (of zijn dat nog steeds) of hebben ooit partnerschap gehad (of hebben dat nog steeds), dan hebben beide ouders gezag

    Abstract Scenario: Minderjarige met <omschrijving>
      Gegeven 'Gerda' en 'Aart' zijn met elkaar gehuwd
      En persoon 'Bert'
      * is geboren op <geboortedatum>
      * <gebeurtenis ouder 1>
      * <gebeurtenis ouder 2>
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
      | gebeurtenis ouder 1       | gebeurtenis ouder 2                                                             | geboortedatum | omschrijving                                      |
      | heeft 'Gerda' als ouder 1 | heeft 'Aart' als ouder 2                                                        | 3-1-2019      | twee ouders sinds geboorte vóór 1-1-2023          |
      | heeft 'Gerda' als ouder 1 | heeft 'Aart' als ouder 2                                                        | 3-1-2024      | twee ouders sinds geboorte ná 1-1-2023            |
      | heeft 'Gerda' als ouder 1 | 'Bert' is geadopteerd door 'Aart' als ouder 2                                   | 3-1-2019      | geboortemoeder en stiefvaderadoptie vóór 1-1-2023 |
      | heeft 'Gerda' als ouder 1 | 'Bert' is geadopteerd door 'Aart' als ouder 2                                   | 3-1-2024      | geboortemoeder en stiefvaderadoptie ná 1-1-2023   |
      | heeft 'Gerda' als ouder 1 | is erkend door 'Aart' als ouder 2 met erkenning na geboorteaangifte op 2-1-2022 | 3-1-2019      | geboortemoeder en erkenning vóór 1-1-2023         |
      | heeft 'Gerda' als ouder 1 | is erkend door 'Aart' als ouder 2 met erkenning na geboorteaangifte op 2-1-2024 | 3-1-2019      | geboortemoeder en erkenning ná 1-1-2023           |

    Abstract Scenario: Minderjarige met twee ouders die <omschrijving>
      Gegeven 'Gerda' en 'Aart' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | <datum trouwen>                                                    |
      Gegeven 'Gerda' en 'Aart' zijn gescheiden met de volgende gegevens
      | datum ontbinding huwelijk/geregistreerd partnerschap (07.10) |
      | <datum scheiden>                                             |
      En persoon 'Bert'
      * is geboren op 3-1-2019
      * 'Bert' is geadopteerd door 'Gerda' als ouder 1
      * 'Bert' is geadopteerd door 'Aart' als ouder 2
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
      | datum trouwen | datum scheiden | omschrijving                                                      |
      | 20170327      | 20221119       | waren gehuwd op geboortedatum minderjarige                        |
      | 20170327      | 20181203       | waren gehuwd en daarna gescheiden vóór geboortedatum minderjarige |
      | 20220405      | 20240612       | zijn gehuwd na geboortedatum minderjarige en daarna gescheiden    |
     

  Regel: Als er twee ouders zijn en die ouders zijn nooit getrouwd geweest en hebben nooit partnerschap gehad, en de minderjarige is geadopteerd, dan hebben beide ouders gezag
    Hierbij maakt het hier uit of de minderjarige door beide ouders of door één van beide ouders geadopteerd is

    Abstract Scenario: Minderjarige met twee ouders die nooit gehuwd of partner waren en minderjarige <omschrijving>
      Gegeven persoon 'Bert'
      * is geboren op 3-1-2019
      * <gebeurtenis ouder 1>
      * <gebeurtenis ouder 2>
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
      | gebeurtenis ouder 1                                             | gebeurtenis ouder 2                                                             | omschrijving                                                                 |
      | 'Bert' is geadopteerd door 'Gerda' als ouder 1 sinds 2-1-2022   | 'Bert' is geadopteerd door 'Aart' als ouder 2 sinds 2-1-2022                    | is geadopteerd door beide ouders vóór 1-1-2023                               |
      | 'Bert' is geadopteerd door 'Gerda' als ouder 1 sinds 2-1-2022   | 'Bert' is geadopteerd door 'Aart' als ouder 2 sinds 17-9-2022                   | is geadopteerd door beide ouders met verschillende datum vóór 1-1-2023       |
      | 'Bert' is geadopteerd door 'Gerda' als ouder 1 sinds 2-1-2022   | 'Bert' is geadopteerd door 'Aart' als ouder 2 sinds 3-1-2024                    | is geadopteerd door beide ouders met verschillende datum vóór en ná 1-1-2023 |
      | heeft 'Gerda' als ouder 1                                       | 'Bert' is geadopteerd door 'Aart' als ouder 2 sinds 2-1-2022                    | heeft geboortemoeder en is geadopteerd door andere ouder vóór 1-1-2023       |
      | heeft 'Gerda' als ouder 1                                       | 'Bert' is geadopteerd door 'Aart' als ouder 2 sinds 3-1-2024                    | heeft geboortemoeder en is geadopteerd door andere ouder ná 1-1-2023         |
      | 'Bert' is geadopteerd door 'Gerda' als ouder 1 sinds 27-12-2019 | is erkend door 'Aart' als ouder 2 met erkenning na geboorteaangifte op 2-1-2022 | is geadopteerd door een ouder en vóór 1-1-2023 erkend door andere ouder      |
      | 'Bert' is geadopteerd door 'Gerda' als ouder 1 sinds 27-12-2019 | is erkend door 'Aart' als ouder 2 met erkenning na geboorteaangifte op 3-1-2024 | is geadopteerd door een ouder en ná 1-1-2023 erkend door andere ouder        |
      | 'Bert' is geadopteerd door 'Gerda' als ouder 1 sinds 3-1-2024   | is erkend door 'Aart' als ouder 2 met erkenning na geboorteaangifte op 3-1-2024 | is ná 1-1-2023 geadopteerd door een ouder en erkend door andere ouder        |


  Regel: Als er twee ouders zijn en die ouders zijn nooit getrouwd geweest en hebben nooit partnerschap gehad, de minderjarige is niet geadopteerd en de minderjarige is erkend vóór 1-1-2023, dan heeft de geboortemoeder eenhoofdig ouderlijk gezag
    Erkenning is herkenbaar aan het aktenummer. Wanneer het aktenummer bij op de categorie ouder op de derde positie een 'B', 'C', 'J' of 'V' heeft, dan heeft deze ouder de minderjarige erkend.
    
    
