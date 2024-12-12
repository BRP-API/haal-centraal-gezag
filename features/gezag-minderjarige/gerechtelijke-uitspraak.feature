# language: nl

Functionaliteit: Gezag bepalen voor een minderjarige waarover gerechtelijke uitspraak over gezag is gedaan


  Achtergrond:
    Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
    * is meerderjarig
    En de persoon 'Aart' met burgerservicenummer '000000024'
    * is meerderjarig
    En de persoon 'Bert' met burgerservicenummer '000000036'
    * is minderjarig

  Regel: Als er een gerechtelijke uitspraak is dat één ouder het gezag heeft, en de ouders zijn daarna met elkaar hertrouwd, dan is er tweehoofdig ouderlijk gezag


  Regel: Als er een gerechtelijke uitspraak is, en daarna is de minderjarige geadopteerd, dan wordt het gezag bepaald van rechtswege


  Regel: Als er een gerechtelijke uitspraak is dat één ouder of beide ouders gezag hebben, en het ouderschap is ontkend, dan heeft de overgebleven ouder eenhoofdig ouderlijk gezag


  Regel: Als er een gerechtelijke uitspraak is dat één ouder het gezag heeft, dan is er eenhoofdig ouderlijk gezag

    Scenario: het gezag is toegewezen aan één van de twee ouders
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En in een gerechtelijke uitspraak is het gezag toegewezen aan 'Aart'
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Aart'


  Regel: Als er een gerechtelijke uitspraak is dat beide ouders het gezag hebben, dan is er tweehoofdig ouderlijk gezag

    Scenario: het gezag is toegewezen aan beide ouders
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En in een gerechtelijke uitspraak is het gezag toegewezen beide ouders
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' tweehoofdig ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'


  Regel: Als er een gerechtelijke uitspraak is dat een voogd gezag heeft, dan is er sprake is van voogdij

    Scenario: het gezag is toegewezen aan een voogdijinstelling
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En in een gerechtelijke uitspraak is het gezag toegewezen aan een voogdijinstelling
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' voogdij

    Scenario: het gezag is toegewezen aan een derde
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En in een gerechtelijke uitspraak is het gezag toegewezen aan een derde
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' voogdij


  Regel: Als er een gerechtelijke uitspraak is dat één van de ouders gezag heeft samen met een derde, dan is er sprake van gezamenlijk gezag

    Scenario: het gezag is toegewezen aan een van de ouders en een derde
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En in een gerechtelijke uitspraak is het gezag toegewezen aan ouder 'Gerda' en een derde
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk gezag met ouder 'Gerda'



  
