#language: nl

Functionaliteit: Als gebruiker wil ik alleen een gezaguitspraak over minderjarige en levende personen


  Regel: Als de persoon meerderjarig is, dan is er geen sprake van gezag

    Scenario: De persoon is meerderjarig
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is meerderjarig
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon geen gezag


  Regel: Als de persoon overleden is, dan is er geen sprake van gezag

    Scenario: De persoon is overleden
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is overleden
      Als gezag wordt gezocht met de volgende parameters
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      Dan heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000036 |
      En heeft de persoon geen gezag
