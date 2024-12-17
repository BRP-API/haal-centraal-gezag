#language: nl
Functionaliteit: Gezag over een minderjarige is niet te bepalen als het gezag mogelijk in het buitenland ontstaan is en het gezag na het verblijf in het buitenland niet onder Nederlands recht is vastgesteld door adoptie of een gerechtelijke uitspraak. De meest recente gebeurtenis is bepalend voor het gezag.
  Gezag kan alleen worden bepaald wanneer het gezag van de minderjarige uitsluitend onder Nederlands recht kan worden vastgesteld. 
  Wanneer een minderjarige verhuist naar een ander land, neemt deze het gezag mee naar het nieuwe land.
  Daarom kan het gezag over een geïmmigreerde of een geremigreerde minderjarige niet worden bepaald.
  Bij de Nederlandse overheid is nu niet bekend welk gezag de minderjarige uit het buitenland heeft meegenomen.
  Echter, als een minderjarige na de immigratie of remigratie in Nederland is geadopteerd of als over minderjarige in Nederland een gerechtelijke uitspraak over gezag is gedaan, dan kan gezag wel worden bepaald. Het gezag is dan immers onder Nederlandse recht opnieuw vastgesteld of gewijzigd. Zie hiervoor gerechtelijke-uitspraak.feature.


  Regel: Gezag is niet te bepalen als de minderjarige in de RNI is ingeschreven

    Scenario: Minderjarige verblijft in het buitenland.
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in de RNI met een verblijfplaats in België
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'Gezag is niet te bepalen omdat minderjarige niet of tijdelijk in Nederland woont.'

    Scenario: Minderjarige verblijft tijdelijk in Nederland.
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in de RNI met een tijdelijk verblijfsadres in Nederland
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige niet of tijdelijk in Nederland woont.'

    Scenario: Verblijfplaats van minderjarige is onbekend.
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in de RNI met een volledig onbekende verblijfplaats
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige niet of tijdelijk in Nederland woont.'

    # bespreken
    Scenario: Gezag kan wel worden bepaald als een ouder in RNI staat ingeschreven.
      Gegeven persoon 'Bert'
      * is minderjarig
      * is ingeschreven in een Nederlandse gemeente
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd
      En persoon 'Aart'
      * is ingeschreven in de RNI met een verblijfplaats in Italië
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'


  Regel: Gezag is niet te bepalen als is vastgesteld dat de minderjarige niet meer op het geregistreerde adres woont.

    Scenario: Er is vastgesteld dat de minderjarige niet meer op het adres verblijft
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in een Nederlandse gemeente
      * de gemeente heeft vastgesteld dat de minderjarige niet op het adres verblijft
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat is vastgesteld dat minderjarige niet op het geregistreerde adres woont.'


  Regel: Gezag is niet te bepalen als de meest recente gebeurtenis voor gezag vestiging van minderjarige in Nederland vanuit het buitenland is.

    Scenario: Minderjarige is geboren in het buitenland en geïmmigreerd naar Nederland.
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is geboren in België
      En is op 15-5-2014 geïmmigreerd
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'

    Scenario: Minderjarige is geëmigreerd geweest.
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      En 'Bert' is 1 jaar geleden geëmigreerd naar België
      En 'Bert' is vorige maand geïmmigreerd naar Nederland
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'


  Regel: Gezag kan worden bepaald als de minderjarige na verblijf in het buitenland in Nederland is geadopteerd. 

    Scenario: Minderjarige is geïmmigreerd naar Nederland en daarna geadopteerd in Nederland.
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in een Nederlandse gemeente
      En 'Bert' is 1 jaar geleden geïmmigreerd naar Nederland
      En 'Bert' is vorige maand geadopteerd in Nederland door 'Gerda' en 'Aart'
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Scenario: Minderjarige is geadopteerd in Nederland en daarna geëmigreerd geweest.
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
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'


  # bespreken
  Regel: Gezag kan worden bepaald als over minderjarige na verblijf in het buitenland een gerechtelijke uitspraak over het gezag is gedaan.

    Scenario: Minderjarige is geïmmigreerd naar Nederland en daarna is een gerechtelijke uitspraak over gezag gedaan in Nederland.
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
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Scenario: Over minderjarige is een gerechtelijke uitspraak over het gezag gedaan en minderjarige is daarna geëmigreerd geweest.
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
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'


  Regel: Gezag is niet te bepalen als één of beide ouders niet zijn ingeschreven.

    Scenario: Minderjarige is geboren na 1 januari 2023 en is als ongeboren vrucht erkend door andere ouder die niet in Nederland staat ingeschreven
      Gegeven 'Bert' is gisteren geboren
      * heeft 'Gerda' als ouder
      * heeft 'Luciano' als ouder die niet met burgerservicenummer is ingeschreven in de BRP
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'Gezag is niet te bepalen omdat de gegevens van een ouder niet worden bijgehouden.'


  # bespreken
  Regel: Gezag als er sprake is van opschorting bijhouding ministerieel besluit

    Scenario: Bijhouding is opgeschort voor minderjarig kind van NAVO militair of diplomaat
      ...
