#language: nl

Functionaliteit: Gezag niet te bepalen wanneer gegeven in onderzoek dat gebruikt wordt bij gezagbepaling vraag 1.3b

    Achtergrond:
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig


  Regel: Gezag is niet te bepalen bij aktenummer bij persoon in onderzoek

    Abstract Scenario: minderjarige is geadopteerd en <omschrijving> staat in onderzoek
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is geboren in het buitenland
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * is ingeschreven in de BRP
      * er loopt onderzoek naar de persoon gegevens met aanduiding '<aanduiding>'
      En 'Bert' is geadopteerd door 'Aart' als ouder 2
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
      | aanduiding | omschrijving | toelichting                                       |
      | 018120     | aktenummer   | Persoonslijst van persoon: aktenummer van persoon |
      | 018100     | akte         | Persoonslijst van persoon: aktenummer van persoon |
      | 010000     | akte         | Persoonslijst van persoon: persoon                |


  Regel: Het in onderzoek staan van gegevens wordt niet gemeld als er om andere reden geen gezag kan worden bepaald
    # Deze regel is nu niet geïmplementeerd. Het scenario faalt.
    # De gezag api past nu regel "Gezag is niet te bepalen bij aktenummer bij persoon in onderzoek" toe

    Abstract Scenario: minderjarige is geboren in het buitenland en niet geadopteerd en <omschrijving> staat in onderzoek
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is geboren in het buitenland
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * er loopt onderzoek naar de persoon gegevens met aanduiding '<aanduiding>'
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                               |
      | type        | GezagNietTeBepalen                                                                                                   |
      #| minderjarige.burgerservicenummer | 000000036                 |
      | toelichting | gezag is niet te bepalen omdat minderjarige in het buitenland is geboren en geen Nederlandse adoptie-akte bekend is. |

      Voorbeelden:
      | aanduiding | omschrijving      | toelichting                                                                    |
      | 018120     | aktenummer        | Persoonslijst van persoon: aktenummer van persoon                              |
      | 018100     | groep akte        | Persoonslijst van persoon: aktenummer van persoon                              |
      | 010000     | categorie persoon | Persoonslijst van persoon: persoon                                             |
      | 010310     | geboortedatum     | Persoonslijst van persoon: geboortedatum van persoon                           |
      | 010330     | geboorteland      | Persoonslijst van persoon: geboorteland van persoon                            |
      | 010300     | groep geboorte    | Persoonslijst van persoon: geboortedatum van persoon, geboorteland van persoon |
