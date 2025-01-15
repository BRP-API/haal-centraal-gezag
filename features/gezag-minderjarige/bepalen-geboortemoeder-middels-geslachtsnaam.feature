#language: nl

Functionaliteit: Wie is de geboortemoeder van het kind?

  Er zijn situaties waar voor het kind twee personen als ouder geregistreerd zijn, maar het onbekend is wie de moeder van het kind is.
  Bij gezag bepaling is het belangrijk om te weten wie de moeder is, gezien deze normaal gezien automatisch het gezag over het kind krijgt bij de geboorte.

  Om vast te stellen wie de geboortemoeder wordt de geslachtsaanduiding gecontrolleerd.
  Met geslachtsaanduiding is onderscheid te maken tussen man en vrouw.
  Wat betekend in de situaties waarbij de ouders man en vrouw zijn, duidelijk is wie de geboortemoeder is. 

  Voor de situatie met een mee-moeder, waarbij dus beide ouders vrouw zijn kan gekeken worden naar de geslachtsnaam van het kind.
  Wanneer de geslachtsnaam van het kind overeenkomt met één van de vrouwen (ouders) is dat de geboortemoeder.
  Dit kan alleen gedaan worden als de vrouwen niet zijn gehuwd. 
  Wanneer de vrouwen gehuwd zijn kan de geslachtsnaam van de partner worden overgenomen en kan dus niet meer worden uitgegaan van de overeenkomst van de geslachtsnaam met kind.

  Bij de situatie dat beide ouders man zijn, is de geboortemoeder niet te achterhalen.

  Achtergrond:
    Gegeven de persoon 'Noah' met burgerservicenummer '000000012'
    * is meerderjarig
    * heeft de volgende gegevens
    | geslachtsaanduiding (04.10)     |
    | V                               |  
    En de persoon 'Marijn' met burgerservicenummer '000000024'
    * is meerderjarig
    * heeft de volgende gegevens
    | geslachtsaanduiding (04.10)     |
    | V                               |
    En de persoon 'Vanessa' met burgerservicenummer '000000036'
    * is minderjarig
    * is in Nederland geboren
    * is ingeschreven in de BRP

  Regel: een kind geboren voor 01-01-2023
    
    Scenario: Wanneer de ouders gehuwd zijn is er sprake van TweehoofdigOuderlijkGezag
      Gegeven persoon 'Vanessa'
      * heeft 'Noah' als ouder 1
      * heeft 'Marijn' als ouder 2
      En 'Noah' en 'Marijn' zijn met elkaar gehuwd
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
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
    
    Scenario: Wanneer een van de ouders het kind heeft erkend, is er sprake van EenhoofdigOuderlijkGezag
      Gegeven persoon 'Vanessa'
      * heeft 'Noah' als ouder 1
      En is erkend door 'Marijn' als ouder 2 met erkenning bij geboorteaangifte
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | EenhoofdigOuderlijkGezag  |
      | minderjarige.burgerservicenummer | 000000036                 |
      | ouder.burgerservicenummer        | 000000012                 |

    Scenario: Wanneer de ouders niet gehuwd zijn, geen van de ouders het kind heeft erkend en de ouders niet dezelfde geslachtsnaam hebben kan op basis van geslachtsnaam de geboortemoeder worden bepaald, er is sprake van EenhoofdigOuderlijkGezag
      Gegeven persoon 'Vanessa'
      * heeft de volgende gegevens
      | geslachtsnaam (02.40) |
      | Visser                |
      * heeft 'Noah' als ouder 1 met de volgende gegevens
      | geslachtsaanduiding (04.10)     | geslachtsnaam (02.40) | datum ingang familierechtelijke betrekking (62.10)  |
      | V                               | Visser                | gisteren - 17 jaar                                  |
      * heeft 'Marijn' als ouder 2 met de volgende gegevens    
      | geslachtsaanduiding (04.10)     | geslachtsnaam (02.40) | datum ingang familierechtelijke betrekking (62.10)  |
      | V                               | Moulker               | gisteren - 17 jaar                                  |   
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | EenhoofdigOuderlijkGezag  |
      | minderjarige.burgerservicenummer | 000000036                 |
      | ouder.burgerservicenummer        | 000000012                 |

    Scenario: Wanneer de ouders niet gehuwd zijn, geen van de ouders het kind heeft erkend en de ouders dezelfde geslachtsnaam hebben kan de geboortemoeder niet op basis van geslachtsnaam worden bepaald, er is sprake van GezagNietTeBepalen
      Gegeven persoon 'Vanessa'
      * heeft de volgende gegevens
      | geslachtsnaam (02.40) |
      | Visser                |
      * heeft 'Noah' als ouder 1 met de volgende gegevens
      | geslachtsaanduiding (04.10)     | geslachtsnaam (02.40) | datum ingang familierechtelijke betrekking (62.10)  |
      | V                               | Visser                | gisteren - 17 jaar                                  |
      * heeft 'Marijn' als ouder 2 met de volgende gegevens    
      | geslachtsaanduiding (04.10)     | geslachtsnaam (02.40) | datum ingang familierechtelijke betrekking (62.10)  |
      | V                               | Visser                | gisteren - 17 jaar                                  |
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                                                                                                                                                                                 |
      | type                             | GezagNietTeBepalen                                                                                                                                                                     |
      | minderjarige.burgerservicenummer | 000000036                                                                                                                                                                              |
      | toelichting                      | gezag kan niet worden bepaald omdat bij het bepalen van erkenning relevante gegevens ontbreken. Het gaat om de volgende gegevens: Geboortemoeder van bevraagde persoon niet te bepalen |
