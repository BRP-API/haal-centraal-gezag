#language: nl

Wat is gezag? 
Iemand die gezag heeft over een kind is verantwoordelijk voor de verzorging en opvoeding van het kind en beheert het geld en de spullen van het kind. 
De gezaghouder is ook de wettelijk vertegenwoor  diger van het kind. Kinderen mogen vaak niet zelf officiële handelingen doen. De wettelijk vertegenwoordiger doet dit dan voor het kind, bijvoorbeeld door een handtekening te zetten.
De wettelijk vertegenwoordiger is ook vaak wettelijk aansprakelijk voor wat het kind doet. Vanaf 14 jaar kan het kind zelf aansprakelijk zijn voor wat hij of zij doet.
Iedereen die 18 jaar of ouder is en niet onder curatele staat of een geestelijke stoornis heeft kan gezag hebben.  
hebben. Het gezag stopt automatisch als het kind 18 jaar wordt. 
Er zijn verschillende soorten gezag:
 • Ouderlijk gezag door één of twee ouders;
 • Gezamenlijk gezag van een ouder en een niet-ouder;
 • Voogdij;
 • Gezamenlijke voogdij

Functionaliteit: Over meerderjarige of overleden personen wordt geen gezag geleverd

    Achtergrond:
    Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is meerderjarig
      * is in Nederland geboren
      * is ingeschreven in de BRP
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000036 |


  Regel: Als de persoon meerderjarig is, dan is er geen sprake van gezag

    Scenario: De persoon is meerderjarig
      Als gezag wordt gevraagd van 'Bert'
      Dan heeft 'Bert' geen gezaghouder


  Regel: Als de persoon overleden is, dan is er geen sprake van gezag

    Scenario: De persoon is overleden
      Gegeven persoon 'Bert'
      * is overleden
      Als gezag wordt gevraagd van 'Bert'
      Dan heeft 'Bert' geen gezaghouder
