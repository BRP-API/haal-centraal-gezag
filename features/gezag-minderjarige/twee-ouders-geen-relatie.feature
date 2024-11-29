#language: nl

Functionaliteit: Gezag bepalen voor een minderjarige met twee ouders die na de geboorte van het kind niet getrouwd zijn of waren en geen partnerschap hebben of hadden


    Achtergrond:
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig


  Regel: Als het kind is geadopteerd door één of beide ouders dan hebben de ouders samen tweehoofdig ouderlijk gezag

    Scenario: Minderjarige is geadopteerd door beide ouders
      Gegeven 'Bert' is geadopteerd door 'Gerda' en 'Aart'
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het antwoord 'TweehoofdigOuderlijkGezag'
      * met ouders 'Gerda' en 'Aart'

    Scenario: Minderjarige is geadopteerd door de stiefouder
      Gegeven 'Gerda' is ouder van 'Bert'
      En 'Bert' is geadopteerd door 'Aart'
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het antwoord 'TweehoofdigOuderlijkGezag'
      * met ouders 'Gerda' en 'Aart'


  Regel: Als het kind is erkend na 1 januari 2023 dan hebben de ouders samen tweehoofdig ouderlijk gezag

    Scenario: Minderjarige is geboren voor 1 januari 2023 en erkend door andere ouder na 1 januari 2023
