# language: nl
Functionaliteit: Gezag bepalen voor een minderjarige met één juridische ouder

  Achtergrond:
    Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
    * is meerderjarig
    En de persoon 'Aart' met burgerservicenummer '000000024'
    * is meerderjarig
    En de persoon 'Ariana' met burgerservicenummer '000000036'
    * is meerderjarig
    En de persoon 'Bert' met burgerservicenummer '000000048'
    * is minderjarig
    * heeft 'Gerda' als ouder

  Regel: Als de minderjarige tijdens het huwelijk of partnerschap van de juridische ouder geboren is, dan hebben de ouder en diens (toenmalige) partner gezamenlijk gezag

    Scenario: Minderjarige heeft ouder die gehuwd is met een meemoeder
      Gegeven 'Gerda' en 'Ariana' zijn 7 jaar geleden gehuwd
      En 'Bert' is 6 jaar geleden geboren
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' gezamenlijk gezag met ouder 'Gerda' en derde 'Ariane'

    Scenario: Minderjarige heeft ouder die partnerschap heeft met een meemoeder
      Gegeven 'Gerda' en 'Ariana' zijn 7 jaar geleden een geregistreerd partnerschap aangegaan
      En 'Bert' is 6 jaar geleden geboren
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' gezamenlijk gezag met ouder 'Gerda' en derde 'Ariane'

    Scenario: Minderjarige is geboren voor 1 april 2014 en moeder heeft geregistreerd partnerschap
      Gegeven 'Gerda' en 'Aart' zijn een geregistreerd partnerschap aangegaan op 1-3-2010
      En 'Bert' is geboren op 1-1-2012
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' gezamenlijk gezag met ouder 'Gerda' en derde 'Aart'

  Regel: Als de minderjarige niet tijdens een huwelijk of partnerschap van de juridische ouder geboren is, dan heeft de ouder eenhoofdig ouderlijk gezag

    Scenario: De ouder is alleenstaand
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Scenario: De ouder was getrouwd en is gescheiden voor de geboorte van minderjarige
      Gegeven 'Gerda' en 'Aart' zijn 7 jaar geleden gehuwd
      En 'Gerda' en 'Aart' zijn 5 jaar geleden gescheiden
      En 'Bert' is 2 jaar geleden geboren
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Scenario: De ouder is getrouwd na geboorte van minderjarige
      Gegeven 'Bert' is 7 jaar geleden geboren
      En 'Gerda' en 'Aart' zijn 6 jaar geleden gehuwd
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag voor 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'
    # Regel: Als de minderjarige één juridische ouder heeft en het kind is staande huwelijk of partnerschap geadopteerd, dan heeft de ouder eenhoofdig ouderlijk gezag en diens (toenmalige) partner gezamenlijk gezag
    # Scenario:
    #   Bert is vondeling geboren 1 mei 2024. ouder 1 = "."
    #   Gerda adopteert Bert op 1 december 2024. ouder 1 = "." aanvang familierechtelijke betrekking = 1 mei, ouder 2 = 'Gerda' aanvang familierechtelijke betrekking = 1 december
    #   Gerda was getrouwd met Ariana van 1 februari tot 1 september

  Regel: Als de minderjarige één juridische ouder heeft en het kind is staande huwelijk of partnerschap geboren en er sprake is van ontkenning vaderschap, dan heeft de ouder eenhoofdig ouderlijk gezag
