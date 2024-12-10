# language: nl

Functionaliteit: Gezag bepalen voor een minderjarige wanneer een of beide ouders niet bevoegd zijn tot gezag
  Een persoon is onbevoegd tot gezag wanneer die:
  - is overleden
  - onder curatele staat
  - is minderjarig


  Achtergrond:
    Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
    * is meerderjarig
    En de persoon 'Aart' met burgerservicenummer '000000024'
    * is meerderjarig
    En de persoon 'Ariana' met burgerservicenummer '000000036'
    * is meerderjarig
    En de persoon 'Bert' met burgerservicenummer '000000048'
    * is minderjarig


  Regel: Er is sprake van eenhoofdig ouderlijk gezag als één van de ouders met tweehoofdig ouderlijk gezag overleden of niet bevoegd is
  
    Scenario: Minderjarige heeft twee ouders en één van de ouders staat onder curatele
      Gegeven 'Gerda' en 'Aart' zijn getrouwd
      En persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En 'Gerda' staat onder curatele
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Aart'


  Regel: Er is tijdelijk geen gezag als beide ouders met tweehoofdig ouderlijk gezag overleden of niet bevoegd zijn
  
    Abstract Scenario: Minderjarige heeft twee ouders en beide ouders staan onder curatele
      Gegeven 'Gerda' en 'Aart' zijn getrouwd
      En persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En 'Gerda' <bevoegdheid Gerda>
      En 'Aart' <bevoegdheid Aart>
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is er tijdelijk geen gezag over 'Bert' met de toelichting '<toelichting>'

      Voorbeelden:
      | bevoegdheid Gerda    | bevoegdheid Aart     | toelichting                                                                                    |
      | is overleden         | is overleden         | Tijdelijk geen gezag omdat beide ouders zijn overleden                                         |
      | staat onder curatele | staat onder curatele | Tijdelijk geen gezag omdat beide ouders onder curate staan                                     |
      | is minderjarig       | is minderjarig       | Tijdelijk geen gezag omdat beide ouders minderjarig zijn                                       |
      | is overleden         | staat onder curatele | Tijdelijk geen gezag omdat een ouder overleden is en de andere ouder onder curate staat        |
      | is overleden         | is minderjarig       | Tijdelijk geen gezag omdat een ouder overleden is en de andere ouder minderjarig is            |
      | staat onder curatele | is minderjarig       | Tijdelijk geen gezag omdat een ouder onder curatele staat is en de andere ouder minderjarig is |
  

  Regel: Er is tijdelijk geen gezag als de ouder met eenhoofdig ouderlijk gezag overleden of niet bevoegd is
  
    Scenario: Minderjarige is erkend voor 1 januari 2023 en de geboortemoeder is overleden
      Gegeven 'Bert' is geboren op 30-11-2022
      * heeft 'Gerda' als ouder op de geboorteakte
      En 'Bert' is erkend door 'Aart' op 29-12-2022
      En 'Gerda' is overleden
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is er tijdelijk geen gezag over 'Bert' met de toelichting 'Tijdelijk geen gezag omdat de ouder overleden is'


  Regel: De partner heeft voogdij als de ouder met gezamenlijk gezag overleden of niet bevoegd is
  
    Scenario: Minderjarige heeft ouder die gehuwd is en de ouder staat onder curatele
      Gegeven 'Gerda' en 'Ariana' zijn een geregistreerd partnerschap aangegaan op 1-3-2010
      En persoon 'Bert'
      * is geboren op 1-1-2012
      * heeft 'Gerda' als ouder
      En 'Gerda' staat onder curatele
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag over 'Bert' voogdij met derde 'Ariana'


  Regel: Er is sprake van voogdij als de ouder met gezamenlijk gezag met een derde overleden of niet bevoegd is

    Scenario: Het gezag is toegewezen aan een van de ouders met een derde en de ouder met gezag is overleden
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * heeft 'Aart' als ouder
      En in een gerechtelijke uitspraak is het gezag toegewezen aan ouder 'Gerda' en een derde
      En 'Gerda' is overleden
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag over 'Bert' voogdij


  Regel: Er is sprake van eenhoofdig ouderlijk gezag als de partner met gezamenlijk gezag overleden of niet bevoegd is

    Scenario: Minderjarige heeft ouder die gehuwd is en de partner staat onder curatele
      Gegeven 'Gerda' en 'Ariana' zijn een geregistreerd partnerschap aangegaan op 1-3-2010
      En persoon 'Bert'
      * is geboren op 1-1-2012
      * heeft 'Gerda' als ouder
      En 'Ariana' staat onder curatele
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is het gezag over 'Bert' eenhoofdig ouderlijk gezag met ouder 'Gerda'


  Regel: Er is tijdelijk geen gezag als de ouder en de partner met gezamenlijk gezag overleden of niet bevoegd zijn

    Scenario: Minderjarige heeft ouder die gehuwd is en zowel de partner als de ouder staan onder curatele
      Gegeven 'Gerda' en 'Ariana' zijn een geregistreerd partnerschap aangegaan op 1-3-2010
      En persoon 'Bert'
      * is geboren op 1-1-2012
      * heeft 'Gerda' als ouder
      En 'Gerda' staat onder curatele
      En 'Ariana' staat onder curatele
      Als gezag wordt gevraagd met het burgerservicenummer van 'Bert'
      Dan is er tijdelijk geen gezag over 'Bert' met de toelichting 'Tijdelijk geen gezag omdat beide ouders onder curate staan'
