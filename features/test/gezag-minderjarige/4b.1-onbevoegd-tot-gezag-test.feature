#language: nl

Functionaliteit: Als API tester wil ik controleren dat regel "4b.1 - ouder, echtgenoot of partner overleden of onbevoegd tot gezag?" correct werkt


    Achtergrond:
      Gegeven de persoon 'Lydie' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Hans' met burgerservicenummer '000000024'
      * is meerderjarig
      En 'Lydie' en 'Hans' zijn met elkaar gehuwd met de volgende gegevens
      | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
      | 20010928                                                           |
      En de persoon 'Nancy' met burgerservicenummer '000000036'
      * is minderjarig
      * is in Nederland geboren
      * is ingeschreven in de BRP
      * heeft 'Lydie' als ouder 1


  Regel: Als de ouder minderjarig is en de partner van de ouder is meerderjarig, dan is sprake van voogdij

    Abstract Scenario: de ouder is minderjarig
      Gegeven persoon 'Lydie'
      * zijn de volgende gegevens gewijzigd
      | geboortedatum (03.10) |
      | <geboortedatum>       |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | Voogdij                   |
      | minderjarige.burgerservicenummer | 000000036                 |
      En heeft 'gezag' een 'derde' met de volgende gegevens
      | burgerservicenummer |
      | 000000024           |
 
      Voorbeelden:
      | geboortedatum      |
      | gisteren - 17 jaar |
      | morgen - 18 jaar   |

    Abstract Scenario: de ouder was minderjarig bij geboorte van de minderjarige en is inmiddels meerderjarig geworden
      Gegeven persoon 'Lydie'
      * zijn de volgende gegevens gewijzigd
      | geboortedatum (03.10) |
      | <geboortedatum>       |
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
      | geboortedatum      |
      | morgen - 19 jaar   |
      | gisteren - 18 jaar |
      | vandaag - 18 jaar  |


  Regel: Als de ouder meerderjarig is en de partner van de ouder is minderjarig, dan is sprake van eenhoofdig ouderlijk gezag

    Abstract Scenario: de partner van de ouder is minderjarig
      Gegeven persoon 'Hans'
      * zijn de volgende gegevens gewijzigd
      | geboortedatum (03.10) |
      | <geboortedatum>       |
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
      | geboortedatum      |
      | gisteren - 17 jaar |
      | morgen - 18 jaar   |

    Abstract Scenario: de partner van de ouder was minderjarig bij geboorte van de minderjarige en is inmiddels meerderjarig geworden
      Gegeven persoon 'Hans'
      * zijn de volgende gegevens gewijzigd
      | geboortedatum (03.10) |
      | <geboortedatum>       |
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
      | geboortedatum      |
      | morgen - 19 jaar   |
      | gisteren - 18 jaar |
      | vandaag - 18 jaar  |

    Scenario: de ouder is minderjarig
      Gegeven persoon 'Lydie'
      * zijn de volgende gegevens gewijzigd
      | geboortedatum (03.10) |
      | <geboortedatum>       |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | Voogdij                   |
      | minderjarige.burgerservicenummer | 000000036                 |
      En heeft 'gezag' een 'derde' met de volgende gegevens
      | burgerservicenummer |
      | 000000024           |


  Regel: Als zowel de ouder als de partner van de ouder minderjarig zijn, dan is er tijdelijk geen gezag

    Scenario: de partner van de ouder is minderjarig
      Gegeven persoon 'Lydie'
      * zijn de volgende gegevens gewijzigd
      | geboortedatum (03.10) |
      | gisteren - 17 jaar    |
      En persoon 'Hans'
      * zijn de volgende gegevens gewijzigd
      | geboortedatum (03.10) |
      | morgen - 18 jaar    |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde             |
      | type                             | TijdelijkGeenGezag |


  Regel: Als de ouder overleden is en de partner van de ouder is niet overleden, dan is sprake van voogdij
    
    Scenario: de ouder is overleden
      Gegeven persoon 'Lydie'
      * is overleden
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | Voogdij                   |
      | minderjarige.burgerservicenummer | 000000036                 |
      En heeft 'gezag' een 'derde' met de volgende gegevens
      | burgerservicenummer |
      | 000000024           |

    Scenario: het overlijden van de ouder is gecorrigeerd, omdat die ten onrechte geregistreerd was (de ouder is nog in leven)
      Gegeven persoon 'Lydie'
      * is overleden
      En het overlijden is gecorrigeerd
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


  Regel: Als de partner van de ouder is overleden en de ouder zelf is niet overleden, dan is sprake van eenhoofdig ouderlijk gezag

    Scenario: de partner van de ouder is overleden
      Gegeven persoon 'Hans'
      * is overleden
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

    Scenario: het overlijden van de partner van de ouder is gecorrigeerd, omdat die ten onrechte geregistreerd was (de partner is nog in leven)
      Gegeven persoon 'Hans'
      * is overleden
      En het overlijden is gecorrigeerd
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


  Regel: Als de ouder en de partner van de ouder beide zijn overleden, dan is er tijdelijk geen gezag

    Scenario: de ouder en de partner van de ouder zijn beide overleden
      Gegeven persoon 'Lydie'
      * is overleden
      En persoon 'Hans'
      * is overleden
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde             |
      | type                             | TijdelijkGeenGezag |


  Regel: Als de ouder onder curatele staat en de partner van de ouder staat niet onder curatele, dan is sprake van voogdij

    Scenario: de ouder staat onder curatele
      Gegeven 'Lydie' is onder curatele gesteld
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | Voogdij                   |
      | minderjarige.burgerservicenummer | 000000036                 |
      En heeft 'gezag' een 'derde' met de volgende gegevens
      | burgerservicenummer |
      | 000000024           |

    Scenario: de ouder stond onder curatele en de curatele is beëindigd
      # dit scenario is opgenomen om te controleren dat niet alleen wordt gekeken naar de aanwezigheid van een voorkomen in de tabel, maar echt de waarde van curatele wordt gebruikt
      # en om te controleren dat alleen in de actuele gegevens wordt gekeken en niet in historie
      Gegeven persoon 'Lydie'
      * is onder curatele gesteld
      En de curatele is beëindigd
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

    Scenario: de ouder had uitspraak gezag minderjarige (toen zij zelf nog minderjarig was)
      # dit scenario is opgenomen om te controleren dat niet alleen wordt gekeken naar de aanwezigheid van een voorkomen in de tabel, maar echt de waarde van curatele wordt gebruikt
      # uitspraak gezag minderjarige en vaststelling curatele in dezelfde categorie/tabel wordt opgeslagen
      Gegeven persoon 'Lydie'
      * in een gerechtelijke uitspraak is het gezag toegewezen aan 'ouder 1'
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


  Regel: Als de partner van de ouder onder curatele staat en de ouder staat niet onder curatele, dan is sprake van eenhoofdig ouderlijk gezag

    Scenario: de partner van de ouder staat onder curatele
      Gegeven 'Hans' is onder curatele gesteld
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


  Regel: Als de ouder en de partner van de ouder beide onder curatele staan, dan is er tijdelijk geen gezag

    Scenario: de ouder en de partner van de ouder staan beide onder curatele
      Gegeven 'Lydie' is onder curatele gesteld
      En 'Hans' is onder curatele gesteld
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde             |
      | type                             | TijdelijkGeenGezag |


  Regel: Wanneer de ouder en de partner van de ouder beide niet bevoegd tot gezag, dan is er tijdelijk geen gezag

    Abstract Scenario: de ouder en de partner van de ouder staan beide onder curatele
      Gegeven persoon 'Lydie'
      * <gebeurtenis voor de ouder>
      En persoon 'Hans'
      * <gebeurtenis voor de partner>
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde             |
      | type                             | TijdelijkGeenGezag |

      Voorbeelden:
      | gebeurtenis voor de ouder | gebeurtenis voor de partner |
      | is minderjarig            | is minderjarig              |
      | is minderjarig            | is overleden                |
      | is minderjarig            | is onder curatele gesteld   |
      | is overleden              | is minderjarig              |
      | is overleden              | is overleden                |
      | is overleden              | is onder curatele gesteld   |
      | is onder curatele gesteld | is minderjarig              |
      | is onder curatele gesteld | is overleden                |
      | is onder curatele gesteld | is onder curatele gesteld   |
      

  Regel: Wanneer de geboortedatum van de ouder of de partner van de ouder in onderzoek staat, is het gezag niet te bepalen

    Abstract Scenario: <omschrijving>
      Gegeven persoon '<aanduiding persoon>'
      * zijn de volgende gegevens gewijzigd
      | geboortedatum (03.10) | aanduiding in onderzoek (83.10) | datum ingang onderzoek (83.20) |
      | <geboortedatum>       | <aanduiding onderzoek>          | gisteren - 1 jaar              |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                                               |
      | type        | GezagNietTeBepalen                                                                                                                   |
      | toelichting | Gezag is niet te bepalen, omdat de volgende relevante gegevens in onderzoek staan. Persoonslijst van <persoonslijst>: <toelichting>. |
 
      Voorbeelden:
      | aanduiding persoon | geboortedatum      | aanduiding onderzoek | omschrijving                                                      | persoonslijst | toelichting               |
      | Lydie              | gisteren - 17 jaar | 010000               | categorie persoon in onderzoek van de minderjarige ouder          | ouder 1       | persoon                   |
      | Lydie              | morgen - 19 jaar   | 010000               | categorie persoon in onderzoek van de meerderjarige ouder         | ouder 1       | persoon                   |
      | Lydie              | morgen - 19 jaar   | 010300               | groep geboorte in onderzoek van de meerderjarige ouder            | ouder 1       | geboortedatum van persoon |
      | Lydie              | morgen - 19 jaar   | 010310               | geboortedatum in onderzoek van de meerderjarige ouder             | ouder 1       | geboortedatum van persoon |
      | Hans               | gisteren - 17 jaar | 010310               | geboortedatum in onderzoek van de minderjarige partner van ouder  | niet ouder    | geboortedatum van persoon |
      | Hans               | morgen - 19 jaar   | 010310               | geboortedatum in onderzoek van de meerderjarige partner van ouder | niet ouder    | geboortedatum van persoon |

    Abstract Scenario: het onderzoek naar de geboortedatum is beëindigd
      Gegeven persoon '<aanduiding persoon>'
      * zijn de volgende gegevens gewijzigd
      | geboortedatum (03.10) | aanduiding in onderzoek (83.10) | datum ingang onderzoek (83.20) | datum einde onderzoek (83.30) |
      | morgen - 25 jaar      | 010310                          | gisteren - 1 jaar              | gisteren                      |
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
      | aanduiding persoon |
      | Lydie              |
      | Hans               |


  Regel: Wanneer curatele in onderzoek staat, is het gezag niet te bepalen

    Abstract Scenario: <omschrijving>
      Gegeven persoon '<aanduiding persoon>'
      * is onder curatele gesteld
      * curatele staat in onderzoek met aanduiding '113310'
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                                               |
      | type        | GezagNietTeBepalen                                                                                                                   |
      | toelichting | Gezag is niet te bepalen, omdat de volgende relevante gegevens in onderzoek staan. Persoonslijst van <persoonslijst>: <toelichting>. |

      Voorbeelden:
      | aanduiding persoon | aanduiding onderzoek | persoonslijst | toelichting                 | omschrijving                                           |
      | Lydie              | 110000               | ouder 1       | indicatie curatele register | categorie gezagsverhouding in onderzoek van de ouder   |
      | Lydie              | 113300               | ouder 1       | indicatie curatele register | groep curatele in onderzoek van de ouder               |
      | Lydie              | 113310               | ouder 1       | indicatie curatele register | indicatie curateleregister in onderzoek van de ouder   |
      | Hans               | 113310               | niet ouder    | indicatie curatele register | indicatie curateleregister in onderzoek van de partner |

    Scenario: het onderzoek naar curatele is beëindigd
      Gegeven persoon 'Lydie'
      * is onder curatele gesteld
      * curatele onderzoek met aanduiding '113310' is beëindigd
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | Voogdij                   |
      | minderjarige.burgerservicenummer | 000000036                 |
      En heeft 'gezag' een 'derde' met de volgende gegevens
      | burgerservicenummer |
      | 000000024           |
