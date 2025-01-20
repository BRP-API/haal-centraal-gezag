# language: nl

Functionaliteit: Gezag bepalen voor een minderjarige met twee juridische ouders die na de geboorte van het kind niet gehuwd zijn of waren en geen partnerschap hebben of hadden

  Achtergrond:
    Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
    * is meerderjarig
    En de persoon 'Aart' met burgerservicenummer '000000024'
    * is meerderjarig
    En de persoon 'Bert' met burgerservicenummer '000000036'
    * is minderjarig
    En de persoon 'Ariana' met burgerservicenummer '000000048'
    * is meerderjarig

  Regel: Als de minderjarige is geadopteerd door één of beide ouders dan hebben de ouders samen tweehoofdig ouderlijk gezag

    Voorbeeld: Minderjarige is geadopteerd door beide ouders
      Gegeven 'Bert' is geadopteerd door 'Gerda' en 'Aart'
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: Minderjarige is geadopteerd door de stiefouder
      Gegeven 'Gerda' is ouder van 'Bert'
      En 'Bert' is geadopteerd door 'Aart'
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'


  Regel: Als de minderjarige is erkend na 1 januari 2023 dan hebben de ouders samen tweehoofdig ouderlijk gezag

    Voorbeeld: Minderjarige is als ongeboren vrucht erkend na 1 januari 2023
      Gegeven 'Bert' is gisteren geboren
      * heeft 'Aart' en 'Gerda' als ouders vanaf de geboortedatum
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: Minderjarige is erkend na 1 januari 2023
      Gegeven 'Bert' is geboren op 29-12-2022
      * heeft 'Gerda' als ouder vanaf de geboortedatum
      En 'Bert' is erkend door 'Aart' op 3-1-2023
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'


  Regel: Als de minderjarige is erkend na 1 januari 2023 en de geboortemoeder was bij geboorte gehuwd en er is een bekende donor, dan ...

    # bespreken
    # als geboortemoeder bij geboorte gehuwd is, wordt bekende donor dan als ouder geregistreerd of de partner van moeder?
    Voorbeeld: Minderjarige is na 1 januari 2023 erkend door bekende donor en moeder is gehuwd
      Gegeven 'Gerda' en 'Ariana' zijn 2 jaar geleden gehuwd
      En 'Bert' is 1 jaar geleden geboren
      * heeft 'Aart' en 'Gerda' als ouders vanaf de geboortedatum
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Ariana'


  Regel: Als de ouders na de geboorte van minderjarige niet met elkaar gehuwd zijn (geweest) en geen partnerschap hebben (gehad) en de minderjarige is erkend voor 1 januari 2023 dan heeft de geboortemoeder eenhoofdig ouderlijk gezag

    Voorbeeld: Ouders zijn nooit met elkaar gehuwd geweest en minderjarige is erkend voor 1 januari 2023
      Gegeven 'Bert' is geboren op 30-11-2022
      * heeft 'Gerda' als ouder vanaf de geboortedatum
      En 'Bert' is erkend door 'Aart' op 29-12-2022
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Voorbeeld: Minderjarige is als ongeboren vrucht erkend voor 1 januari 2023
      Gegeven persoon 'Gerda'
      * is een vrouw
      En persoon 'Aart'
      * is een man
      En 'Bert' is geboren op 30-11-2022
      * heeft 'Aart' en 'Gerda' als ouders vanaf de geboortedatum
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Voorbeeld: Ouders waren met elkaar gehuwd en zijn voor geboorte van de minderjarige gescheiden
      Gegeven persoon 'Gerda'
      * is een vrouw
      En persoon 'Aart'
      * is een man
      En 'Gerda' en 'Aart' zijn op 1-6-2015 gehuwd
      En 'Gerda' en 'Aart' zijn op 1-7-2020 gescheiden
      En persoon 'Bert'
      * is geboren op 30-11-2022
      * heeft 'Aart' en 'Gerda' als ouders vanaf de geboortedatum
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Voorbeeld: Minderjarige is geboren voor 1 januari 2023 en is als ongeboren vrucht erkend door andere ouder
      Gegeven persoon 'Gerda'
      * is een vrouw
      En de persoon 'Ariana' met burgerservicenummer '000000024'
      * is meerderjarig
      * is een vrouw
      En 'Bert' is geboren op 30-11-2022
      * heeft 'Ariana' en 'Gerda' als ouders vanaf de geboortedatum
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag kan niet worden bepaald omdat niet kan worden vastgesteld welke ouder de geboortemoeder is.'
