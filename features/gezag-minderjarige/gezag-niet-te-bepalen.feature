#language: nl
Functionaliteit: Gezag is niet te bepalen over een minderjarige die mogelijk niet onder Nederlands valt
  Gezag is alleen met zekerheid te bepalen wanneer het gezag van de minderjarige onder Nederlands recht wordt bepaald.

  Wanneer een minderjarige verhuist naar een ander land, neemt deze het gezag mee naar het nieuwe land.
  Daarom is het gezag niet te bepalen van een minderjarige die uit een ander land is geïmmigreerd.
  Bij de Nederlandse overheid is niet bekend welk gezag de minderjarige uit het buitenland heeft meegenomen.

  Regel: Gezag is niet te bepalen als de minderjarige in de RNI staat ingeschreven

    Scenario: Minderjarige verblijft in het buitenland, gezag is niet te bepalen
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in de RNI met een verblijfplaats in België
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' niet te bepalen met de toelichting 'Gezag is niet te bepalen omdat minderjarige niet of tijdelijk in Nederland woont.'

    Scenario: Minderjarige verblijft tijdelijk in Nederland
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in de RNI met een tijdelijk verblijfsadres in Nederland
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige niet of tijdelijk in Nederland woont.'

    Scenario: Verblijfplaats van minderjarige is onbekend
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in de RNI met een volledig onbekende verblijfplaats
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige niet of tijdelijk in Nederland woont.'

  Regel: Gezag is niet te bepalen als is vastgesteld dat de minderjarige niet meer op het geregistreerde adres woont, dan is het gezag niet te bepalen

    Scenario: Er is vastgesteld dat de minderjarige niet meer op het adres verblijft
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in een Nederlandse gemeente
      * de gemeente heeft vastgesteld dat de minderjarige niet op het adres verblijft
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat is vastgesteld dat minderjarige niet op het geregistreerde adres woont.'

  Regel: Gezag is niet te bepalen als de meest recente gebeurtenis voor gezag vestiging van minderjarige in Nederland vanuit het buitenland is

    Scenario: Minderjarige is geboren in het buitenland en geïmmigreerd naar Nederland
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is geboren in België
      En is op 15-5-2014 geïmmigreerd
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'

    Scenario: Minderjarige is geëmigreerd geweest
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      En 'Bert' is 1 jaar geleden geëmigreerd naar België
      En 'Bert' is vorige maand geïmmigreerd naar Nederland
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'

  Regel: Gezag kan worden bepaald als de meest recente gebeurtenis voor gezag adoptie van de minderjarige in Nederland

    Scenario: Minderjarige is geïmmigreerd naar Nederland en daarna geadopteerd in Nederland
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in een Nederlandse gemeente
      En 'Bert' is 1 jaar geleden geïmmigreerd naar Nederland
      En 'Bert' is vorige maand geadopteerd in Nederland door 'Gerda' en 'Aart'
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Scenario: Minderjarige is geadopteerd in Nederland en daarna geëmigreerd geweest
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in een Nederlandse gemeente
      En 'Bert' is 2 jaar geleden geadopteerd in Nederland door 'Gerda' en 'Aart'
      En 'Bert' is 1 jaar geleden geëmigreerd naar België
      En 'Bert' is vorige maand geïmmigreerd naar Nederland
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'

  Regel: Gezag kan worden bepaald als de meest recente gebeurtenis voor gezag een gerechtelijke uitspraak over het gezag van minderjarige is

    Scenario: Minderjarige is geïmmigreerd naar Nederland en daarna geadopteerd in Nederland
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in een Nederlandse gemeente
      * heeft 'Gerda' en 'Aart' als ouders
      En 'Bert' is 1 jaar geleden geïmmigreerd naar Nederland
      En er is vorige maand een gerechtelijke uitspraak over het gezag geweest waarbij het gezag over 'Bert' is toegewezen aan 'Gerda'
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Scenario: Minderjarige is geadopteerd in Nederland en daarna geëmigreerd geweest
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in een Nederlandse gemeente
      En er is 2 jaar geleden een gerechtelijke uitspraak over het gezag geweest waarbij het gezag over 'Bert' is toegewezen aan 'Gerda'
      En 'Bert' is 1 jaar geleden geëmigreerd naar België
      En 'Bert' is vorige maand geïmmigreerd naar Nederland
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'
