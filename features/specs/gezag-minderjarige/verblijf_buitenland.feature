# language: nl
Functionaliteit: Gezag bepalen voor personen die in het buitenland verblijven of daar verbleven hebben

  Achtergrond:
    Gegeven de persoon 'Gerda' met burgerservicenummer '000000012'
    * is meerderjarig
    En de persoon 'Aart' met burgerservicenummer '000000024'
    * is meerderjarig
    En de persoon 'Bert' met burgerservicenummer '000000036'
    * is minderjarig

  Regel: Het gezag kan niet worden bepaald voor een minderjarige die nooit een vaste verblijfplaats in Nederland heeft gehad

    Voorbeeld: Minderjarige staat ingeschreven als niet-ingezetene en is nooit ingezetene van Nederland geweest
      Gegeven persoon 'Bert'
      * is ingeschreven als niet-ingezetene met een verblijfplaats in België
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'Gezag is niet te bepalen omdat minderjarige niet in Nederland woont.'

  Regel: Een minderjarige die ooit Nederland als vaste verblijfplaats heeft gehad en twee ouders heeft die met elkaar gehuwd zijn, heeft gezamenlijk ouderlijk gezag
    Voorwaarde is dat de ouders nu met elkaar gehuwd zijn of op of na de geboortedatum van minderjarige met elkaar gehuwd waren
    # Wat als een van de ouders niet in BRP of RNI staat, dus geen bsn heeft? Mag je dan identificeren op geslachtsnaam en geboortedatum?

    Voorbeeld: minderjarige is in het buitenland geboren en heeft twee ouders die met elkaar gehuwd zijn
      Gegeven 'Gerda' en 'Aart' zijn met elkaar gehuwd
      En persoon 'Bert'
      * heeft 'Aart' en 'Gerda' als ouders
      * is geboren in Duitsland
      * is op 30-11-2022 geïmmigreerd
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: minderjarige is in het buitenland geboren en heeft twee ouders die met elkaar gehuwd waren
      Gegeven 'Gerda' en 'Aart' zijn met elkaar gehuwd
      En 'Gerda' en 'Bert' zijn 12 jaar geleden gescheiden
      En persoon 'Bert'
      * heeft 'Aart' en 'Gerda' als ouders
      * is 15 jaar geleden geboren
      * is geboren in Duitsland
      * is op 30-11-2022 geïmmigreerd
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: minderjarige heeft in het buitenland verbleven en heeft twee ouders die met elkaar gehuwd zijn
      Gegeven 'Gerda' en 'Aart' zijn met elkaar gehuwd
      En persoon 'Bert'
      * heeft 'Aart' en 'Gerda' als ouders
      * is geboren in Nederland
      En 'Bert' is 10 jaar geleden geëmigreerd naar Duitsland
      En is op 30-11-2022 geïmmigreerd
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: minderjarige is geëmigreerd naar het buitenland en heeft twee ouders die met elkaar gehuwd waren
      Gegeven 'Gerda' en 'Aart' zijn met elkaar gehuwd
      En 'Gerda' en 'Bert' zijn 12 jaar geleden gescheiden
      En persoon 'Bert'
      * heeft 'Aart' en 'Gerda' als ouders
      * is 15 jaar geleden geboren
      * is geboren in Nederland
      En 'Bert' is 10 jaar geleden geëmigreerd naar Duitsland
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

  Regel: Een minderjarige die ooit Nederland als vaste verblijfplaats heeft gehad en twee ouders heeft en minderjarige is na 1-1-2023 geboren, erkend of geïmmigreerd heeft gezamenlijk ouderlijk gezag
    De meest recente datum van geboortedatum, erkenning (indien van toepassing) en immigratie in Nederland (indien van toepassing) geldt

    Voorbeeld: ouders van minderjarige waren nooit met elkaar gehuwd en minderjarige is geboren na 1-1-2023 en daarna geëmigreerd
      Gegeven persoon 'Bert'
      * heeft 'Aart' en 'Gerda' als ouders
      * is geboren op 6-1-2023
      En 'Bert' is 1 jaar geleden geëmmigreerd naar Duitsland
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: ouders van minderjarige waren nooit met elkaar gehuwd en minderjarige is erkend na 1-1-2023 en daarna geëmigreerd
      Gegeven persoon 'Bert'
      * heeft 'Gerda' als ouder
      * is geboren op 14-10-2019
      En 'Bert' is erkend door 'Aart' op 6-1-2023
      En 'Bert' is 1 jaar geleden geëmmigreerd naar Duitsland
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: ouders van minderjarige waren nooit met elkaar gehuwd en minderjarige is geïmmigreerd na 1-1-2023
      Gegeven persoon 'Bert'
      * heeft 'Aart' en 'Gerda' als ouders
      * is geboren in Duitsland
      * is geboren op 14-10-2019
      * is op 6-1-2023 geïmmigreerd
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: ouders van minderjarige waren nooit met elkaar gehuwd en minderjarige is na 1-1-2023 geremigreerd naar Nederland
      Gegeven persoon 'Bert'
      * heeft 'Aart' en 'Gerda' als ouders
      * is geboren op 14-10-2019
      En 'Bert' is 5 jaar geleden geëmmigreerd naar Duitsland
      * is op 6-1-2023 geïmmigreerd
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

  Regel: Een minderjarige die met een Nederlandse akte is geadopteerd en twee ouders heeft heeft gezamenlijk ouderlijk gezag

    Voorbeeld: minderjarige is geboren in het buitenland en in Nederland geadopteerd
      Gegeven persoon 'Bert'
      * is geboren op 14-10-2019
      * is geboren in Duitsland
      En is op 29-11-2019 geïmmigreerd
      En 'Bert' is op 30-11-2019 geadopteerd door 'Gerda' en 'Aart'
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' gezamenlijk ouderlijk gezag met ouder 'Gerda' en ouder 'Aart'

    Voorbeeld: minderjarige is geboren in het buitenland en in het buitenland geadopteerd door ongehuwde ouders
      Gegeven persoon 'Bert'
      * is geboren op 14-10-2019
      * is geboren in Duitsland
      En is op 29-11-2019 geïmmigreerd
      En 'Bert' is in het buitenland geadopteerd door 'Gerda' en 'Aart' op 30-11-2019
      Als gezag wordt gevraagd van 'Bert'
      Dan is het gezag over 'Bert' niet te bepalen met de toelichting 'gezag is niet te bepalen omdat minderjarige in het buitenland is geboren.'
      

  Regel: Het gezag kan niet worden bepaald voor een minderjarige met één ouder

  Regel: Het gezag kan niet worden bepaald voor een minderjarige geboren in het buitenland voor 2023 met twee ouders waarvan niet bekend is of ze ooit gehuwd waren

    Voorbeeld: Minderjarige en moeder zijn uit het buitenland geïmmigreerd
      # Wordt bij inschrijven van de moeder ook een beëindigde relatie van die moeder met bijv. de vader vastgelegd?

    Voorbeeld: Minderjarige is alleen uit het buitenland geïmmigreerd zonder de ouders

    Voorbeeld: Minderjarige en beide ouders zijn uit het buitenland geïmmigreerd en de ouders zijn nu met elkaar gehuwd
      # gezamenlijk ouderlijk gezag

    Voorbeeld: Minderjarige geboren in 2024 is alleen uit het buitenland geïmmigreerd zonder de ouders

  Regel: Een minderjarige waar de gezagsuitspraak gezamenlijk ouderlijk gezag
  buitenland > nl
    geboorteland immigratieland   geboortedatum immigratiedatum   gezag
    duitsland    duitsland        <2023         <2023             moeder --> gezag niet te bepalen omdat onzeker is wat de tussentijdse verblijfplaats was tussen geboorte en immigratie zijn geweest
    duitsland    duitsland        <2023         >2023             beide ouders
    duitsland    Spanje           <2023         <2023             beide ouders
    Spanje       Spanje           <2023         <2023             beide ouders
    Spanje       duitsland        <2023         <2023             beide ouders

  nl > buitenland
    emigratieland gezag
    duitsland     moeder --> gezag niet te bepalen
    spanje        beide ouders

  nl > buitenland > nl
    geboortedatum immigratiedatum   emigratieland gezag
    <2023         <2023             duitsland     moeder --> gezag niet te bepalen
    <2023         <2023             Spanje        beide ouders
    <2023         >2023             duitsland     beide ouders       

  buitenland > nl > buitenland
    geboorteland  immigratieland   geboortedatum   immigratiedatum   emigratieland  gezag
    duitsland     duitsland        <2023           <2023            duitsland       moeder --> gezag niet te bepalen
    spanje        duitsland        <2023           <2023            duitsland       beide ouders
    duitsland     spanje           <2023           <2023            duitsland       beide ouders
    duitsland     duitsland        <2023           <2023            spanje          beide ouders

  Regel: Een minderjarige geboren voor 2023 met twee ouders die nooit gehuwd waren en minderjarige is geëmigreerd (geweest) naar een land waarvan bekend is dat de vader gezag krijgt, heeft gezamenlijk ouderlijk gezag
    # lijst waar we weten dat vader gezag krijgt (Spanje)

  Regel: Een minderjarige geboren voor 2023 met twee ouders die nooit gehuwd waren en minderjarige is geëmigreerd (geweest) naar een land waarvan bekend is dat de vader geen gezag krijgt, heeft de moeder eenhoofdig ouderlijk ouderlijk gezag
    # lijst waar we weten dat vader geen gezag krijgt

  Regel: Het gezag kan niet worden bepaald voor een minderjarige geboren voor 2023 met twee ouders en minderjarige is geëmigreerd (geweest) naar een land waarvan niet bekend is of de vader gezag krijgt
    # niet op een van beide lijsten: gezag niet te bepalen

    Voorbeeld: Minderjarige geboren voor 2023 en moeder zijn naar het buitenland geëmigreerd en moeder was tot emigratie nooit met de vader gehuwd

  Regel: Het gezag kan niet worden bepaald voor een minderjarige met één ouder die in het buitenland heeft verbleven
      # Wordt bij inschrijven van de moeder ook een beëindigde relatie van die ouder vastgelegd?

    Voorbeeld: Minderjarige is in het buitenland geboren, heeft 1 ouder waarvan geen huwelijk geregistreerd is en is geïmmigreerd naar Nederland

    Voorbeeld: Minderjarige met 1 ouder is in het buitenland staande huwelijk geboren en is geïmmigreerd naar Nederland
      # kan dit voorkomen? Of heeft dit kind altijd 2 ouders?
