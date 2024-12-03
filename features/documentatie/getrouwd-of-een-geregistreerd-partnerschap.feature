# language: nl

Functionaliteit: gezag scenarios bij getrouwd zijn of geregistreerd partnerschap hebben

  Scenario: wanneer een kind geboren is tijdens het huwelijk van twee ouders hebben beide ouders gezag over het kind 
    Gegeven de persoon 'Hendrik' met burgerservicenummer '000000012'
    * is meerderjarig
    En de persoon 'Lisa' met burgerservicenummer '000000024'
    * is meerderjarig
    En 'Hendrik' en 'Lisa' zijn met elkaar gehuwd
    En de persoon 'Yvonne' met burgerservicenummer '000000036'
    * is minderjarige
    * is in Nederland geboren
    * is ingeschreven in de BRP
    * heeft 'Hendrik' als ouder 1
    * heeft 'Lisa' als ouder 2
    Als gezag wordt gezocht met de volgende parameters
    | naam                | waarde    |
    | burgerservicenummer | 000000012 |
    Dan heeft de response een persoon met de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 000000012 |
    En heeft de persoon een 'gezag' met de volgende gegevens
    | naam                             | waarde                    |
    | type                             | TweehoofdigOuderlijkGezag |
    | minderjarige.burgerservicenummer | 000000036                 |
    En heeft 'gezag' een 'ouder' met de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 000000012 |
    En heeft 'gezag' een 'ouder' met de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 000000024 |
    