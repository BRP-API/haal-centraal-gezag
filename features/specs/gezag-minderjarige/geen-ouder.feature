# language: nl
Functionaliteit: Geen ouder
  Gezag bepalen voor een minderjarige zonder juridische ouder en nog geen voogdij toegewezen.
  
  Soms komt het voor dat één of beide gezaghouders plotseling wegvallen. Er kan dan een situatie ontstaan dat er geen gezag is over de minderjarige. Deze situatie is altijd tijdelijk.

  Achtergrond:
    Gegeven de persoon 'Bert' met burgerservicenummer '000000048'
    * is minderjarig

  Regel: Als er geen of alleen onbekende ouders zijn, dan is er tijdelijk geen gezag

    Voorbeeld: De ouders zijn onbekend
      Gegeven persoon 'Bert'
      * is met onbekende ouders ingeschreven
      Als gezag wordt gevraagd van 'Bert'
      Dan is er tijdelijk geen gezag over 'Bert' met de toelichting 'Tijdelijk geen gezag omdat beide ouders onbekend zijn'

    Voorbeeld: Er is een onbekende ouder
      Gegeven persoon 'Bert'
      * is als vondeling ingeschreven
      Als gezag wordt gevraagd van 'Bert'
      Dan is er tijdelijk geen gezag over 'Bert' met de toelichting 'Tijdelijk geen gezag omdat beide ouders onbekend zijn'
