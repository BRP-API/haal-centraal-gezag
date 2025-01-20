# language: nl

Functionaliteit: Voor een minderjarige waarover gerechtelijke uitspraak over gezag is gedaan, is de uitspraak alleen bepalend voor gezag als er geen ontkenning vaderschap, adoptie of (reparatie)huwelijk na de uitspraak heeft plaatsgevonden. De meest recente gebeurtenis is bepalend voor het gezag.


  Achtergrond:
    Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
    * is meerderjarig
    En de persoon 'Aart' met burgerservicenummer '000000024'
    * is meerderjarig
    En de persoon 'Bert' met burgerservicenummer '000000036'
    * is minderjarig
    En de persoon 'Ariana' met burgerservicenummer '000000048'
    * is meerderjarig
    En de persoon 'Gerard' met burgerservicenummer '000000061'
    * is meerderjarig


  Regel: Als er een gerechtelijke uitspraak is dat één ouder het gezag heeft, en de ouders zijn daarna (opnieuw) met elkaar gehuwd, dan is er tweehoofdig ouderlijk gezag

    Voorbeeld: ouders zijn opnieuw met elkaar gehuwd (reparatiehuwelijk) na de gerechtelijke uitspraak
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En 'Gerda' en 'Aart' zijn 20 jaar geleden gehuwd
      En 'Gerda' en 'Aart' zijn 7 jaar geleden gescheiden
      En 6 jaar geleden is in een gerechtelijke uitspraak het gezag toegewezen aan 'Aart'
      En 'Gerda' en 'Aart' zijn 2 jaar geleden opnieuw gehuwd
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    # bespreken
    Voorbeeld: ouders zijn voor het eerst met elkaar gehuwd na de gerechtelijke uitspraak
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En 6 jaar geleden is in een gerechtelijke uitspraak het gezag toegewezen aan 'Aart'
      En 'Gerda' en 'Aart' zijn 2 jaar geleden gehuwd
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: ouders zijn met een ander gehuwd na de gerechtelijke uitspraak
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En 'Gerda' en 'Aart' zijn 20 jaar geleden gehuwd
      En 'Gerda' en 'Aart' zijn 7 jaar geleden gescheiden
      En 6 jaar geleden is in een gerechtelijke uitspraak het gezag toegewezen aan 'Aart'
      En 'Gerda' en 'Gerard' zijn 2 jaar geleden opnieuw gehuwd
      En 'Aart' en 'Ariana' zijn 1 jaar geleden opnieuw gehuwd
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Aart'


  Regel: Als er een gerechtelijke uitspraak is, en daarna is de minderjarige geadopteerd, dan wordt het gezag bepaald van rechtswege

    Voorbeeld: na de gerechtelijke uitspraak is de minderjarige geadopteerd
      Gegeven 6 jaar geleden is in een gerechtelijke uitspraak het gezag toegewezen aan een voogdijinstelling
      En 'Bert' is 2 jaar geleden geadopteerd door 'Gerda' en 'Aart'
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: na adoptie is er gerechtelijke uitspraak over gezag
      Gegeven 'Bert' is 6 jaar geleden geadopteerd door 'Gerda' en 'Aart'
      En 2 jaar geleden is in een gerechtelijke uitspraak het gezag toegewezen aan een voogdijinstelling
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' voogdij
    
    
  #Bespreken
  Regel: Als er een gerechtelijke uitspraak is dat één ouder of beide ouders gezag hebben, en het ouderschap is ontkend, dan heeft de overgebleven ouder eenhoofdig ouderlijk gezag

    Voorbeeld: na uitspraak over gezag heeft een ouder ouderschap ontkend
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En 6 jaar geleden is in een gerechtelijke uitspraak het gezag toegewezen aan 'Aart'
      En 4 jaar geleden heeft 'Aart' het ouderschap ontkend
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'


  Regel: Als er een gerechtelijke uitspraak is dat één ouder het gezag heeft, dan is er eenhoofdig ouderlijk gezag

    Voorbeeld: het gezag is toegewezen aan één van de twee ouders
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En in een gerechtelijke uitspraak is het gezag toegewezen aan 'Aart'
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Aart'


  Regel: Als er een gerechtelijke uitspraak is dat beide ouders het gezag hebben, dan is er tweehoofdig ouderlijk gezag

    Voorbeeld: het gezag is toegewezen aan beide ouders
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En in een gerechtelijke uitspraak is het gezag toegewezen beide ouders
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'


  Regel: Als er een gerechtelijke uitspraak is dat een voogd gezag heeft, dan is er sprake is van voogdij

    Voorbeeld: het gezag is toegewezen aan een voogdijinstelling
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En in een gerechtelijke uitspraak is het gezag toegewezen aan een voogdijinstelling
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' voogdij

    Voorbeeld: het gezag is toegewezen aan een derde
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En in een gerechtelijke uitspraak is het gezag toegewezen aan een derde
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' voogdij


  Regel: Als er een gerechtelijke uitspraak is dat één van de ouders gezag heeft samen met een derde, dan is er sprake van gezamenlijk gezag

    Voorbeeld: het gezag is toegewezen aan een van de ouders en een derde
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En in een gerechtelijke uitspraak is het gezag toegewezen aan ouder 'Gerda' en een derde
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk gezag met ouder 'Gerda'



  
