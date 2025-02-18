#language: nl

Functionaliteit: in verschillende situaties heeft een niet ouder (ook) het gezag over een minderjarige

  Een `niet ouder` is iemand die gezag heeft over een minderjarige maar niet de ouder is.
  Dat wil zeggen, de persoon is:
  - niet de moeder uit wie het kind geboren is
  - niet iemand die het kind erkend heeft
  - niet iemand die het kind geadopteerd heeft
  Een `niet ouder` kan een vader zijn, maar ook een oma, opa, peetoom of andere relatie.

  De gezag relatie voor een `niet ouder` met een minderjarige onstaat vanuit rechtswege of vanuit een gerechtelijke uitspraak.

  Bij rechtswege ontstaat de gezagsrelatie wanneer de `niet ouder` gehuwd is met de ouder van de minderjarige.

  Bij een gerechtelijk uitspraak kan worden gesteld dat de ouder het gezag gezamelijk met een `niet ouder` (derde) het gezag uitoefend.
  Ook kan een gerechtelijke uitspraak gedaan worden die stelt dat 1 of meerdere `niet ouder(s)` (derden) het gezag uitoefenen.

  Achtergrond:
    Gegeven de persoon 'Annabel' met burgerservicenummer '000000012'
    * is meerderjarig, niet overleden en staat niet onder curatele
    En de persoon 'Rupert' met burgerservicenummer '000000024'
    * is meerderjarig, niet overleden en staat niet onder curatele
    En de persoon 'Yves' met burgerservicenummer '000000036'
    * is minderjarig
    * is in Nederland geboren
    * is ingeschreven in de BRP

  Regel: de niet ouder heeft vanuit rechtswege gezag over de minderjarige

    Abstract Scenario: gezamelijk gezag van rechtswege door huwelijk met de ouder er is sprake van GezamelijkGezag
      Gegeven persoon 'Yves'
      * heeft 'Annabel' als ouder 1
      En 'Annabel' en 'Rupert' zijn met elkaar gehuwd
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde               |
        | type                             | GezamenlijkGezag     |
        | minderjarige.burgerservicenummer | 000000036            |
        | derde.type                       | BekendeDerde         |
        | derde.burgerservicenummer        | 000000024            |
        | ouder.burgerservicenummer        | 000000012            |

      Voorbeelden:
      | burgerservicenummer |
      | 000000036           |
      | 000000024           |
      | 000000012           |

    Abstract Scenario: gezamelijk gezag van rechtswege door huwelijk met de ouder vervolgens ouder overleder er is sprake van Voogdij
      Gegeven persoon 'Yves'
      * heeft 'Annabel' als ouder 1
      En 'Annabel' en 'Rupert' zijn met elkaar gehuwd
      En 'Annabel' is overleden
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde               |
        | type                             | Voogdij              |
        | minderjarige.burgerservicenummer | 000000036            |
      En heeft 'gezag' een 'derde' met de volgende gegevens
        | naam                | waarde       |
        | type                | BekendeDerde |
        | burgerservicenummer | 000000024    |

      Voorbeelden:
      | burgerservicenummer |
      | 000000036           |
      | 000000024           |

  Regel: niet ouder heeft gezag vanwege een gerechtelijke uitspraak

    Abstract Scenario: gerechtelijke uitspraak 1D het is niet bekend wie de niet ouder (derde) is er is sprake van GezamelijkGezag
      Gegeven persoon 'Yves'
      * heeft 'Annabel' als ouder 1
      Gegeven voor 'Yves' is een gerechtelijke uitspraak over het gezag gedaan met de volgende gegevens
      | indicatie gezag minderjarige (32.10) | ingangsdatum geldigheid (85.10) |
      | 1D                                   | 20230101                        |
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde               |
        | type                             | GezamenlijkGezag     |
        | minderjarige.burgerservicenummer | 000000036            |
        | derde.type                       | OnbekendeDerde       |
        | ouder.burgerservicenummer        | 000000012            |

      Voorbeelden:
      | burgerservicenummer |
      | 000000036           |
      | 000000012           |

    Abstract Scenario: gerechtelijke uitspraak 2D het is niet bekend wie de niet ouder (derde) is er is sprake van GezamelijkGezag
      Gegeven persoon 'Yves'
      * heeft 'Annabel' als ouder 2
      Gegeven voor 'Yves' is een gerechtelijke uitspraak over het gezag gedaan met de volgende gegevens
      | indicatie gezag minderjarige (32.10) | ingangsdatum geldigheid (85.10) |
      | 2D                                   | 20230101                        |
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde               |
        | type                             | GezamenlijkGezag     |
        | minderjarige.burgerservicenummer | 000000036            |
        | derde.type                       | OnbekendeDerde       |
        | ouder.burgerservicenummer        | 000000012            |

      Voorbeelden:
      | burgerservicenummer |
      | 000000036           |
      | 000000012           |

    Scenario: gerechtelijke uitspraak 1D het is niet bekend wie de niet ouder (derde) is en de ouder is overleden is er is sprake van Voogdij
      Gegeven persoon 'Yves'
      * heeft 'Annabel' als ouder 1
      Gegeven voor 'Yves' is een gerechtelijke uitspraak over het gezag gedaan met de volgende gegevens
      | indicatie gezag minderjarige (32.10) | ingangsdatum geldigheid (85.10) |
      | 1D                                   | 20230101                        |
      Gegeven persoon 'Annabel'
      * is overleden
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde    |
        | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde               |
        | type                             | Voogdij              |
        | minderjarige.burgerservicenummer | 000000036            |
      En heeft 'gezag' geen derden

    Scenario: gerechtelijke uitspraak D het is niet bekend wie de niet ouder(s) (derden) is er is sprake van Voogdij
      Gegeven persoon 'Yves'
      * heeft 'Annabel' als ouder 1
      Gegeven voor 'Yves' is een gerechtelijke uitspraak over het gezag gedaan met de volgende gegevens
      | indicatie gezag minderjarige (32.10) | ingangsdatum geldigheid (85.10) |
      | D                                    | 20230101                        |
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde    |
        | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde               |
        | type                             | Voogdij              |
        | minderjarige.burgerservicenummer | 000000036            |
      En heeft 'gezag' geen derden

    Abstract Scenario: gezamelijk gezag van rechtswege gevolgd door gerechtelijke uitspraak er is niet bekend wie de niet ouder (derde) is er is sprake van GezamelijkGezag
      Gegeven persoon 'Yves'
      * heeft 'Annabel' als ouder 1
      En 'Annabel' en 'Rupert' zijn met elkaar gehuwd
      Gegeven voor 'Yves' is een gerechtelijke uitspraak over het gezag gedaan met de volgende gegevens
      | indicatie gezag minderjarige (32.10) | ingangsdatum geldigheid (85.10) |
      | 1D                                   | vandaag - 1 jaar                |
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde               |
        | type                             | GezamenlijkGezag     |
        | minderjarige.burgerservicenummer | 000000036            |
        | derde.type                       | OnbekendeDerde       |
        | ouder.burgerservicenummer        | 000000012            |

      Voorbeelden:
      | burgerservicenummer |
      | 000000036           |
      | 000000012           |

    Abstract Scenario: gehuwd bij geboorte van rechtswege gezag gevolgd door een gerechtelijke uitspraak 1D er is niet bekend wie de niet ouder (derde) is er is sprake van GezamelijkGezag
      Gegeven persoon 'Yves'
      * heeft 'Annabel' als ouder 1
      En 'Annabel' en 'Rupert' zijn met elkaar gehuwd met de volgende gegevens
        | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
        | vandaag - 18 jaar                                                  |
      Gegeven voor 'Yves' is een gerechtelijke uitspraak over het gezag gedaan met de volgende gegevens
        | indicatie gezag minderjarige (32.10) | ingangsdatum geldigheid (85.10) |
        | 1D                                   | 20230101                        |
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde                |
        | burgerservicenummer | <burgerservicenummer> |
      En heeft de persoon een 'gezag' met de volgende gegevens
        | naam                             | waarde               |
        | type                             | GezamenlijkGezag     |
        | minderjarige.burgerservicenummer | 000000036            |
        | derde.type                       | OnbekendeDerde       |
        | ouder.burgerservicenummer        | 000000012            |

      Voorbeelden:
      | burgerservicenummer |
      | 000000036           |
      | 000000012           |