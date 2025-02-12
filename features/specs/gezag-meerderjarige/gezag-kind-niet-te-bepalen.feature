# language: nl
Functionaliteit: gezag van een meerderjarige over een kind wanneer gezag niet te bepalen is

  Regel: een meerderjarige krijgt voor een minderjarig kind waarvoor het gezag niet bepaald kan worden geen gezagsrelatie geleverd

    Scenario: persoon heeft een minderjarig kind waarover het gezag niet bepaald kan worden
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is ingeschreven in de BRP
      * is meerderjarig
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is minderjarig
      * is in Nederland geboren
      * is geëmigreerd geweest
      * heeft 'Gerda' als ouder 1
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
      En heeft de persoon geen gezag

    Scenario: persoon heeft een minderjarig kind waarover het gezag niet bepaald kan worden maar andere kinderen waarvoor gezag wel bepaald kan worden
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is ingeschreven in de BRP
      * is meerderjarig
      En de persoon 'Bert' met burgerservicenummer '000000036'
      * is ingeschreven in de BRP
      * is minderjarig
      * is in Nederland geboren
      * is geëmigreerd geweest
      * heeft 'Gerda' als ouder 1
      En de persoon 'Randy' met burgerservicenummer '000000042'
      * is ingeschreven in de BRP
      * is minderjarig
      * is in Nederland geboren
      * heeft 'Gerda' als ouder 1
      En de persoon 'Vincent' met burgerservicenummer '000000064'
      * is ingeschreven in de BRP
      * is minderjarig
      * is in Nederland geboren
      * heeft 'Gerda' als ouder 1
      Als gezag wordt gezocht met de volgende parameters
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
      Dan heeft de response een persoon met de volgende gegevens
        | naam                | waarde    |
        | burgerservicenummer | 000000012 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | EenhoofdigOuderlijkGezag  |
      | minderjarige.burgerservicenummer | 000000064                 |
      | ouder.burgerservicenummer        | 000000012                 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | EenhoofdigOuderlijkGezag  |
      | minderjarige.burgerservicenummer | 000000042                 |
      | ouder.burgerservicenummer        | 000000012                 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                                                                         |
      | type                             | GezagNietTeBepalen                                                             |
      | minderjarige.burgerservicenummer | 000000036                                                                      |
      | toelichting                      | gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven.  |