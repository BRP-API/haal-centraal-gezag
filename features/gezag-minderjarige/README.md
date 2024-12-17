# language: nl

**Wat is gezag?** 
Iedereen in Nederland die jonger is dan 18 jaar staat onder gezag. Dit betekent dat zij sommige beslissingen niet zelfstandig mogen nemen. Iemand die gezag heeft over een kind is verantwoordelijk voor de verzorging en opvoeding van het kind en beheert het geld en de spullen van het kind. De gezaghouder is ook de wettelijk vertegenwoordiger van het kind. Kinderen mogen vaak niet zelf officiële handelingen doen. De wettelijk vertegenwoordiger doet dit dan voor het kind, bijvoorbeeld door een handtekening te zetten.
De wettelijk vertegenwoordiger is ook vaak wettelijk aansprakelijk voor wat het kind doet. Gezag is dus uitgebreider dan alleen een recht op omgang. De ouder met gezag mag namelijk belangrijke beslissingen nemen over het leven van het kind, zoals een schoolkeuze, medische beslissingen, een verhuizing, een vakantie naar het buitenland of het aanvragen van een reisdocument. Een moeder die alleen het gezag heeft, heeft bij het nemen van deze beslissingen dus geen toestemming nodig van de andere (juridische) ouder zonder gezag.

Iedereen die 18 jaar of ouder is en niet onder curatele staat of een geestelijke stoornis heeft kan gezag hebben. Meestal hebben de ouders het gezag. Het gezag stopt automatisch als het kind 18 jaar wordt. 
Er zijn verschillende soorten gezag:
- Ouderlijk gezag door één ouder (éénhoofdig ouderlijk gezag) of twee ouders (tweehoofdig ouderlijk gezag);
- Gezamenlijk gezag van een ouder en een niet-ouder;
- Voogdij.

**Wat bedoelen we met ouders?**
Met ‘ouders’ bedoelen we de juridische ouders volgens de wet. Meestal bedoelen mensen met ‘ouders’ de biologische ouders. Hieronder staat hoe iemand juridisch ouder kan worden.

De moeder van een kind is volgens de wet:
- De vrouw uit wie het kind geboren is;
- De vrouw die het kind heeft geadopteerd; 
- De vrouw die met de moeder is getrouwd of een geregistreerd partnerschap heeft als het kind tijdens het huwelijk of geregistreerd partnerschap geboren wordt. Om zwanger te worden is gebruik gemaakt van een onbekende zaaddonor, zoals beschreven in de Wet donorgegevens kunstmatige bevruchting; 
- De vrouw die het kind heeft erkend;
- De vrouw van wie het ouderschap gerechtelijk is vastgesteld.

De vader van een kind is volgens de wet:
- De man die met de moeder is gehuwd of een geregistreerd partnerschap heeft, als het kind tijdens het huwelijk of geregistreerd partnerschap geboren wordt;
- De man die het kind heeft erkend; 
- De man die het kind heeft geadopteerd;
- De man van wie het ouderschap gerechtelijk is vastgesteld. 

Met niet-ouder bedoelen we:
- de partner van één van de ouders
- een voogd.

**Wat is voogdij?**
Voogdij is het gezag van niet-ouders. Iedereen die 18 jaar of ouder is, niet onder curatele staat en geen geestelijke stoornis heeft, kan voogd worden. Ook Bureau Jeugdzorg kan als voogd worden benoemd.

Wanneer krijgt een kind een voogd?
- wanneer de ouders zijn overleden;
- wanneer de ouders geen gezag (meer) mogen hebben.

Een kind kan automatisch of via de rechter een voogd krijgen:
- Een gezaghouder met gezamenlijk gezag wordt automatisch voogd als de ouder overlijdt of onder curatele staat. Zie bevoegdheid-tot-gezag-feature.
- Vaak benoemt de rechter een voogd in een gerechtelijke uitspraak. Ook ouders kunnen in hun testament of door een aantekening in het gezagsregister één of twee personen als voogd aanwijzen. De voogdij begint pas als de ouders overleden zijn, het kind nog geen 18 jaar is en de voogd bij de griffie van de rechtbank verklaard heeft dat de voogdij wordt aanvaard. Als de gevraagde persoon toch geen voogd wil zijn, bepaalt de rechter wie de voogd wordt. Zie gerechtelijke-uitspraak-feature.

**Leeswijzer features**

Gezag wordt bepaald door afleidingsregels (rules) in onderstaande volgorde toe te passen:
1. Rules waarmee wordt vastgesteld dat er geen gezag is (zie de geen-gezag.feature)
2. Rules waarmee wordt vastgesteld dat het gezag niet te bepalen is (zie de gezag-niet-te-bepalen.feature)
3. Rules waarmee wordt vastgesteld of er een geldige gerechtelijke uitspraak is over gezag, en of deze wordt herzien door adoptie, een reparatiehuwelijk of ontkenning (zie de gerechtelijke-uitspraak.feature) 
4. Rules waarmee het gezag wordt bepaald van een minderjarige:
    - met twee ouders met een relatie met elkaar (zie de twee-ouders-met-relatie.feature)
    - met twee ouders zonder een relatie met elkaar (zie de twee-ouders-geen-relatie.feature)
    - met één ouder (zie de één-ouder.feature)
    - zonder ouders (zie de geen-ouder.feature)
5. Rules waarmee het gezag wordt bepaald wanneer gezaghouder(s) niet bevoegd of overleden zijn (zie de bevoegdheid-tot-gezag.feature).
