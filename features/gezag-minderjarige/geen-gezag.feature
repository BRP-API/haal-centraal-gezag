#language: nl

Functionaliteit: Over meerderjarige of overleden personen wordt geen gezag geleverd


  Regel: Als de persoon meerderjarig is, dan is er geen sprake van gezag

    Scenario: De persoon is meerderjarig
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is meerderjarig
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan heeft deze persoon geen gezaghouder


  Regel: Als de persoon overleden is, dan is er geen sprake van gezag

    Scenario: De persoon is overleden
      Gegeven de persoon 'Bert' met burgerservicenummer '000000036'
      * is overleden
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan heeft deze persoon geen gezaghouder
