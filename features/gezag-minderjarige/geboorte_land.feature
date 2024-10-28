#language: nl

Functionaliteit: geboren in buitenland en niet geadopteerd

  Scenario: geboren in buitenland
    Gegeven adres 'A1' heeft de volgende gegevens
    | gemeentecode (92.10) | straatnaam (11.10) | huisnummer (11.20) | identificatiecode nummeraanduiding (11.90) |
    | 518                  | Turfmarkt          | 1                  | 0518200000583526                           |
   
    # ouder 1
    Gegeven de persoon met burgerservicenummer '000000012' heeft de volgende gegevens
    | naam                            | waarde     |
    | geslachtsnaam (02.40)           | Adema      |
    | geboortedatum (03.10)           | 19820101   |
    En de persoon heeft een 'partner' met de volgende gegevens
    | naam                                                                | waarde     |
    | burgerservicenummer (01.20)                                         | 000000024  |
    | geslachtsnaam (02.40)                                               | Arendsen   |
    | geboortedatum (03.10)                                               | 19810101   |
    | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10)  | 20141201   |
    | plaats huwelijkssluiting/aangaan geregistreerd partnerschap (06.20) | 0518       |
    | land huwelijkssluiting/aangaan geregistreerd partnerschap (06.30)   | 6030       |
    En de persoon heeft een 'kind' met de volgende gegevens
    | naam                            | waarde     |
    | burgerservicenummer (01.20)     | 000000036  |
    | geslachtsnaam (02.40)           | Arendsen   |
    | geboortedatum (03.10)           | 20151201   |
    | geboorteland (03.30)            | 6043       |
    | aktenummer (81.20)              | 3GB0105    |
    
    #ouder 2
    Gegeven de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
    | naam                            | waarde     |
    | geslachtsnaam (02.40)           | Arendsen   |
    | geboortedatum (03.10)           | 19810101   |
    En de persoon heeft een 'partner' met de volgende gegevens
    | naam                                                                | waarde     |
    | burgerservicenummer (01.20)                                         | 000000012  |
    | geslachtsnaam (02.40)                                               | Adema      |
    | geboortedatum (03.10)                                               | 19820101   |
    | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10)  | 20141201   |
    | plaats huwelijkssluiting/aangaan geregistreerd partnerschap (06.20) | 0518       |
    | land huwelijkssluiting/aangaan geregistreerd partnerschap (06.30)   | 6030       |
    En de persoon heeft een 'kind' met de volgende gegevens
    | naam                            | waarde     |
    | burgerservicenummer (01.20)     | 000000036  |
    | geslachtsnaam (02.40)           | Arendsen   |
    | geboortedatum (03.10)           | 20151201   |
    | geboorteland (03.30)            | 6043       |
    | aktenummer (81.20)              | 3GB0105    |
    
    # minderjarige
    Gegeven de persoon met burgerservicenummer '000000036' heeft de volgende gegevens
    | naam                            | waarde     |
    | geslachtsnaam (02.40)           | Arendsen   |
    | geboortedatum (03.10)           | 20151201   |
    | geboorteland (03.30)            | 6043       |
    | aktenummer (81.20)              | 3GB0105    |
    En de persoon heeft een ouder '1' met de volgende gegevens
    | naam                                               | waarde     |
    | burgerservicenummer (01.20)                        | 000000012  |
    | geslachtsnaam (02.40)                              | Adema      |
    | aktenummer (81.20)                                 | 3GB0105    |
    | datum ingang familierechtelijke betrekking (62.10) | 20151201   |
    En de persoon heeft een ouder '2' met de volgende gegevens
    | naam                                               | waarde     |
    | burgerservicenummer (01.20)                        | 000000024  |
    | geslachtsnaam (02.40)                              | Arendsen   |
    | aktenummer (81.20)                                 | 3GB0105    |
    | datum ingang familierechtelijke betrekking (62.10) | 20151201   |
    En de persoon is ingeschreven op adres 'A1' met de volgende gegevens
    | naam                              | waarde   |
    | gemeente van inschrijving (09.10) | 518      |

    Als gezag wordt gezocht met de volgende parameters
    | naam                 | waarde    |
    | burgerservicenummer  | 000000036 |
    Dan heeft de response een persoon met de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 000000036 |
    En heeft de persoon een 'gezag' met de volgende gegevens
    | naam        | waarde                                                                                                               |
    | type        | GezagNietTeBepalen                                                                                                   |
    | toelichting | gezag is niet te bepalen omdat minderjarige in het buitenland is geboren en geen Nederlandse adoptie-akte bekend is. |
