#language: nl

Functionaliteit: Gezag niet te bepalen wanneer gegeven in onderzoek dat gebruikt wordt bij gezagbepaling vraag 1.3

    Achtergrond:
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig

  Regel: Gezag is niet te bepalen bij geboorteland in onderzoek

    Abstract Scenario: <omschrijving> van minderjarige staat in onderzoek
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * er loopt onderzoek naar de persoon gegevens met aanduiding '<aanduiding>'
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | GezagNietTeBepalen |
      #| minderjarige.burgerservicenummer | 000000036                 |
      | toelichting | Gezag is niet te bepalen, omdat de volgende relevante gegevens in onderzoek staan. <toelichting>.|

      Voorbeelden:
      | aanduiding | omschrijving      | toelichting                                                                    |
      | 010330     | geboorteland      | Persoonslijst van persoon: geboorteland van persoon                            |
      | 010300     | groep geboorte    | Persoonslijst van persoon: geboortedatum van persoon, geboorteland van persoon |
      | 010000     | categorie persoon | Persoonslijst van persoon: persoon                                             |

  Regel: Gezag is wel te bepalen bij immigratie in onderzoek

    Abstract Scenario: <omschrijving> van minderjarige staat in onderzoek
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * er loopt onderzoek naar de verblijfplaats gegevens met aanduiding '<aanduiding>'
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd
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
      | aanduiding | omschrijving                 |
      | 081410     | land vanwaar ingeschreven    |
      | 081420     | datum vestiging in Nederland |
      | 081400     | groep immigratie             |
      | 080000     | categorie verblijfplaats     |

    Abstract Scenario: minderjarige is geëmigreerd geweest en <omschrijving> staat in onderzoek
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * is geëmigreerd geweest
      * er loopt onderzoek naar de verblijfplaats gegevens met aanduiding '<aanduiding>'
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                        |
      | type        | GezagNietTeBepalen                                                            |
      #| minderjarige.burgerservicenummer | 000000036                 |
      | toelichting | gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven. |

      Voorbeelden:
      | aanduiding | omschrijving                 |
      | 081410     | land vanwaar ingeschreven    |
      | 081420     | datum vestiging in Nederland |
      | 081400     | groep immigratie             |
      | 080000     | categorie verblijfplaats     |


  Regel: Het in onderzoek staan van gegevens wordt niet gemeld als er om andere reden geen gezag kan worden bepaald
    # Deze regel is nu niet geïmplementeerd. Het scenario faalt.
    # De gezag api past nu regel "Gezag is niet te bepalen bij geboorteland in onderzoek" toe

    Abstract Scenario: minderjarige is geëmigreerd geweest en <omschrijving> staat in onderzoek
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * is geëmigreerd geweest
      * er loopt onderzoek naar de persoon gegevens met aanduiding '<aanduiding>'
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                        |
      | type        | GezagNietTeBepalen                                                            |
      #| minderjarige.burgerservicenummer | 000000036                 |
      | toelichting | gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven. |

      Voorbeelden:
      | aanduiding | omschrijving      | toelichting                                                                    |
      | 010310     | geboortedatum     | Persoonslijst van persoon: geboortedatum van persoon                           |
      | 010330     | geboorteland      | Persoonslijst van persoon: geboorteland van persoon                            |
      | 010300     | groep geboorte    | Persoonslijst van persoon: geboortedatum van persoon, geboorteland van persoon |
      | 010000     | categorie persoon | Persoonslijst van persoon: persoon                                             |
