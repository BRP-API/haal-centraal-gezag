# language: nl
Functionaliteit: gedeeltelijke gezag bepaling
  
  Het kan voorkomen dat bij een gezagsbepaling gegevens van één van de ouders onvolledig of niet bekend is.
  In deze gevallen is het belangrijk dat nog steeds voor de andere ouder, waarvan wel alle benodigde gegevens beschikbaar zijn, 
  gezag kan worden bepaald. Dit zowel vanuit het perspectief van deze ouder als vanuit het perspectief van het kind.

  In deze gevallen kan de gezagsbepaling deels worden geleverd.

      Achtergrond:
        Gegeven de persoon 'Pieternella' met burgerservicenummer '000000012'
        * is ingeschreven in de BRP
        * is meerderjarig
        En de persoon 'Leenderd' met burgerservicenummer '000000024'
        * is ingeschreven in de BRP
        * is meerderjarig
        En de persoon 'Marcella' met burgerservicenummer '000000036'
        * is in Nederland geboren
        * is ingeschreven in de BRP
        * is pas geboren
        * heeft 'Pieternella' als ouder 1

  Regel: een meerderjarige die gezag heeft over een minderjarig samen met een ouder waarvan niet alle benodigde gegevens bekend zijn wordt gezag geleverd


# gezag is niet te bepalen omdat de volgende relevante gegevens ontbreken: ouder1 van bevraagde persoon is niet in BRP geregistreerd
# gezag is niet te bepalen omdat de volgende relevante gegevens ontbreken: ouder2 van bevraagde persoon is niet in BRP geregistreerd
# gezag is niet te bepalen omdat één of meer ouders van minderjarige onbekend is.
# gezag is niet te bepalen omdat bij het bepalen van huwelijk/partnerschap van de ouder(s) relevante gegevens ontbreken. Het gaat om de volgende gegevens: ouder1 van bevraagde persoon is niet in BRP geregistreerd 
# gezag is niet te bepalen omdat bij het bepalen van huwelijk/partnerschap van de ouder(s) relevante gegevens ontbreken. Het gaat om de volgende gegevens: ouder2 van bevraagde persoon is niet in BRP geregistreerd 
# Voor de bevraagde persoon moet minimaal 1 ouder geregistreerd staan in BRP
# Minimaal 1 ouder van de bevraagde persoon moet geregistreerd staan in het BRP - LET OP, is anders dan die hierboven
# preconditieCheckOudersGeregistreerd: Van de bevraagde persoon zijn geen twee ouders bekend
# preconditieCheckGeregistreerd: ouder1/ouder2 van bevraagde persoon is niet in BRP geregistreerd
# datum ingang familiebetrekking van ouder 1
# datum ingang familiebetrekking van ouder 2
# op persoonslijst ouder: burgerservicenummer, geboortedatum
# preconditie voor erkenning: beide ouders van bevraagde persoon mist / een ouder van bevraagde persoon mist
# Voor de bevraagde persoon moet niet_ouder geregistreerd staan in BRP
# Ouder moet een BSN hebben


# voor uit denkend, wat als een naam veld of meerdere naamvelden mist? ivm. leveren naam van persoon bij geen burgerservicenummer

