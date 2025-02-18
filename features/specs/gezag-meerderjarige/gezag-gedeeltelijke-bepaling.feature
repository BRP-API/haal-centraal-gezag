# language: nl
Functionaliteit: gedeeltelijke gezag bepaling
  
  Het kan voorkomen dat bij een gezagsbepaling gegevens van één van de ouders onvolledig of niet bekend is.
  In deze gevallen is het belangrijk dat nog steeds voor de andere ouder, waarvan wel alle benodigde gegevens beschikbaar zijn, 
  gezag kan worden bepaald. Dit zowel vanuit het perspectief van deze ouder als vanuit het perspectief van het kind.

  In deze gevallen kan de gezagsbepaling deels worden geleverd.

      Achtergrond:
        Gegeven de persoon 'Pieternella' met burgerservicenummer '000000012'
        * is ingeschreven in de BRP
        * is meerderjarig
        En de persoon 'Leenderd' met burgerservicenummer '000000024'
        * is ingeschreven in de BRP
        * is meerderjarig
        En de persoon 'Marcella' met burgerservicenummer '000000036'
        * is in Nederland geboren
        * is ingeschreven in de BRP
        * is pas geboren

  Regel: een meerderjarige die gezag heeft over een minderjarig samen met een ouder waarvan niet alle benodigde gegevens bekend zijn wordt gezag geleverd

    # huidige gezag niet te bepaling melding: gezag is niet te bepalen omdat de volgende relevante gegevens ontbreken: ouder2 van bevraagde persoon is niet in BRP geregistreerd
    Abstract Scenario: wanneer een ouder niet is ingeschreven in de BRP kan voor de andere ouder (ouder 1) alsnog gezag worden bepaald er is sprake van EenhoofdigOuderlijkGezag
      Gegeven de persoon 'Joris' met burgerservicenummer '000000048'
        * is meerderjarig
        * is niet ingeschreven in de BRP
      En persoon 'Marcella'
        * heeft 'Pieternella' als ouder 1
        * is erkend door 'Joris' als ouder 2 met erkenning bij geboorteaangifte
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                                                                                                                           |
        | type                             | EenhoofdigOuderlijkGezag                                                                                                         |
        | minderjarige.burgerservicenummer | 000000036                                                                                                                        |      
        | ouder.burgerservicenummer        | 000000012                                                                                                                        |
        | toelichting                      | Gezag is niet volledig te bepalen omdat de gegevens van een ouder niet worden bijgehouden. Mogelijk heeft deze ouder ook gezag.  |

      Voorbeelden:
      | burgerservicenummer  |
      | 000000012            |
      | 000000036            |

    # huidige gezag niet te bepaling melding:  gezag is niet te bepalen omdat de volgende relevante gegevens ontbreken: ouder1 van bevraagde persoon is niet in BRP geregistreerd
    Abstract Scenario: wanneer een ouder niet is ingeschreven in de BRP kan voor de andere ouder (ouder 2) alsnog gezag worden bepaald er is sprake van EenhoofdigOuderlijkGezag
      Gegeven de persoon 'Jorike' met burgerservicenummer '000000064'
        * is meerderjarig
        * is niet ingeschreven in de BRP
      En persoon 'Marcella'
        * heeft 'Jorike' als ouder 1 met erkenning bij geboorteaangifte
        * heeft 'Leenderd' als ouder 2
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                                                                                                                           |
        | type                             | EenhoofdigOuderlijkGezag                                                                                                         |
        | minderjarige.burgerservicenummer | 000000036                                                                                                                        |      
        | ouder.burgerservicenummer        | 000000024                                                                                                                        |
        | toelichting                      | Gezag is niet volledig te bepalen omdat de gegevens van een ouder niet worden bijgehouden. Mogelijk heeft deze ouder ook gezag.  |

      Voorbeelden:
      | burgerservicenummer  |
      | 000000024            |
      | 000000036            |
 
    # huidige gezag niet te bepaling melding: Voor de bevraagde persoon moet niet_ouder geregistreerd staan in BRP
    Abstract Scenario: wanneer een ouder (niet ouder) niet is ingeschreven in de BRP kan voor de andere ouder (ouder 1) alsnog gezag worden bepaald er is sprake van EenhoofdigOuderlijkGezag
      Gegeven de persoon 'Boris' met burgerservicenummer '000000096'
        * is meerderjarig
        * is niet ingeschreven in de BRP
      En persoon 'Marcella'
        * heeft 'Pieternella' als ouder 1 
      En 'Pieternella' en 'Boris' zijn gehuwd
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                                                                                                                           |
        | type                             | EenhoofdigOuderlijkGezag                                                                                                         |
        | minderjarige.burgerservicenummer | 000000036                                                                                                                        |      
        | ouder.burgerservicenummer        | 000000012                                                                                                                        |
        | toelichting                      | Gezag is niet volledig te bepalen omdat de gegevens van een ouder niet worden bijgehouden. Mogelijk heeft deze ouder ook gezag.  |

      Voorbeelden:
      | burgerservicenummer  |
      | 000000012            |
      | 000000036            |

    # huidige gezag niet te bepaling melding: gezag is niet te bepalen omdat één of meer ouders van minderjarige onbekend is.
    Abstract Scenario: wanneer een ouder (ouder 1) onbekend is (puntouder) kan alsnog gezag worden bepaald er is sprake van EenhoofdigOuderlijkGezag
      Gegeven de persoon '.' met burgerservicenummer '000000086'
      En persoon 'Marcella'
        * heeft '.' als ouder 1
        * heeft 'Leenderd' als ouder 2
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                                                                                                                           |
        | type                             | EenhoofdigOuderlijkGezag                                                                                                         |
        | minderjarige.burgerservicenummer | 000000036                                                                                                                        |      
        | ouder.burgerservicenummer        | 000000024                                                                                                                        |
        | toelichting                      | Gezag is niet volledig te bepalen omdat de gegevens van een ouder niet worden bijgehouden. Mogelijk heeft deze ouder ook gezag.  |

      Voorbeelden:
      | burgerservicenummer  |
      | 000000024            |
      | 000000036            |
 
    # huidige gezag niet te bepaling melding: gezag is niet te bepalen omdat één of meer ouders van minderjarige onbekend is.
    Abstract Scenario: wanneer een ouder (ouder 2) onbekend is (puntouder) kan alsnog gezag worden bepaald er is sprake van EenhoofdigOuderlijkGezag
      Gegeven de persoon '.' met burgerservicenummer '000000086'
      En persoon 'Marcella'
        * heeft 'Pieternella' als ouder 1
        * heeft '.' als ouder 2
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                                                                                                                           |
        | type                             | EenhoofdigOuderlijkGezag                                                                                                         |
        | minderjarige.burgerservicenummer | 000000036                                                                                                                        |      
        | ouder.burgerservicenummer        | 000000012                                                                                                                        |
        | toelichting                      | Gezag is niet volledig te bepalen omdat de gegevens van een ouder niet worden bijgehouden. Mogelijk heeft deze ouder ook gezag.  |

      Voorbeelden:
      | burgerservicenummer  |
      | 000000012            |
      | 000000036            |

    # huidige gezag niet te bepaling melding: gezag is niet te bepalen omdat bij het bepalen van huwelijk/partnerschap van de ouder(s) relevante gegevens ontbreken. Het gaat om de volgende gegevens: ouder2 van bevraagde persoon is niet in BRP geregistreerd 
    Abstract Scenario: wanneer bij gehuwde ouders een ouder niet is ingeschreven in de BRP kan voor de andere ouder (ouder 1) alsnog gezag worden bepaald er is sprake van EenhoofdigOuderlijkGezag
      Gegeven de persoon 'Joris' met burgerservicenummer '000000048'
        * is meerderjarig
        * is niet ingeschreven in de BRP
      En persoon 'Marcella'
        * heeft 'Pieternella' als ouder 1
        * is erkend door 'Joris' als ouder 2 met erkenning bij geboorteaangifte
      En 'Pieternella' en 'Joris' zijn gehuwd
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                                                                                                                           |
        | type                             | EenhoofdigOuderlijkGezag                                                                                                         |
        | minderjarige.burgerservicenummer | 000000036                                                                                                                        |      
        | ouder.burgerservicenummer        | 000000012                                                                                                                        |
        | toelichting                      | Gezag is niet volledig te bepalen omdat de gegevens van een ouder niet worden bijgehouden. Mogelijk heeft deze ouder ook gezag.  |

      Voorbeelden:
      | burgerservicenummer  |
      | 000000012            |
      | 000000036            |

    # huidige gezag niet te bepaling melding: gezag is niet te bepalen omdat bij het bepalen van huwelijk/partnerschap van de ouder(s) relevante gegevens ontbreken. Het gaat om de volgende gegevens: ouder1 van bevraagde persoon is niet in BRP geregistreerd 
    Abstract Scenario: wanneer bij gehuwde ouders een ouder niet is ingeschreven in de BRP kan voor de andere ouder (ouder 2) alsnog gezag worden bepaald er is sprake van EenhoofdigOuderlijkGezag
      Gegeven de persoon 'Jorike' met burgerservicenummer '000000064'
        * is meerderjarig
        * is niet ingeschreven in de BRP
      En persoon 'Marcella'
        * heeft 'Jorike' als ouder 1 met erkenning bij geboorteaangifte
        * heeft 'Leenderd' als ouder 2
      En 'Jorike' en 'Leenderd' zijn gehuwd
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                                                                                                                           |
        | type                             | EenhoofdigOuderlijkGezag                                                                                                         |
        | minderjarige.burgerservicenummer | 000000036                                                                                                                        |      
        | ouder.burgerservicenummer        | 000000024                                                                                                                        |
        | toelichting                      | Gezag is niet volledig te bepalen omdat de gegevens van een ouder niet worden bijgehouden. Mogelijk heeft deze ouder ook gezag.  |

      Voorbeelden:
      | burgerservicenummer  |
      | 000000024            |
      | 000000036            |

    # huidige gezag niet te bepaling melding: missende gegeven van ouder 1 en Ouder moet een BSN hebben
    Abstract Scenario: wanneer een ouder het gegeven <omschrijving> mist kan voor de andere ouder (ouder 2) alsnog gezag worden bepaald er is sprake van EenhoofdigOuderlijkGezag
      Gegeven persoon 'Marcella'
        * heeft 'Jorike' als ouder 1
        * heeft 'Leenderd' als ouder 2
        * zijn van ouder 1 de volgende gegevens gewijzigd
        | <veldnaam> |
        |            |
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                                                                                                                                                  |
        | type                             | EenhoofdigOuderlijkGezag                                                                                                                                |
        | minderjarige.burgerservicenummer | 000000036                                                                                                                                               |
        | ouder.burgerservicenummer        | 000000024                                                                                                                                               |
        | toelichting                      | Gezag is niet volledig te bepalen omdat de gegevens van een ouder missen. Het gaat om <omschrijving> van ouder 1. Mogelijk heeft deze ouder ook gezag.  |

      Voorbeelden:
      | burgerservicenummer  | omschrijving                                   | veldnaam                                            |
      | 000000024            | burgerservicenummer                            | burgerservicenummer (01.20)                         |
      | 000000024            | geslachtsnaam                                  | geslachtsnaam (02.40)                               |
      | 000000024            | datum ingang familierechtelijke betrekking     | datum ingang familierechtelijke betrekking (62.10)  |
      | 000000036            | burgerservicenummer                            | burgerservicenummer (01.20)                         |
      | 000000036            | geslachtsnaam                                  | geslachtsnaam (02.40)                               |
      | 000000036            | datum ingang familierechtelijke betrekking     | datum ingang familierechtelijke betrekking (62.10)  |

    # huidige gezag niet te bepaling melding: missende gegeven van ouder 2 en Ouder moet een BSN hebben
    Abstract Scenario: wanneer een ouder het gegeven <omschrijving> mist kan voor de andere ouder (ouder 1) alsnog gezag worden bepaald er is sprake van EenhoofdigOuderlijkGezag
      Gegeven persoon 'Marcella'
        * heeft 'Jorike' als ouder 1
        * heeft 'Leenderd' als ouder 2
        * zijn van ouder 2 de volgende gegevens gewijzigd
        | <veldnaam> |
        |            |
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                                                                                                                                                  |
        | type                             | EenhoofdigOuderlijkGezag                                                                                                                                |
        | minderjarige.burgerservicenummer | 000000036                                                                                                                                               |
        | ouder.burgerservicenummer        | 000000012                                                                                                                                               |
        | toelichting                      | Gezag is niet volledig te bepalen omdat de gegevens van een ouder missen. Het gaat om <omschrijving> van ouder 1. Mogelijk heeft deze ouder ook gezag.  |

      Voorbeelden:
      | burgerservicenummer  | omschrijving                                   | veldnaam                                            |
      | 000000012            | burgerservicenummer                            | burgerservicenummer (01.20)                         |
      | 000000012            | geslachtsnaam                                  | geslachtsnaam (02.40)                               |
      | 000000012            | datum ingang familierechtelijke betrekking     | datum ingang familierechtelijke betrekking (62.10)  |
      | 000000036            | burgerservicenummer                            | burgerservicenummer (01.20)                         |
      | 000000036            | geslachtsnaam                                  | geslachtsnaam (02.40)                               |
      | 000000036            | datum ingang familierechtelijke betrekking     | datum ingang familierechtelijke betrekking (62.10)  |

    # huidige gezag niet te bepaling melding: missende gegeven van huwelijk of partnerschap
    Abstract Scenario: wanneer bij het gegeven huwelijk of partnerschap van een ouder <omschrijving> mist kan voor de ouder alsnog gezag worden bepaald maar niet voor de partner er is sprake van EenhoofdigOuderlijkGezag
      Gegeven persoon 'Marcella'
        * heeft 'Jorike' als ouder 1
        * heeft 'Leenderd' als ouder 2
      En 'Jorike' en 'Leenderd' zijn met elkaar gehuwd
      En is het huwelijk van 'Jorike' en 'Leenderd' gecorrigeerd met de volgende gegevens
        | <veldnaam> |
        |            |
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                                                                                                                                                  |
        | type                             | EenhoofdigOuderlijkGezag                                                                                                                                |
        | minderjarige.burgerservicenummer | 000000036                                                                                                                                               |
        | ouder.burgerservicenummer        | <burgerservicenummer>                                                                                                                                               |
        | toelichting                      | Gezag is niet volledig te bepalen omdat de gegevens van een ouder missen. Het gaat om <omschrijving> van huwelijk en partnerschap. Mogelijk heeft deze ouder ook gezag.  |

      Voorbeelden:
      | burgerservicenummer  | omschrijving                                                | veldnaam                                                            |
      | 000000012            | datum huwelijkssluiting/aangaan geregistreerd partnerschap  | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10)  |
      | 000000012            | burgerservicenummer partner van relatie                     | burgerservicenummer (01.20)                                         |
      | 000000024            | datum huwelijkssluiting/aangaan geregistreerd partnerschap  | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10)  |
      | 000000024            | burgerservicenummer partner van relatie                     | burgerservicenummer (01.20)                                         |

    # huidige gezag niet te bepaling melding: op persoonslijst ouder: burgerservicenummer / geboortedatum
    Abstract Scenario: wanneer van een ouder <omschrijving> op de persoonslijst van de ouder mist kan voor de andere ouder alsnog gezag worden bepaald er is sprake van EenhoofdigOuderlijkGezag
      Gegeven persoon 'Marcella'
        * heeft 'Jorike' als ouder 1
        * heeft 'Leenderd' als ouder 2
      En 'Jorike' en 'Leenderd' zijn met elkaar gehuwd
      Gegeven persoon '<persoon>'
        * zijn de volgende gegevens gewijzigd
        | <veldnaam> |
        |            |
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde                                                                                                                                                        |
        | type                             | EenhoofdigOuderlijkGezag                                                                                                                                      |
        | minderjarige.burgerservicenummer | 000000036                                                                                                                                                     |
        | ouder.burgerservicenummer        | <burgerservicenummer>                                                                                                                                         |
        | toelichting                      | Gezag is niet volledig te bepalen omdat de gegevens van een ouder missen. Het gaat om <omschrijving> van ouder <ouder>. Mogelijk heeft deze ouder ook gezag.  |

      Voorbeelden:
      | persoon     | burgerservicenummer  | ouder  | omschrijving           | veldnaam                     |
      | Jorike      | 000000024            | 1      | burgerservicenummer    | burgerservicenummer (01.20)  |
      | Jorike      | 000000024            | 1      | geboortedatum          | geboortedatum (03.10)        |
      | Jorike      | 000000036            | 1      | burgerservicenummer    | burgerservicenummer (01.20)  |
      | Jorike      | 000000036            | 1      | geboortedatum          | geboortedatum (03.10)        |
      | Leenderd    | 000000012            | 2      | burgerservicenummer    | burgerservicenummer (01.20)  |
      | Leenderd    | 000000012            | 2      | geboortedatum          | geboortedatum (03.10)        |
      | Leenderd    | 000000036            | 2      | burgerservicenummer    | burgerservicenummer (01.20)  |
      | Leenderd    | 000000036            | 2      | geboortedatum          | geboortedatum (03.10)        |