# language: nl

Functionaliteit: Gezag bepalen voor een minderjarige zonder juridische ouder en nog geen voogdij toegewezen


    Achtergrond:
      Gegeven de persoon 'Bert' met burgerservicenummer '000000048'
      * is minderjarig


  Regel: Als er geen juridische ouder is en geen gerechtelijke uitspraak dan is er tijdelijk geen gezag

    Scenario: Er is geen juridische ouder en geen gerechtelijke uitspraak over gezag
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is er tijdelijk geen gezag over 'Bert' met de toelichting 'Tijdelijk geen gezag omdat ouders onbekend zijn'
