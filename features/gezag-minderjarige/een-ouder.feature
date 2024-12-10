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
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk gezag met ouder 'Gerda' en derde 'Ariane'

    Scenario: Minderjarige heeft ouder die partnerschap heeft met een meemoeder
      Gegeven 'Gerda' en 'Ariana' zijn 7 jaar geleden een geregistreerd partnerschap aangegaan
      En 'Bert' is 6 jaar geleden geboren
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk gezag met ouder 'Gerda' en derde 'Ariane'

    Scenario: Minderjarige is geboren voor 1 april 2014 en moeder heeft geregistreerd partnerschap
      Gegeven 'Gerda' en 'Aart' zijn een geregistreerd partnerschap aangegaan op 1-3-2010
      En 'Bert' is geboren op 1-1-2012
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk gezag met ouder 'Gerda' en derde 'Aart'

    Scenario: Minderjarige is geboren voor 1 april 2014 en moeder had bij geboorte geregistreerd partnerschap dat daarna is ontbonden
      Gegeven 'Gerda' en 'Ariana' zijn 7 jaar geleden een geregistreerd partnerschap aangegaan
      En 'Bert' is 6 jaar geleden geboren
      En het geregistreerd partnerschap van 'Gerda' en 'Ariana' is 3 jaar geleden ontbonden
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk gezag met ouder 'Gerda' en derde 'Ariana'


  Regel: Als de minderjarige niet tijdens een huwelijk of partnerschap van de juridische ouder geboren is, dan heeft de ouder eenhoofdig ouderlijk gezag

    Scenario: De ouder is alleenstaand
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Scenario: De ouder was gehuwd en is gescheiden voor de geboorte van minderjarige
      Gegeven 'Gerda' en 'Aart' zijn 7 jaar geleden gehuwd
      En 'Gerda' en 'Aart' zijn 5 jaar geleden gescheiden
      En 'Bert' is 2 jaar geleden geboren
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'

    Scenario: De ouder is gehuwd na geboorte van minderjarige
      Gegeven 'Bert' is 7 jaar geleden geboren
      En 'Gerda' en 'Aart' zijn 6 jaar geleden gehuwd
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'


  Regel: Als de minderjarige tijdens het huwelijk of partnerschap van de juridische ouder is geadopteerd, dan heeft de ouder eenhoofdig ouderlijk gezag en diens (toenmalige) partner gezamenlijk gezag
    De ouder was immers bij geboorte nog geen ouder. We moeten dus kijken naar de aanvang familierechtelijke betrekking en niet naar geboortedatum
  
    Scenario: adoptieouder was gehuwd op geboortedatum van de minderjarige maar niet gehuwd ten tijde van de adoptiedatum
      Gegeven 'Gerda' en 'Aart' zijn 6 jaar geleden gehuwd en 2 jaar geleden gescheiden
      En 'Bert' is 3 jaar geleden als vondeling geboren
      En 'Bert' is 1 jaar geleden geadopteerd door 'Gerda'
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'


  Regel: Als de minderjarige tijdens het huwelijk of partnerschap van de juridische ouder geboren is en er sprake is van ontkenning vaderschap, dan heeft de ouder eenhoofdig ouderlijk gezag

    Scenario: Minderjarige heeft ouder die gehuwd is en de partner heeft het vaderschap ontkend
      Gegeven 'Gerda' en 'Aart' zijn 7 jaar geleden gehuwd
      En 'Bert' is 1 jaar geleden geboren
      En 'Aart' heeft ontkend vader te zijn van 'Bert'
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'
