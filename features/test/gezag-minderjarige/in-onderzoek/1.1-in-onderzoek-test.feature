#language: nl

Functionaliteit: Gezag niet te bepalen wanneer gegeven in onderzoek dat gebruikt wordt bij gezagbepaling vraag 1.1

    Achtergrond:
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig


  Regel: Gezag is wel te bepalen bij burgerservicenummer in onderzoek en verblijfplaats in onderzoek

    Abstract Scenario: <omschrijving> staat in onderzoek
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * er loopt onderzoek naar de <categorie> gegevens met aanduiding '<aanduiding>'
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
      | categorie      | aanduiding | omschrijving              |
      | persoon        | 010120     | burgerservicenummer       |
      | persoon        | 010100     | groep identificatie       |
      | verblijfplaats | 080910     | gemeente van inschrijving |
      | verblijfplaats | 080900     | groep gemeente            |
      | verblijfplaats | 080000     | categorie verblijfplaats  |
