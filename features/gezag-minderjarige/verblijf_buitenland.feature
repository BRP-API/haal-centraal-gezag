# language: nl
Functionaliteit: Gezag bepalen voor personen die in het buitenland verblijven of daar verbleven hebben

  Regel: Het gezag kan niet worden bepaald voor een minderjarige die nooit een vaste verblijfplaats in Nederland heeft gehad


  Regel: Het gezag kan niet worden bepaald voor een minderjarige geboren in het buitenland voor 2023 met twee ouders waarvan niet bekend is of ze ooit gehuwd waren
    
    Voorbeeld: Minderjarige en moeder zijn uit het buitenland geïmmigreerd
      # Wordt bij inschrijven van de moeder ook een beëindigde relatie van die moeder met bijv. de vader vastgelegd?

    Voorbeeld: Minderjarige is alleen uit het buitenland geïmmigreerd zonder de ouders

    Voorbeeld: Minderjarige en beide ouders zijn uit het buitenland geïmmigreerd en de ouders zijn nu met elkaar gehuwd
      # gezamenlijk ouderlijk gezag

    Voorbeeld: Minderjarige geboren in 2024 is alleen uit het buitenland geïmmigreerd zonder de ouders

  Regel: Een minderjarige die in het buitenland heeft verbleven met twee ouders die met elkaar gehuwd zijn heeft gezamenlijk ouderlijk gezag
  Regel: Een minderjarige die in het buitenland heeft verbleven met twee ouders die niet met elkaar gehuwd zijn en minderjarige is na 1-1-2023 geboren of erkend heeft gezamenlijk ouderlijk gezag
  Regel: Een minderjarige die in het buitenland heeft verbleven met twee ouders die niet met elkaar gehuwd zijn en minderjarige is na 1-1-2023 in Nederland geïmmigreerd heeft gezamenlijk ouderlijk gezag

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

    