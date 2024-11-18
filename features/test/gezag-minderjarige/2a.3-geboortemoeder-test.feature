#language: nl

Functionaliteit: Als API tester wil ik controleren dat regel "2a.3 - bepalen geboortemoeder bij 1-hoofdig ouderlijk gezag" correct werkt
  Precondities voor deze vraag:
  | 1.1 Staat persoon (minderjarige) als ingezetene in de BRP?             | Ja                                                                                 |
  | 1.2 Is persoon a. minderjarig en b. niet overleden?                    | Ja                                                                                 |
  | 1.3 Is minderjarige naar het buitenland geëmigreerd geweest?           | Nee                                                                                |
  | 1.3a Is minderjarige in buitenland geboren?                            | Nee of geadopteerd met NL akte                                                     |
  | 1.4 Uitspraak gezag aanwezig?                                          | Nee of door een recente gebeurtenis het gezag toch (weer) van rechtswege verkregen |
  | 2.1 Hoeveel juridische ouders heeft de minderjarige?                   | 2                                                                                  |
  | 2a.1 Zijn beide ouders nu met elkaar gehuwd of geregistreerd partners? | Nee, na geboorte kind nooit gehuwd/partners geweest (met elkaar)                   |
  | 2a.2 Is persoon geadopteerd met Nederlandse akte                       | Nee                                                                                |
  | 2.3 Erkenning voor of na 1-1-2023?                                     | Vóór 1-1-2023                                                                      |

  Bij deze uitkomst heeft de geboortemoeder gezag. Dus moet bepaald worden welke van de ouder de geboortemoeder is.

  Gebruikte velden:
  - Aktenummer ouder 1 -> 02.81.20
  - Aktenummer ouder 2 -> 03.81.20
  - Datum familierechtelijke betrekking ouder 1 -> 02.62.10
  - Datum familierechtelijke betrekking ouder 2 -> 03.62.10


    Achtergrond:
      Gegeven de persoon 'Lotte' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Dirk' met burgerservicenummer '000000024'
      * is meerderjarig
      En de persoon 'Filip' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is geboren op 3-1-2019
      * is ingeschreven in de BRP

  Regel: Wanneer één van de twee ouders op de geboorteakte staat en de andere ouder stond niet op de geboorteakte, dan is de ouder op de geboorteakte de geboortemoeder
    Dit is het geval wanneer aktenummer op de categorie ouder 1 of ouder 2 op de 1e positie een "1" heeft en op de derde positie een "A".

    Abstract Scenario: De geboortemoeder bij erkenning van minderjarige door <omschrijving>
      Gegeven persoon 'Filip'
      * heeft persoon 'Lotte' als ouder 1 met aktenummer '<aktenummer ouder 1>' op <datum ouder 1>
      * heeft persoon 'Dirk' als ouder 2 met aktenummer '<aktenummer ouder 2>' op <datum ouder 2>
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
      | ouder.burgerservicenummer        | <gezaghebbende>           |

      Voorbeelden:
      | aktenummer ouder 1 | aktenummer ouder 2 | datum ouder 1 | datum ouder 2 | omschrijving                                                             | gezaghebbende |
      | 1JA0001            | 1XB0001            | 3-1-2019      | 3-1-2019      | ouder 1 op de geboorteakte en ouder 2 bij geboorte                       | 000000012     |
      | 1ZB0001            | 1XA0001            | 3-1-2019      | 3-1-2019      | ouder 1 bij geboorte en ouder 2 op de geboorteakte                       | 000000024     |
      | 1NA0001            | 1XJ0001            | 3-1-2019      | 3-1-2019      | ouder 1 op de geboorteakte en ouder 2 bij notariele akte op dezelfde dag | 000000012     |
      | 1NJ0001            | 1XA0001            | 3-1-2019      | 3-1-2019      | ouder 2 op de geboorteakte en ouder 1 bij notariele akte op dezelfde dag | 000000024     |


  Regel: wanneer geen van de ouders op de geboorteakte stond, dan is ouder 2 de geboortemoeder
    # Ik denk dat deze regel niet correct is.
    # Maar het is de vraag of dit voor kan komen. Staat niet altijd ten minste de geboortemoeder op de geboorteakte?
    # Of is deze situatie wel mogelijk (bijvoorbeeld vondeling die later toch erkend wordt door een ouder)?

    Abstract Scenario: De geboortemoeder bij erkenning van minderjarige door <omschrijving>
      Gegeven persoon 'Filip'
      * heeft persoon 'Lotte' als ouder 1 met aktenummer '<aktenummer ouder 1>' op <datum ouder 1>
      * heeft persoon 'Dirk' als ouder 2 met aktenummer '<aktenummer ouder 2>' op <datum ouder 2>
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
      | ouder.burgerservicenummer        | <gezaghebbende>           |

      Voorbeelden:
      | aktenummer ouder 1 | aktenummer ouder 2 | datum ouder 1 | datum ouder 2 | omschrijving                                                             | gezaghebbende |
      | 1NC0001            | 1XB0001            | 4-1-2019      | 3-1-2019      | ouder 1 na geboorte en ouder 2 bij geboorte                              | 000000024     |
      | 1NB0001            | 1XC0001            | 3-1-2019      | 4-1-2019      | ouder 1 bij geboorte en ouder 2 na geboorte                              | 000000024     |
      | 1NC0001            | 1XC0001            | 4-1-2019      | 5-1-2019      | ouder 1 en ouder 2 na geboorte, maar ouder 1 eerder                      | 000000024     |
      | 1NC0001            | 1XC0001            | 5-1-2019      | 4-1-2019      | ouder 1 en ouder 2 na geboorte, maar ouder 2 eerder                      | 000000024     |
      | 1NC0001            | 1XC0001            | 5-1-2019      | 5-1-2019      | ouder 1 en ouder 2 na geboorte, op zelfde dag                            | 000000024     |


  Regel: Wanneer beide ouders op de geboorteakte staan, is niet te bepalen welke van deze ouders de geboortemoeder is

    Abstract Scenario: De geboortemoeder kan niet bepaald worden bij erkenning van minderjarige door <omschrijving>
      Gegeven persoon 'Filip'
      * heeft persoon 'Lotte' als ouder 1 met aktenummer '<aktenummer ouder 1>' op <datum ouder 1>
      * heeft persoon 'Dirk' als ouder 2 met aktenummer '<aktenummer ouder 2>' op <datum ouder 2>
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam        | waarde                                                                                            |
      | type        | GezagNietTeBepalen                                                                                |
      | toelichting | gezag kan niet worden bepaald omdat niet kan worden vastgesteld welke ouder de geboortemoeder is. |

      Voorbeelden:
      | aktenummer ouder 1 | aktenummer ouder 2 | datum ouder 1 | datum ouder 2 | omschrijving                          |
      | 1JA0001            | 1JA0001            | 3-1-2019      | 3-1-2019      | ouder 1 en ouder 2 op de geboorteakte |
