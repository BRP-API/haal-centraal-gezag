#language: nl

Functionaliteit: Als API tester wil ik controleren dat regels "1.3" voor uitsluiten gezag onder buitenlands recht correct werkt
  Wanneer een persoon verhuist naar een ander land, neemt deze het gezag mee naar het nieuwe land.
  Daarom is het gezag niet te bepalen van een minderjarige die uit een ander land  is geëmigreerd.
  Er is dan immers niet duidelijk welk gezag de persoon in het andere land had en meegenomen heeft.

  Na immigratie (of remigratie) kan in Nederland (onder Nederlands recht) een beslissing worden genomen over gezag, 
  zoals adoptie of een gerechtelijke uitspraak over gezag.

  Alleen wanneer het gezag zeker onder Nederlands recht valt kan een gezaguitspraak gedaan worden.

  Er zijn verschillende gebeurtenissen die hier relevant zijn:
  1. geboren worden in Nederland en inschrijven als ingezetene
  2. voor het eerst inschrijven als niet-ingezetene in het RNI (persoon verblijft buiten Nederland)
  2. voor het eerst inschrijven als ingezetene in Nederland vanuit het buitenland (persoon is buiten Nederland geboren)
  3. emigreren en inschrijven als niet-ingezetene in het RNI
  4. herinschrijven als ingezetene in Nederland (persoon is geëmigreerd geweest)
  5. adoptie in Nederland
  6. gerechtelijke uitspraak tot gezag

  Alleen de gebeurtenis die het laatste (meest recent) is gebeurd bepaalt of het gezag onder Nederlands recht valt 
  of mogelijk onder buitenlands recht valt.

  Voor het bepalen van de meest recente gebeurtenis wordt op datum gesorteerd, waarbij de volgende datums worden gebruikt:
  1. Geboorte in Nederland: Geboortedatum
  2. Inschrijving in het RNI: Datum eerste inschrijving BRP/RNI
  3. Eerste inschrijving van in het buitenland geboren persoon: Datum vestiging in Nederland
  4. Emigratie naar het buitenland: Datum aanvang adres buitenland
  5. Herinschrijven van eerder geëmigreerd persoon: Datum vestiging in Nederland
  6. Adoptie in Nederland: Datum ingang familierechtelijke betrekking bij de adoptieouder
  7. Gerechtelijke uitspraak tot gezag: Datum ingang geldigheid van de gezagsverhouding

  
    Achtergrond:
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd


  Regel: Als de meest recente gebeurtenis is geboorte in Nederland, dan kan het gezag onder Nederlands recht worden bepaald
    # Hoe werkt het als Nederlandse ouders bijv. op vakantie kind geboren wordt in het buitenland
    # Maar het kind nooit in het buitenland gewoond heeft?
    # Is geboorteland dus echt bepalend?


  Regel: Als de persoon op dit moment ingeschreven staat in het RNI, dan is het gezag niet te bepalen

    Scenario: Minderjarige is ingeschreven in het RNI en heeft nooit in Nederland verbleven

    Scenario: Minderjarige is ingeschreven in het RNI na emigratie uit Nederland


  Regel: Als de meest recente gebeurtenis is inschrijven vanuit het buitenland, dan is het gezag niet te bepalen

    Scenario: Minderjarige is buiten Nederland geboren
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is geboren in het buitenland
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is op 15-5-2014 geïmmigreerd 
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                               |
      | type        | GezagNietTeBepalen                                                                                                   |
      | toelichting | gezag is niet te bepalen omdat minderjarige in het buitenland is geboren en geen Nederlandse adoptie-akte bekend is. |

    Scenario: Minderjarige is buiten Nederland geboren, is eerst ingeschreven in het RNI en daarna geëmigreerd naar Nederland
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is geboren in het buitenland
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is op 14-10-2011 ingeschreven in het RNI
      * is op 15-5-2014 geïmmigreerd 
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                               |
      | type        | GezagNietTeBepalen                                                                                                   |
      | toelichting | gezag is niet te bepalen omdat minderjarige in het buitenland is geboren en geen Nederlandse adoptie-akte bekend is. |

    Scenario: Minderjarige is buiten Nederland geboren en is daarna geëmigreerd geweest
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is geboren in het buitenland
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is op 15-5-2014 geïmmigreerd 
      * is op 14-10-2018 geëmigreerd
      * is op 30-7-2023 geremigreerd 
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                               |
      | type        | GezagNietTeBepalen                                                                                                   |
      | toelichting | gezag is niet te bepalen omdat minderjarige in het buitenland is geboren en geen Nederlandse adoptie-akte bekend is. |


  Regel: Als de meest recente gebeurtenis is herinschrijven in Nederland na emigratie, dan is het gezag niet te bepalen

    Scenario: Minderjarige is in Nederland geboren en heeft nooit in het buitenland verbleven
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

    Scenario: Minderjarige is in Nederland geboren en is geëmigreerd geweest
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * is ingeschreven in de BRP
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      En is geëmigreerd geweest
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


  Regel: Als de meest recente gebeurtenis is adoptie in Nederland, dan kan het gezag onder Nederlands recht worden bepaald

    Scenario: Minderjarige is buiten Nederland geboren en is geadopteerd met Nederlandse akte
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is geboren in het buitenland
      * is minderjarig
      * is op 15-5-2014 geïmmigreerd
      En 'Bert' is geadopteerd door 'Gerda' als ouder 1 sinds 2-1-2016
      En 'Bert' is geadopteerd door 'Aart' als ouder 2 sinds 2-1-2016
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

    # Het volgende scenario toont verwachte uitkomst volgens afleidingsregels (stroomschema).
    # Maar ik denk dat dit niet correct is. Ik had hier verwacht dat gezag niet te bepalen is.
    # De minderjarige is immers geëmigreerd geweest na de adoptie
    Scenario: Minderjarige is buiten Nederland geboren, is geadopteerd met Nederlandse akte en is daarna geëmigreerd geweest
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is geboren in het buitenland
      * is minderjarig
      * is op 15-5-2014 geïmmigreerd
      En 'Bert' is geadopteerd door 'Gerda' als ouder 1 sinds 2-1-2016
      En 'Bert' is geadopteerd door 'Aart' als ouder 2 sinds 2-1-2016
      En is op 30-11-2021 geëmigreerd
      En is op 10-5-2023 geïmmigreerd
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

    Scenario: Minderjarige is in Nederland geboren, is geëmigreerd geweest en is daarna geadopteerd met Nederlandse akte
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is geboren in het buitenland
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * is op 15-5-2014 geïmmigreerd
      En is op 30-11-2021 geëmigreerd
      En is op 10-5-2023 geïmmigreerd
      En 'Bert' is geadopteerd door 'Aart' als ouder 2 sinds 2-1-2024
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

    # Het volgende scenario toont verwachte uitkomst volgens afleidingsregels (stroomschema).
    # Maar ik denk dat dit niet correct is. Ik had hier verwacht dat gezag wel te bepalen is.
    # De minderjarige is immers geadopteerd na het verblijf in het buitenland en is sindsdien alleen in Nederland ingeschreven geweest
    Scenario: Minderjarige is in Nederland geboren, is geëmigreerd geweest en is daarna geadopteerd met Nederlandse akte
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * is ingeschreven in de BRP
      * heeft 'Gerda' als ouder 1
      En is op 30-11-2021 geëmigreerd
      En is op 10-5-2023 geïmmigreerd
      En 'Bert' is geadopteerd door 'Aart' als ouder 2 sinds 19-1-2024
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


  Regel: Als de meest recente gebeurtenis is een gerechtelijke uitspraak over gezag, dan kan het gezag onder Nederlands recht worden bepaald

    # Het volgende scenario toont verwachte uitkomst volgens afleidingsregels (stroomschema).
    # Maar ik denk dat dit niet correct is. Ik had hier verwacht dat gezag wel te bepalen is.
    # De rechter heeft zich immers na het verblijf buitenland uitgesproken over wie het gezag heeft
    Scenario: Minderjarige is in Nederland geboren, is geëmigreerd geweest en er is daarna gerechtelijke uitspraak over gezag gedaan
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * is ingeschreven in de BRP
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      En is op 30-11-2021 geëmigreerd
      En is op 10-5-2023 geïmmigreerd
      En op 19-1-2024 is in een gerechtelijke uitspraak is het gezag toegewezen aan 'ouder 1'
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

    # Het volgende scenario toont verwachte uitkomst volgens afleidingsregels (stroomschema).
    # Maar ik denk dat dit mogelijk niet correct is. Ik had hier verwacht (gehoopt) dat gezag wel te bepalen is.
    # De minderjarige heeft de gezaguitspraak in Nederland ook meegenomen naar het buitenland
    # Ik vind deze situatie relevant, omdat dit een patroon is bij kindontvoering: na toewijzing gezag aan de ene ouder, "ontvoert" de andere ouder het kind naar het buitenland
    # De huidige regel betekent dat ook na het terughalen naar Nederland van de minderjarige, de gezag API het gezag niet levert
    Scenario: Minderjarige is in Nederland geboren, er is gerechtelijke uitspraak over gezag gedaan en is daarna geëmigreerd geweest
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * is ingeschreven in de BRP
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      En op 14-10-2021 is in een gerechtelijke uitspraak is het gezag toegewezen aan 'ouder 1'
      En is op 30-11-2021 geëmigreerd
      En is op 10-5-2023 geïmmigreerd
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

    # Het volgende scenario toont verwachte uitkomst volgens afleidingsregels (stroomschema).
    # Maar ik denk dat dit niet correct is. Ik had hier verwacht dat gezag wel te bepalen is.
    # De rechter heeft zich immers na immigratie uitgesproken over wie het gezag heeft
    # Minderjarige heeft na de gerechtelijke uitspraak niet meer buiten Nederland verbleven
    Scenario: Minderjarige is buiten Nederland geboren en er is gerechtelijke uitspraak over gezag gedaan
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is geboren in het buitenland
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is op 15-5-2014 geïmmigreerd
      En op 14-10-2021 is in een gerechtelijke uitspraak is het gezag toegewezen aan 'ouder 1'
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                               |
      | type        | GezagNietTeBepalen                                                                                                   |
      | toelichting | gezag is niet te bepalen omdat minderjarige in het buitenland is geboren en geen Nederlandse adoptie-akte bekend is. |
