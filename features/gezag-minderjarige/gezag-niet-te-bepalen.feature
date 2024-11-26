#language: nl

Functionaliteit: Als gebruiker wil ik alleen een gezaguitspraak krijgen wanneer die met zekerheid te bepalen is

  Gezag is alleen met zekerheid te bepalen wanneer het gezag van de minderjarige onder Nederlands recht wordt bepaald.

  Wanneer een minderjarige verhuist naar een ander land, neemt deze het gezag mee naar het nieuwe land.
  Daarom is het gezag niet te bepalen van een minderjarige die uit een ander land is geimmigreerd.
  Bij de Nederlandse overheid is niet bekend welk gezag de minderjarige uit het buitenland heeft meegenomen.


    Achtergrond:
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd


  Regel: Gezag is niet te bepalen als de minderjarige in het RNI staat ingeschreven

    Scenario: Minderjarige verblijft in het buitenland
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in de RNI
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                            |
      | type        | GezagNietTeBepalen                                                                |
      | toelichting | gezag is niet te bepalen omdat minderjarige niet of tijdelijk in Nederland woont. |

    Scenario: Minderjarige verblijft tijdelijk in Nederland
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in de RNI
      # En heeft een tijdelijk verblijfsadres in Nederland
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                            |
      | type        | GezagNietTeBepalen                                                                |
      | toelichting | gezag is niet te bepalen omdat minderjarige niet of tijdelijk in Nederland woont. |

    Scenario: Verblijfplaats van minderjarige is onbekend
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in de RNI
      # heeft een volledig onbekende verblijfplaats
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                            |
      | type        | GezagNietTeBepalen                                                                |
      | toelichting | gezag is niet te bepalen omdat minderjarige niet of tijdelijk in Nederland woont. |

  
  Regel: Gezag is niet te bepalen als is vastgesteld dat de minderjarige niet meer op het geregistreerde adres woont, dan is het gezag niet te bepalen

    Scenario: Er is vastgesteld dat de minderjarige niet meer op het adres verblijft
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in de BRP
      En er loopt onderzoek waarin is vastgesteld dat de minderjarige niet op het adres verblijft
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                                 |
      | type        | GezagNietTeBepalen                                                                                     |
      | toelichting | gezag is niet te bepalen omdat is vastgesteld dat minderjarige niet op het geregistreerde adres woont. |


  Regel: Gezag is niet te bepalen als de meest recente gebeurtenis voor gezag vestiging van minderjarige in Nederland vanuit het buitenland is

    Scenario: Minderjarige is geïmmigreerd naar Nederland
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is minderjarig
      * is ingeschreven in de RNI
      En is op 15-5-2014 geïmmigreerd 
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                        |
      | type        | GezagNietTeBepalen                                                            |
      | toelichting | gezag is niet te bepalen omdat minderjarige buiten Nederland heeft verbleven. |


  Regel: Gezag kan worden bepaald als de meest recente gebeurtenis voor gezag adoptie van de minderjarige met Nederlandse akte is


  Regel: Gezag kan worden bepaald als de meest recente gebeurtenis voor gezag een gerechtelijke uitspraak over het gezag van minderjarige is
