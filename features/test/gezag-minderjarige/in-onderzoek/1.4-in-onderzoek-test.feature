#language: nl

Functionaliteit: Gezag niet te bepalen wanneer gegeven in onderzoek dat gebruikt wordt bij gezagbepaling vraag 1.4

    Achtergrond:
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig


  Regel: Gezag is niet te bepalen bij indicatie gezag minderjarige in onderzoek

    Abstract Scenario: er is een uitspraak gezag voor minderjarige en <omschrijving> staat in onderzoek
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * in een gerechtelijke uitspraak is het gezag toegewezen aan 'ouder 1'
      * er loopt onderzoek naar de gezagsverhouding gegevens met aanduiding '<aanduiding>'
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                            |
      | type        | GezagNietTeBepalen                                                                                |
      #| minderjarige.burgerservicenummer | 000000036                 |
      | toelichting | Gezag is niet te bepalen, omdat de volgende relevante gegevens in onderzoek staan. <toelichting>. |

      Voorbeelden:
      | aanduiding | omschrijving                 | toelichting                                             |
      | 113210     | indicatie gezag minderjarige | Persoonslijst van persoon: indicatie gezag minderjarige |
      | 113200     | groep gezag minderjarige     | Persoonslijst van persoon: indicatie gezag minderjarige |
      | 110000     | categorie gezagsverhouding   | Persoonslijst van persoon: gezagsverhouding             |
