# language: nl
Functionaliteit: Gezag niet te bepalen
  Gezag over een minderjarige is niet te bepalen als het gezag mogelijk in het buitenland ontstaan is en het gezag na het verblijf in het buitenland niet onder Nederlands recht is vastgesteld door adoptie of een gerechtelijke uitspraak. De meest recente gebeurtenis is bepalend voor het gezag.
  
  Gezag kan alleen worden bepaald wanneer het gezag van de minderjarige uitsluitend onder Nederlands recht kan worden vastgesteld. 
  Wanneer een minderjarige verhuist naar een ander land, behoudt de gezagshebbende ouder het gezag, maar kan de ouder door de wetgeving van dat andere land ook van rechtswege het gezag verkrijgen.
  Dit gezag blijft behouden als minderjarige weer terugverhuist of naar een ander land verhuist. Omdat dit gezag automatisch tot stand komt, wordt het niet geregistreerd.
  Daarom kan het gezag over een geïmmigreerde of een geremigreerde minderjarige niet worden bepaald. Bij de Nederlandse overheid is nu niet bekend welk gezag de minderjarige uit het buitenland heeft meegenomen.
  Het is de verblijfplaats van de minderjarige - en niet de verblijfplaats van de meerderjarige ouder - die bepalend is (art. 16 Haags kinderbeschermingsverdrag 1996).
    
  Als een minderjarige na de immigratie of remigratie in Nederland is geadopteerd of als over minderjarige in Nederland een gerechtelijke uitspraak over gezag is gedaan, dan kan gezag wel worden bepaald. Het gezag is dan immers onder Nederlandse recht opnieuw vastgesteld of gewijzigd en is zichtbaar in het gezagsregister. Zie hiervoor [Gerechtelijke uitspraak functionaliteit](gerechtelijke-uitspraak.feature).
  # Bespreken
  # Gezag uitgangspunt: eens gegeven is altijd gegeven
  # Gehuwde ouders met kind zijn geëmigreerd geweest: is gezag dan te bepalen tot gezamenlijk ouderlijk gezag?
  # En andere situaties met gezamenlijk (ouderlijk) gezag? Bijv. na adoptie? En bij voogdij? En na gerechtelijke uitspraak?
  # Ouders scheiden in buitenland en gezag daar toegewezen aan één van de ouders: dan ook beide ouders het gezag in Nederland na remigreren?
  # Ouder(s) onbevoegd/curatele in buitenland: dan ook beide ouders het gezag in Nederland na remigreren?

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

  @nieuw
  Regel: Als minderjarige in het buitenland verblijft en op het moment van emigratie van rechtswege gezamenlijk (ouderlijk) gezag had, dan is dat nu nog zo

    Voorbeeld: Ouders zijn met elkaar gehuwd en de minderjarige is geëmigreerd
      Gegeven 'Gerda' en 'Aart' zijn met elkaar gehuwd
      En persoon 'Bert'
      * heeft 'Aart' en 'Gerda' als ouders
      * is ingeschreven als niet-ingezetene met een verblijfplaats in België
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: Er is één ouder die was gehuwd bij geboorte minderjarige en de minderjarige is daarna geëmigreerd
      Gegeven 'Gerda' en 'Ariana' zijn 7 jaar geleden gehuwd
      En 'Bert' is 6 jaar geleden geboren
      En persoon 'Bert'
      * heeft 'Gerda' als ouder
      * is ingeschreven in een Nederlandse gemeente
      En is daarna ingeschreven als niet-ingezetene met een verblijfplaats in België
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk gezag met ouder 'Gerda' en derde 'Ariane'

    Voorbeeld: Minderjarige geadopteerd in NL door twee ouders die niet met elkaar gehuwd zijn en de minderjarige is daarna geëmigreerd
      # Gerda en Aart zijn nooit met elkaar gehuwd geweest
      Gegeven 'Bert' is geadopteerd door 'Gerda' en 'Aart'
      En persoon 'Bert'
      * is ingeschreven in een Nederlandse gemeente
      En is daarna ingeschreven als niet-ingezetene met een verblijfplaats in België
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: Minderjarige is nooit ingezetene van Nederland geweest en is als niet-ingezetene ingeschreven
      # registreren we dan ouders?
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'Gezag is niet te bepalen omdat minderjarige niet in Nederland woont.'


  @nieuw
  Regel: Als minderjarige in het buitenland heeft verbleven en op het moment van emigratie van rechtswege gezamenlijk (ouderlijk) gezag had, dan is dat nu nog zo

  @nieuw
  Regel: Als er een gerechtelijke uitspraak over het gezag over een minderjarige die geldig was op het moment van emigratie, dan geldt die nog steeds na emigratie
    Voorbeelden gezag 1, 2, 12, 1D, 2D, D
    Voorbeeld persoon is geëmigreerd
    Voorbeeld persoon is geëmigreerd geweest (geremigreerd)
    Voorbeeld twee ouders, gezag 1, emigratie naar Spanje: blijft alleen ouder 1, niet van rechtswege volgens Spaans recht beide ouders

  @nieuw
  Regel: Als minderjarige de gewone verblijfplaats is of was in een land waar de andere ouder van rechtswege ook gezag krijgt, dan geldt gezamenlijk ouderlijk gezag
    # Wanneer is iets de gewone verblijfplaats? Hoe bepalen we dat? Minimale verblijfperiode? Inschrijving RNI? Ten minste één ouder/beide ouders op zelfde adres/land?

    Voorbeeld: ongehuwde ouders erkend voor 1-1-2023 en minderjarige verblijft/heeft verbleven in Spanje samen met beide ouders

    Voorbeeld: ongehuwde ouders erkend voor 1-1-2023 en minderjarige verblijft/heeft verbleven in Spanje samen met de moeder, de vader is al die tijd in NL verbleven

    Voorbeeld: ongehuwde ouders erkend voor 1-1-2023 en minderjarige verblijft/heeft verbleven in Spanje samen met de vader zonder gezag, de moeder is al die tijd in NL verbleven

    Voorbeeld: ongehuwde ouders erkend voor 1-1-2023 en minderjarige geboren in Spanje en geïmmigreerd naar Nederland

  @nieuw
  Regel: minderjarige die niet in NL geboren is uit met elkaar gehuwde ouders en hier de vaste verblijfplaats heeft, krijgt gezag volgens Nederlands recht gezamenlijk ouderlijk gezag

    Voorbeeld: minderjarige met elkaar gehuwde ouders is geboren in en geïmmigreerd uit Afghanistan: gezamenlijk ouderlijk gezag

  @nieuw
  Regel: minderjarige met twee ouders die niet in NL geboren is na 1-1-2023 en hier de vaste verblijfplaats heeft, krijgt gezag volgens Nederlands recht gezamenlijk ouderlijk gezag

    Voorbeeld: minderjarige erkend (geboren) na 1-1-2023 met (mogelijk) ongehuwde ouders en geïmmigreerd uit Afghanistan: gezamenlijk ouderlijk gezag

  @nieuw
  Regel: minderjarige met één ouder die ongehuwd was bij geboorte heeft eenhoofdig ouderlijk gezag

    Voorbeeld: minderjarige is geëmigreerd

    Voorbeeld: minderjarige is geëmigreerd geweest

    Voorbeeld: minderjarige is in het buitenland geboren

  @nieuw
  Regel: minderjarige met één ouder die gehuwd was bij geboorte heeft gezamenlijk gezag met partner

    Voorbeeld: minderjarige is geëmigreerd

    Voorbeeld: minderjarige is geëmigreerd geweest

    Voorbeeld: minderjarige is in het buitenland geboren
  # opmerking toevoegen: uitgangspunt is dat eventuele gezagsbeperkende maatregelen in het buitenland door de meerderjarige zelf in het centraal gezagsregister moet worden ingeschreven 
  # bespreken: Zijn er uitzonderingen waarbij er wel gezag te bepalen is na geëmigreerd geweest?
  # - Ouders gehuwd voor en na emigratie
  # - Minderjarige geadopteerd
  # - gehuwde ouders voor en na emigratie die voor emigratie al beide gezag hadden
  # - erkenning voor 1-1-2023 en gewoond in land waar dan wel gezag voor beide ouders (bijv. Spanje)
  # - gehuwde ouders en ten minste één ouder woont in NL en minderjarige ook in NL
  # - immigratie minderjarige met 2 gehuwde ouders
  # - twee ouders en erkenning na 1-1-2023
  # - na gerechtelijke uitspraak ook na emigratie/remigratie
  # - ook na emigratie bij gezamenlijk gezag van rechtswege
  # - in NL geboren minderjarige heeft maar één ouder (moeder) die ongehuwd is
  # - ...
  # - een ouder niet in BRP: wel gezag bepalen
  # haags kinderbeschermingsgezag 1996 (door NL geratificeerd 2011): minderjarige die in NL gewone vaste verblijfplaats heeft, krijgt gezag naar NL recht
  # inschrijving in BRP betekent niet altijd dat de gewone verblijfplaats in NL is. bijv. expat, studeren in NL zijn voorbeelden niet gewone verblijfplaats (ook als dat voor jaren is)
  # wel vaste verblijfplaats:
  # - na tijdelijk VOW (land 0000 plus onderzoek geweest naar verblijfplaats)
  # Als bij vertrek er gezamenlijk ouderlijk gezag was dan hebben ze dat bij terugkomst nog steeds. Dus bij alle gehuwde ouders?
  # Evt. gerechtelijke uitspraak in het buitenland kan de burger dan zelf tonen.
  # NL woont in buitenland (België, Duitsland)? oplossing nog onduidelijk, maar wel grote groep
  # toelichting toevoegen: behoudens buitenlandse uitspraak --> geen toelichting doen want advies is laten inschrijven in gezagsregister
  # reparatiehuwelijk: gezagsbeëindigende maatregel of toewijzing gezag. 
  # - niet te zien of het gezagsbeëindigende maatregel of toewijzing gezag was
  # - Heidi gaat bespreken hoe we hiermee om moeten gaan
  # - voor nu zo laten als eerder beschreven

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

  Regel: Gezag als er sprake is van opschorting bijhouding ministerieel besluit
  # Bespreken
  # Valt (gezag over) deze minderjarige nog onder Nederlands recht?
  # Zijn gegevens over minderjarige en de ouders nog actueel genoeg om gezag op te kunnen bepalen?

    Voorbeeld: Bijhouding is opgeschort voor minderjarig kind van NAVO militair
      ...
