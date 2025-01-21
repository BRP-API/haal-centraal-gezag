# language: nl
Functionaliteit: Gezag niet te bepalen
  Gezag over een minderjarige is niet te bepalen als het gezag mogelijk in het buitenland ontstaan is en het gezag na het verblijf in het buitenland niet onder Nederlands recht is vastgesteld door adoptie of een gerechtelijke uitspraak. De meest recente gebeurtenis is bepalend voor het gezag.
  
  Gezag kan alleen worden bepaald wanneer het gezag van de minderjarige uitsluitend onder Nederlands recht kan worden vastgesteld. 
  Wanneer een minderjarige verhuist naar een ander land, neemt deze het gezag mee naar het nieuwe land.
  Daarom kan het gezag over een geïmmigreerde of een geremigreerde minderjarige niet worden bepaald.
  Bij de Nederlandse overheid is nu niet bekend welk gezag de minderjarige uit het buitenland heeft meegenomen.
  Echter, als een minderjarige na de immigratie of remigratie in Nederland is geadopteerd of als over minderjarige in Nederland een gerechtelijke uitspraak over gezag is gedaan, dan kan gezag wel worden bepaald. Het gezag is dan immers onder Nederlandse recht opnieuw vastgesteld of gewijzigd. Zie hiervoor gerechtelijke-uitspraak.feature.

  Achtergrond:
    Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
    * is meerderjarig
    En de persoon 'Aart' met burgerservicenummer '000000024'
    * is meerderjarig
    En 'Gerda' en 'Aart' zijn met elkaar gehuwd
    En de persoon 'Bert' met burgerservicenummer '000000036'
    * is minderjarig
    * heeft 'Aart' en 'Gerda' als ouders

  Regel: Gezag is niet te bepalen als de minderjarige niet in Nederland woont

    Voorbeeld: Minderjarige verblijft in het buitenland.
      Gegeven persoon 'Bert'
      * is ingeschreven als niet-ingezetene met een verblijfplaats in België
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'Gezag is niet te bepalen omdat minderjarige niet in Nederland woont.'

    Voorbeeld: Minderjarige verblijft tijdelijk in Nederland.
      Gegeven persoon 'Bert'
      * is ingeschreven als niet-ingezetene met een tijdelijk verblijfsadres in Nederland
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige niet in Nederland woont.'

    Voorbeeld: Verblijfplaats van minderjarige is onbekend.
      Gegeven persoon 'Bert'
      * is ingeschreven als niet-ingezetene met een volledig onbekende verblijfplaats
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige niet in Nederland woont.'
    # bespreken

    Voorbeeld: Gezag kan wel worden bepaald als een ouder als niet-ingezetene staat ingeschreven.
      Gegeven persoon 'Aart'
      * is ingeschreven als niet-ingezetene met een verblijfplaats in België
      En persoon 'Bert'
      * is ingeschreven in een Nederlandse gemeente
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: Er is vastgesteld dat de minderjarige niet meer op het adres verblijft
      Gegeven persoon 'Bert'
      * is ingeschreven in een Nederlandse gemeente
      * de gemeente heeft vastgesteld dat de minderjarige niet op het adres verblijft
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

  Regel: Gezag is niet te bepalen als de meest recente gebeurtenis voor gezag vestiging van minderjarige in Nederland vanuit het buitenland is.

    Voorbeeld: Minderjarige is geboren in het buitenland en geïmmigreerd naar Nederland.
      Gegeven persoon 'Bert'
      * is geboren in België
      En is op 15-5-2014 geïmmigreerd
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'

    Voorbeeld: Minderjarige is geëmigreerd geweest.
      Gegeven 'Bert' is 1 jaar geleden geëmigreerd naar België
      En 'Bert' is vorige maand geïmmigreerd naar Nederland
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'

  Regel: Gezag kan worden bepaald als de minderjarige na verblijf in het buitenland in Nederland is geadopteerd.

    Voorbeeld: Minderjarige is geïmmigreerd naar Nederland en daarna geadopteerd in Nederland.
      Gegeven 'Bert' is 1 jaar geleden geïmmigreerd naar Nederland
      En 'Bert' is vorige maand geadopteerd in Nederland door 'Gerda' en 'Aart'
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: Minderjarige is geadopteerd in Nederland en daarna geëmigreerd geweest.
      Gegeven 'Bert' is 2 jaar geleden geadopteerd in Nederland door 'Gerda' en 'Aart'
      En 'Bert' is 1 jaar geleden geëmigreerd naar België
      En 'Bert' is vorige maand geïmmigreerd naar Nederland
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'
  # bespreken

  Regel: Gezag kan worden bepaald als over minderjarige na verblijf in het buitenland een gerechtelijke uitspraak over het gezag is gedaan.

    Voorbeeld: Minderjarige is geïmmigreerd naar Nederland en daarna is een gerechtelijke uitspraak over gezag gedaan in Nederland.
      Gegeven 'Bert' is 1 jaar geleden geïmmigreerd naar Nederland
      En er is vorige maand een gerechtelijke uitspraak over het gezag geweest waarbij het gezag over 'Bert' is toegewezen aan 'Gerda'
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Voorbeeld: Over minderjarige is een gerechtelijke uitspraak over het gezag gedaan en minderjarige is daarna geëmigreerd geweest.
      Gegeven er is 2 jaar geleden een gerechtelijke uitspraak over het gezag geweest waarbij het gezag over 'Bert' is toegewezen aan 'Gerda'
      En 'Bert' is 1 jaar geleden geëmigreerd naar België
      En 'Bert' is vorige maand geïmmigreerd naar Nederland
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.'

  Regel: Gezag is niet te bepalen als één of beide ouders niet zijn ingeschreven.

    Voorbeeld: Minderjarige is geboren na 1 januari 2023 en is als ongeboren vrucht erkend door andere ouder die niet in Nederland staat ingeschreven
      Gegeven 'Bert' is gisteren geboren
      * heeft 'Gerda' als ouder
      * heeft 'Luciano' als ouder die niet met burgerservicenummer is ingeschreven in de BRP
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'Gezag is niet te bepalen omdat de gegevens van een ouder niet worden bijgehouden.'
  # bespreken

  Regel: Gezag als er sprake is van opschorting bijhouding ministerieel besluit

    Voorbeeld: Bijhouding is opgeschort voor minderjarig kind van NAVO militair
      ...
