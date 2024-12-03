#language: nl

Functionaliteit: Gezag niet te bepalen wanneer gegeven in onderzoek dat gebruikt wordt bij gezagbepaling vraag 1.2

    Achtergrond:
      Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
      * is meerderjarig
      En de persoon 'Aart' met burgerservicenummer '000000024'
      * is meerderjarig


  Regel: Gezag is niet te bepalen bij geboortedatum in onderzoek

    Abstract Scenario: persoon <meerderjarigheid> en <omschrijving> staat in onderzoek
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * <meerderjarigheid>
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * er loopt onderzoek naar de persoon gegevens met aanduiding '<aanduiding>'
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon een 'gezag' met de volgende gegevens
      | naam                             | waarde                    |
      | type                             | GezagNietTeBepalen |
      #| minderjarige.burgerservicenummer | 000000036                 |
      | toelichting | Gezag is niet te bepalen, omdat de volgende relevante gegevens in onderzoek staan. <toelichting>.|

      Voorbeelden:
      | aanduiding | omschrijving      | toelichting                                                                    | meerderjarigheid |
      | 010310     | geboortedatum     | Persoonslijst van persoon: geboortedatum van persoon                           | is minderjarig   |
      | 010300     | groep geboorte    | Persoonslijst van persoon: geboortedatum van persoon, geboorteland van persoon | is minderjarig   |
      | 010000     | categorie persoon | Persoonslijst van persoon: persoon                                             | is minderjarig   |
      | 010310     | geboortedatum     | Persoonslijst van persoon: geboortedatum van persoon                           | is meerderjarig  |
      | 010300     | groep geboorte    | Persoonslijst van persoon: geboortedatum van persoon                           | is meerderjarig  |
      | 010000     | categorie persoon | Persoonslijst van persoon: persoon                                             | is meerderjarig  |

    Abstract Scenario: <omschrijving> van minderjarige staat in onderzoek (dit gegeven wordt niet gebruikt)
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is minderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * er loopt onderzoek naar de persoon gegevens met aanduiding '<aanduiding>'
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd
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

      Voorbeelden:
      | aanduiding | omschrijving           |
      | 010200     | groep naam             |
      | 010210     | voornamen              |
      | 010220     | titel predicaat        |
      | 010230     | voorvoegsel            |
      | 010240     | geslachtsnaam          |
      | 010320     | geboorteplaats         |
      | 010410     | geslacht               |
      | 016110     | aanduiding naamgebruik |

    Abstract Scenario: <omschrijving> van meerderjarige staat in onderzoek (dit gegeven wordt niet gebruikt)
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * is meerderjarig
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * er loopt onderzoek naar de persoon gegevens met aanduiding '<aanduiding>'
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon geen gezag

      Voorbeelden:
      | aanduiding | omschrijving           |
      | 010200     | groep naam             |
      | 010210     | voornamen              |
      | 010220     | titel predicaat        |
      | 010230     | voorvoegsel            |
      | 010240     | geslachtsnaam          |
      | 010320     | geboorteplaats         |
      | 010330     | geboorteland           |
      | 010410     | geslacht               |
      | 016110     | aanduiding naamgebruik |


  Regel: Gezag is wel te bepalen bij overlijden in onderzoek

    Abstract Scenario: persoon <meerderjarigheid> en is overleden en <omschrijving> staat in onderzoek
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * <meerderjarigheid>
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * is overleden
      * er loopt onderzoek naar de <categorie> gegevens met aanduiding '<aanduiding>'
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon geen gezag

      Voorbeelden:
      | categorie  | aanduiding | omschrijving         | meerderjarigheid |
      | overlijden | 060810     | datum overlijden     | is minderjarig   |
      | overlijden | 060820     | plaats overlijden    | is minderjarig   |
      | overlijden | 060830     | land overlijden      | is minderjarig   |
      | overlijden | 060800     | groep overlijden     | is minderjarig   |
      | overlijden | 060000     | categorie overlijden | is minderjarig   |
      | overlijden | 060810     | datum overlijden     | is meerderjarig  |
      | overlijden | 060820     | plaats overlijden    | is meerderjarig  |
      | overlijden | 060830     | land overlijden      | is meerderjarig  |
      | overlijden | 060800     | groep overlijden     | is meerderjarig  |
      | overlijden | 060000     | categorie overlijden | is meerderjarig  |


  Regel: Gezag is wel te bepalen bij geboortedatum in onderzoek wanneer de minderjarige overleden is
    # Deze regel is nu niet geïmplementeerd. Het scenario faalt.
    # De gezag api past nu regel "Gezag is niet te bepalen bij geboortedatum in onderzoek" toe

    Abstract Scenario: persoon <meerderjarigheid> en is overleden en <omschrijving> staat in onderzoek
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is in Nederland geboren
      * <meerderjarigheid>
      * heeft 'Gerda' als ouder 1
      * heeft 'Aart' als ouder 2
      * is ingeschreven in de BRP
      * is overleden
      * er loopt onderzoek naar de <categorie> gegevens met aanduiding '<aanduiding>'
      En 'Gerda' en 'Aart' zijn met elkaar gehuwd
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon geen gezag

      Voorbeelden:
      | categorie  | aanduiding | omschrijving         | meerderjarigheid |
      | persoon    | 010310     | geboortedatum        | is minderjarig   |
      | persoon    | 010000     | categorie persoon    | is minderjarig   |
      | persoon    | 010310     | geboortedatum        | is meerderjarig  |
      | persoon    | 010000     | categorie persoon    | is meerderjarig  |
