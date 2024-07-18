#language: nl

Functionaliteit: Als gebruiker wil ik het gezag van meerdere personen in één request kunnen vragen


    Achtergrond:
      Gegeven adres 'A1' heeft de volgende gegevens
      | gemeentecode (92.10) | straatnaam (11.10) | huisnummer (11.20) |
      | 518                  | Turfmarkt          | 1                  |

      # Moeder
      Gegeven de persoon met burgerservicenummer '000000012' heeft de volgende gegevens
      | naam                            | waarde    |
      | burgerservicenummer (01.20)     | 000000012 |
      | voornamen (02.10)               | Annet     |
      | geslachtsnaam (02.40)           | Adema     |
      | geboortedatum (03.10)           | 19820101  |
      | geboorteland (03.30)            | 6030      |
      | geslachtsaanduiding (04.10)     | V         |
      | beschrijving document (82.30)   | PKA       |
      | ingangsdatum geldigheid (85.10) | 0         |
      En de persoon heeft een ouder '1' met de volgende gegevens
      | naam                                               | waarde   |
      | voornamen (02.10)                                  | Bea      |
      | geslachtsnaam (02.40)                              | Brouwer  |
      | geboortedatum (03.10)                              | 19600101 |
      | geboorteland (03.30)                               | 6030     |
      | geslachtsaanduiding (04.10)                        | V        |
      | beschrijving document (82.30)                      | PK       |
      | ingangsdatum geldigheid (85.10)                    | 0        |
      | datum ingang familierechtelijke betrekking (62.10) | 0        |
      En de persoon heeft een ouder '2' met de volgende gegevens
      | naam                                               | waarde     |
      | voornamen (02.10)                                  | Christiaan |
      | geslachtsnaam (02.40)                              | Adema      |
      | geboortedatum (03.10)                              | 19600101   |
      | geboorteland (03.30)                               | 6030       |
      | geslachtsaanduiding (04.10)                        | M          |
      | beschrijving document (82.30)                      | PK         |
      | ingangsdatum geldigheid (85.10)                    | 0          |
      | datum ingang familierechtelijke betrekking (62.10) | 0          |
      En de persoon is ingeschreven op adres 'A1' met de volgende gegevens
      | naam                              | waarde   |
      | gemeente van inschrijving (09.10) | 518      |
      | ingangsdatum geldigheid (85.10)   | 20111101 |
      En de persoon heeft een 'partner' met de volgende gegevens
      | naam                                                                | waarde    |
      | burgerservicenummer (01.20)                                         | 000000024 |
      | voornamen (02.10)                                                   | Adam      |
      | geslachtsnaam (02.40)                                               | Arendsen  |
      | geboortedatum (03.10)                                               | 19810101  |
      | geboorteland (03.30)                                                | 6030      |
      | geslachtsaanduiding (04.10)                                         | M         |
      | aktenummer (81.20)                                                  | 3AA0001   |
      | ingangsdatum geldigheid (85.10)                                     | 20141201  |
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10)  | 20141201  |
      | plaats huwelijkssluiting/aangaan geregistreerd partnerschap (06.20) | 0518      |
      | land huwelijkssluiting/aangaan geregistreerd partnerschap (06.30)   | 6030      |
      En de persoon heeft (nog) een 'kind' met de volgende gegevens
      | naam                            | waarde    |
      | burgerservicenummer (01.20)     | 000000036 |
      | voornamen (02.10)               | Axel      |
      | geslachtsnaam (02.40)           | Arendsen  |
      | geboortedatum (03.10)           | 20151201  |
      | geboorteland (03.30)            | 6030      |
      | aktenummer (81.20)              | 1AA0001   |
      | ingangsdatum geldigheid (85.10) | 20151201  |

      # Vader
      Gegeven de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
      | naam                            | waarde    |
      | burgerservicenummer (01.20)     | 000000024 |
      | voornamen (02.10)               | Adam      |
      | geslachtsnaam (02.40)           | Arendsen  |
      | geboortedatum (03.10)           | 19810101  |
      | geboorteland (03.30)            | 6030      |
      | geslachtsaanduiding (04.10)     | M         |
      | beschrijving document (82.30)   | PKA       |
      | ingangsdatum geldigheid (85.10) | 0         |
      En de persoon heeft een ouder '1' met de volgende gegevens
      | naam                                               | waarde    |
      | voornamen (02.10)                                  | Berendien |
      | voorvoegsel (02.30)                                | de        |
      | geslachtsnaam (02.40)                              | Boer      |
      | geboortedatum (03.10)                              | 19590101  |
      | geboorteland (03.30)                               | 6030      |
      | geslachtsaanduiding (04.10)                        | V         |
      | beschrijving document (82.30)                      | PK        |
      | ingangsdatum geldigheid (85.10)                    | 0         |
      | datum ingang familierechtelijke betrekking (62.10) | 0         |
      En de persoon heeft een ouder '2' met de volgende gegevens
      | naam                                               | waarde   |
      | voornamen (02.10)                                  | Carel    |
      | geslachtsnaam (02.40)                              | Arendsen |
      | geboortedatum (03.10)                              | 19590101 |
      | geboorteland (03.30)                               | 6030     |
      | geslachtsaanduiding (04.10)                        | M        |
      | beschrijving document (82.30)                      | PK       |
      | ingangsdatum geldigheid (85.10)                    | 0        |
      | datum ingang familierechtelijke betrekking (62.10) | 0        |
      En de persoon is ingeschreven op adres 'A1' met de volgende gegevens
      | naam                              | waarde   |
      | gemeente van inschrijving (09.10) | 518      |
      | ingangsdatum geldigheid (85.10)   | 20111101 |
      En de persoon heeft een 'partner' met de volgende gegevens
      | naam                                                                | waarde    |
      | burgerservicenummer (01.20)                                         | 000000012 |
      | voornamen (02.10)                                                   | Annet     |
      | geslachtsnaam (02.40)                                               | Adema     |
      | geboortedatum (03.10)                                               | 19820101  |
      | geboorteland (03.30)                                                | 6030      |
      | geslachtsaanduiding (04.10)                                         | V         |
      | aktenummer (81.20)                                                  | 3AA0001   |
      | ingangsdatum geldigheid (85.10)                                     | 20141201  |
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10)  | 20141201  |
      | plaats huwelijkssluiting/aangaan geregistreerd partnerschap (06.20) | 0518      |
      | land huwelijkssluiting/aangaan geregistreerd partnerschap (06.30)   | 6030      |
      En de persoon heeft (nog) een 'kind' met de volgende gegevens
      | naam                            | waarde    |
      | burgerservicenummer (01.20)     | 000000036 |
      | voornamen (02.10)               | Axel      |
      | geslachtsnaam (02.40)           | Arendsen  |
      | geboortedatum (03.10)           | 20151201  |
      | geboorteland (03.30)            | 6030      |
      | aktenummer (81.20)              | 1AA0001   |
      | ingangsdatum geldigheid (85.10) | 20151201  |

      # Kind
      Gegeven de persoon met burgerservicenummer '000000036' heeft de volgende gegevens
      | naam                            | waarde    |
      | burgerservicenummer (01.20)     | 000000036 |
      | voornamen (02.10)               | Axel      |
      | geslachtsnaam (02.40)           | Arendsen  |
      | geboortedatum (03.10)           | 20151201  |
      | geboorteland (03.30)            | 6030      |
      | geslachtsaanduiding (04.10)     | M         |
      | aktenummer (81.20)              | 1AA0001   |
      | ingangsdatum geldigheid (85.10) | 20151201  |
      En de persoon heeft een ouder '1' met de volgende gegevens
      | naam                                               | waarde    |
      | burgerservicenummer (01.20)                        | 000000012 |
      | voornamen (02.10)                                  | Annet     |
      | geslachtsnaam (02.40)                              | Adema     |
      | geboortedatum (03.10)                              | 19820101  |
      | geboorteland (03.30)                               | 6030      |
      | geslachtsaanduiding (04.10)                        | V         |
      | aktenummer (81.20)                                 | 1AA0001   |
      | ingangsdatum geldigheid (85.10)                    | 20151201  |
      | datum ingang familierechtelijke betrekking (62.10) | 20151201  |
      En de persoon heeft een ouder '2' met de volgende gegevens
      | naam                                               | waarde    |
      | burgerservicenummer (01.20)                        | 000000024 |
      | voornamen (02.10)                                  | Adam      |
      | geslachtsnaam (02.40)                              | Arendsen  |
      | geboortedatum (03.10)                              | 19810101  |
      | geboorteland (03.30)                               | 6030      |
      | geslachtsaanduiding (04.10)                        | M         |
      | aktenummer (81.20)                                 | 1AA0001   |
      | ingangsdatum geldigheid (85.10)                    | 20151201  |
      | datum ingang familierechtelijke betrekking (62.10) | 20151201  |
      En de persoon is ingeschreven op adres 'A1' met de volgende gegevens
      | naam                              | waarde   |
      | gemeente van inschrijving (09.10) | 518      |
      | ingangsdatum geldigheid (85.10)   | 20151201 |
      | datum van opneming (86.10)        | 20151201 |
      
      
    Scenario: vraag gezag van minderjarige kind  
      Als gezag wordt gezocht met de volgende parameters
      | naam | waarde    |
      | bsns | 000000036 |
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

    Scenario: vraag gezag van meerderjarige ouder
      Als gezag wordt gezocht met de volgende parameters
      | naam | waarde    |
      | bsns | 000000012 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
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

    Scenario: vraag gezag van ouder en kind
      Als gezag wordt gezocht met de volgende parameters
      | naam | waarde              |
      | bsns | 000000036,000000012 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
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
      En heeft de response een persoon met de volgende gegevens
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

    Scenario: vraag gezag van hele gezin
      Als gezag wordt gezocht met de volgende parameters
      | naam | waarde                        |
      | bsns | 000000012,000000024,000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000012 |
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
      En heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000024 |
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
      En heeft de response een persoon met de volgende gegevens
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
