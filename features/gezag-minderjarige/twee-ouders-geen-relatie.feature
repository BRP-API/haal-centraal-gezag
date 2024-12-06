# language: nl
Functionaliteit: Gezag bepalen voor een minderjarige met twee juridische ouders die na de geboorte van het kind niet getrouwd zijn of waren en geen partnerschap hebben of hadden

  Achtergrond:
    Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
    * is meerderjarig
    En de persoon 'Aart' met burgerservicenummer '000000024'
    * is meerderjarig
    En de persoon 'Bert' met burgerservicenummer '000000036'
    * is minderjarig

  Regel: Als de minderjarige is geadopteerd door één of beide ouders dan hebben de ouders samen tweehoofdig ouderlijk gezag

    Scenario: Minderjarige is geadopteerd door beide ouders
      Gegeven 'Bert' is geadopteerd door 'Gerda' en 'Aart'
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Scenario: Minderjarige is geadopteerd door de stiefouder
      Gegeven 'Gerda' is ouder van 'Bert'
      En 'Bert' is geadopteerd door 'Aart'
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

  Regel: Als de minderjarige is erkend na 1 januari 2023 dan hebben de ouders samen tweehoofdig ouderlijk gezag

    Scenario: Minderjarige is geboren voor 1 januari 2023 en erkend door andere ouder na 1 januari 2023
      Gegeven 'Bert' is geboren op 29-12-2022
      * heeft 'Gerda' als ouder op de geboorteakte
      En 'Bert' is erkend door 'Aart' op 3-1-2023
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Scenario: Minderjarige is geboren na 1 januari 2023 en is als ongeboren vrucht erkend door andere ouder
      Gegeven 'Bert' is gisteren geboren
      * heeft 'Aart' en 'Gerda' als ouders op de geboorteakte
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

  Regel: Als de minderjarige is erkend voor 1 januari 2023 dan heeft de geboortemoeder eenhoofdig ouderlijk gezag

    Scenario: Minderjarige is erkend voor 1 januari 2023
      Gegeven 'Bert' is geboren op 30-11-2022
      * heeft 'Gerda' als ouder op de geboorteakte
      En 'Bert' is erkend door 'Aart' op 29-12-2022
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Scenario: Minderjarige is geboren voor 1 januari 2023 en is als ongeboren vrucht erkend door andere ouder
      Gegeven de persoon 'Gerda'
      * is een vrouw
      En de persoon 'Aart'
      * is een man
      En 'Bert' is geboren op 30-11-2022
      * heeft 'Aart' en 'Gerda' als ouders op de geboorteakte
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Scenario: Minderjarige is geboren voor 1 januari 2023 en is als ongeboren vrucht erkend door andere ouder
      Gegeven de persoon 'Gerda'
      * is een vrouw
      En de persoon 'Ariana' met burgerservicenummer '000000024'
      * is meerderjarig
      * is een vrouw
      En 'Bert' is geboren op 30-11-2022
      * heeft 'Ariana' en 'Gerda' als ouders op de geboorteakte
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' niet te bepalen met de toelichting 'gezag kan niet worden bepaald omdat niet kan worden vastgesteld welke ouder de geboortemoeder is.'
