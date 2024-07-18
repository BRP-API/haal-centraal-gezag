#language: nl

Functionaliteit: 1.2a - Is persoon minderjarig en niet overleden?


    Achtergrond:
    Gegeven adres 'A1' heeft de volgende gegevens
    | gemeentecode (92.10) | straatnaam (11.10) | huisnummer (11.20) | identificatiecode nummeraanduiding (11.90) |
    | 518                  | Turfmarkt          | 1                  | 0518200000583526                           |
    
    
  Regel: Wanneer de persoon 18 jaar of ouder heeft niemand gezag over de persoon

    Abstract Scenario: geen gezag want persoon is <leeftijd omschrijving>
      Gegeven de persoon met burgerservicenummer '000000012' heeft de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer (01.20) | 000000012 |
      | voornamen (02.10)           | Ellen     |
      | geslachtsnaam (02.40)       | Eta       |
      | geboortedatum (03.10)       | 19750901  |
      | geboorteland (03.30)        | 6030      |
      En de persoon is ingeschreven op adres 'A1' met de volgende gegevens
      | naam                              | waarde |
      | gemeente van inschrijving (09.10) | 518    |
      En de persoon heeft (nog) een 'kind' met de volgende gegevens
      | naam                            | waarde           |
      | burgerservicenummer (01.20)     | 000000024        |
      | voornamen (02.10)               | Enzo             |
      | geslachtsnaam (02.40)           | Eta              |
      | geboortedatum (03.10)           | <geboorte datum> |
      | geboorteland (03.30)            | 6030             |
      | aktenummer (81.20)              | 1AA0104          |
      | ingangsdatum geldigheid (85.10) | <geboorte datum> |
      En de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
      | naam                        | waarde           |
      | burgerservicenummer (01.20) | 000000024        |
      | voornamen (02.10)           | Enzo             |
      | geslachtsnaam (02.40)       | Eta              |
      | geboortedatum (03.10)       | <geboorte datum> |
      | geboorteland (03.30)        | 6030             |
      | aktenummer (81.20)          | 1AA0104          |
      En de persoon heeft een ouder '1' met de volgende gegevens
      | naam                                               | waarde           |
      | burgerservicenummer (01.20)                        | 000000012        |
      | voornamen (02.10)                                  | Ellen            |
      | geslachtsnaam (02.40)                              | Eta              |
      | geboortedatum (03.10)                              | 19750901         |
      | geboorteland (03.30)                               | 6030             |
      | geslachtsaanduiding (04.10)                        | V                |
      | aktenummer (81.20)                                 | 1AA0105          |
      | ingangsdatum geldigheid (85.10)                    | <geboorte datum> |
      | datum ingang familierechtelijke betrekking (62.10) | <geboorte datum> |
      En de persoon heeft een ouder '2' met de volgende gegevens
      | naam                                               | waarde           |
      | aktenummer (81.20)                                 | 1AA0105          |
      | ingangsdatum geldigheid (85.10)                    | <geboorte datum> |
      | datum ingang familierechtelijke betrekking (62.10) | <geboorte datum> |
      En de persoon is ingeschreven op adres 'A1' met de volgende gegevens
      | naam                              | waarde   |
      | gemeente van inschrijving (09.10) | 518      |
      Als gezag wordt gezocht met de volgende parameters
      | naam | waarde    |
      | bsn  | 000000024 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
      En heeft de persoon geen gezag

      Voorbeelden:
      | geboorte datum     | leeftijd omschrijving        |
      | gisteren - 18 jaar | 18 jaar en één dag           |
      | vandaag - 18 jaar  | vandaag 18 jaar oud geworden |
      | morgen - 19 jaar   | 18 jaar, wordt morgen 19     |
      | morgen - 20 jaar   | 19 jaar                      |

    Abstract Scenario: wel gezag want persoon is <leeftijd omschrijving>
      Gegeven de persoon met burgerservicenummer '000000012' heeft de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer (01.20) | 000000012 |
      | voornamen (02.10)           | Ellen     |
      | geslachtsnaam (02.40)       | Eta       |
      | geboortedatum (03.10)       | 19750901  |
      | geboorteland (03.30)        | 6030      |
      En de persoon is ingeschreven op adres 'A1' met de volgende gegevens
      | naam                              | waarde |
      | gemeente van inschrijving (09.10) | 518    |
      En de persoon heeft (nog) een 'kind' met de volgende gegevens
      | naam                            | waarde           |
      | burgerservicenummer (01.20)     | 000000024        |
      | voornamen (02.10)               | Enzo             |
      | geslachtsnaam (02.40)           | Eta              |
      | geboortedatum (03.10)           | <geboorte datum> |
      | geboorteland (03.30)            | 6030             |
      | aktenummer (81.20)              | 1AA0104          |
      | ingangsdatum geldigheid (85.10) | <geboorte datum> |
      En de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
      | naam                        | waarde           |
      | burgerservicenummer (01.20) | 000000024        |
      | voornamen (02.10)           | Enzo             |
      | geslachtsnaam (02.40)       | Eta              |
      | geboortedatum (03.10)       | <geboorte datum> |
      | geboorteland (03.30)        | 6030             |
      | aktenummer (81.20)          | 1AA0104          |
      En de persoon heeft een ouder '1' met de volgende gegevens
      | naam                                               | waarde           |
      | burgerservicenummer (01.20)                        | 000000012        |
      | voornamen (02.10)                                  | Ellen            |
      | geslachtsnaam (02.40)                              | Eta              |
      | geboortedatum (03.10)                              | 19750901         |
      | geboorteland (03.30)                               | 6030             |
      | geslachtsaanduiding (04.10)                        | V                |
      | aktenummer (81.20)                                 | 1AA0105          |
      | ingangsdatum geldigheid (85.10)                    | <geboorte datum> |
      | datum ingang familierechtelijke betrekking (62.10) | <geboorte datum> |
      En de persoon heeft een ouder '2' met de volgende gegevens
      | naam                                               | waarde           |
      | aktenummer (81.20)                                 | 1AA0105          |
      | ingangsdatum geldigheid (85.10)                    | <geboorte datum> |
      | datum ingang familierechtelijke betrekking (62.10) | <geboorte datum> |
      En de persoon is ingeschreven op adres 'A1' met de volgende gegevens
      | naam                              | waarde   |
      | gemeente van inschrijving (09.10) | 518      |
      Als gezag wordt gezocht met de volgende parameters
      | naam | waarde    |
      | bsn  | 000000024 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                   |
      | type                             | EenhoofdigOuderlijkGezag |
      | minderjarige.burgerservicenummer | 000000024                |
      | ouder.burgerservicenummer        | 000000012                |

      Voorbeelden:
      | geboorte datum   | leeftijd omschrijving         |
      | vandaag          | vandaag geboren (0 dagen oud) |
      | morgen - 2 jaar  | 2 jaar oud                    |
      | morgen - 18 jaar | 17 jaar oud, wordt morgen 18  |


  Regel: Wanneer de geboortedatum van de persoon volledig onbekend is, heeft niemand gezag over de persoon
    # dit concludeer ik uit pseudocode, moet nog controleren op werkelijke uitvoer. Bijvoorbeeld 999995066.
    # ik denk dat het functioneel beter is 'N' te geven, dan wel ook te controleren op datum eerste inschrijving gba


  Regel: Wanneer van de geboortedatum alleen jaar bekend is, en 1 januari van dat jaar is 18 jaar of meer geleden, heeft niemand gezag over de persoon
    # dit concludeer ik uit pseudocode, moet nog controleren op werkelijke uitvoer (wanneer ik hier geschikt testgeval voor vind)
    # ik denk dat het functioneel beter is 'N' te geven


  Regel: Wanneer van de geboortedatum alleen jaar en maand bekend is, en de eerste dag van die maand is 18 jaar of meer geleden, heeft niemand gezag over de persoon


  Regel: Wanneer de persoon is overleden, heeft niemand gezag over de persoon
    # Dit is het geval wanneer reden opschorting bijhouding is "O" (overlijden)

    Abstract Scenario:

      Voorbeelden:
      | omschrijving                                                            | geboorte datum     | datum opschorting |
      | persoon is minderjarig en overleden                                     | gisteren - 15 jaar | morgen - 8 jaar   |
      | persoon is als minderjarige overleden, maar is nu niet meer minderjarig | gisteren - 21 jaar | morgen - 16 jaar  |
      | persoon is als meerderjarige overleden                                  | gisteren - 21 jaar | morgen - 20 jaar  |

  
  Regel: Wanneer geboortedatum in onderzoek staat kan het gezag niet worden bepaald

    Abstract Scenario: gezag kan niet worden bepaald wanneer <omschrijving> in onderzoek staat

      Voorbeelden:
      | omschrijving   | aanduiding in onderzoek |
      | hele persoon   | 10000                   |
      | groep geboorte | 10300                   |
      | geboortedatum  | 10310                   |

    Abstract Scenario: gezag kan wel worden bepaald wanneer <omschrijving> in onderzoek staat

      Voorbeelden:
      | omschrijving | aanduiding in onderzoek |
      | naam         | 10200                   |
      | geboorteland | 10330                   |

    Scenario: gezag kan wel worden bepaald wanneer onderzoek naar de geboortedatum is beëindigd
