# language: nl
Functionaliteit: Gezag bepalen voor een minderjarige met twee juridische ouders die na de geboorte van het kind getrouwd zijn of waren of partnerschap hebben of hadden

  Achtergrond:
    Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
    * is meerderjarig
    En de persoon 'Aart' met burgerservicenummer '000000024'
    * is meerderjarig
    En de persoon 'Bert' met burgerservicenummer '000000036'
    * heeft 'Aart' en 'Gerda' als ouders

  Regel: Als de ouders na de geboorte van minderjarige een periode met elkaar gehuwd zijn (geweest) of partnerschap hebben (gehad), dan hebben de ouders samen tweehoofdig ouderlijk gezag

    Scenario: Beide ouders zijn getrouwd voor geboorte van het kind en zijn dat nog steeds
      Gegeven 'Bert' is 7 jaar geleden geboren
      En 'Gerda' en 'Aart' zijn 8 jaar geleden getrouwd
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag over 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Scenario: Beide ouders zijn getrouwd na geboorte van het kind en zijn dat nog steeds
      Gegeven 'Bert' is 7 jaar geleden geboren
      En 'Gerda' en 'Aart' zijn 5 jaar geleden getrouwd
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag over 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Scenario: Beide ouders waren getrouwd voor geboorte van het kind en zijn na geboorte gescheiden
      Gegeven 'Bert' is 7 jaar geleden geboren
      En 'Gerda' en 'Aart' zijn 8 jaar geleden getrouwd
      En 'Gerda' en 'Bert' zijn 2 jaar geleden gescheiden
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag over 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Scenario: Beide ouders waren getrouwd na geboorte van het kind en zijn na geboorte gescheiden
      Gegeven 'Bert' is 7 jaar geleden geboren
      En 'Gerda' en 'Aart' zijn 5 jaar geleden getrouwd
      En 'Gerda' en 'Bert' zijn 2 jaar geleden gescheiden
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag over 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Scenario: Beide ouders zijn met elkaar getrouwd en een ouder is geëmigreerd
      Gegeven persoon 'Bert'
      * is minderjarig
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd
      En persoon 'Aart'
      * is ingeschreven in de RNI met een verblijfplaats in Italië
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag over 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'
