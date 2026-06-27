# Open denkpunten — CMB

Werkdocument. Tien punten om over na te denken, met Berechja's eigen overwegingen
waar al besloten. Niet alles hoeft opgelost — eerlijk benoemen is genoeg.

---

## 1. Mast én bloom-deployment — de twee harde mission-enders

**Status: doordacht, bewust geaccepteerd.**

- Elke robot heeft **minimaal 25 volledig opgeladen batterijen** bij vertrek. De bots
  worden pas geactiveerd zodra de Pod werkt. Een *tijdelijke* mast-onderbreking is dus
  niet meteen fataal — de vloot kan op eigen accu overbruggen.
- Er zijn twee echte "harde" faalpunten, niet één:
  1. **Mast vouwt niet uit / faalt structureel** → geen power beaming. (Hoogst
     geprioriteerde engineering-uitdaging, al zo benoemd.)
  2. **Pod komt heel aan maar de bloom opent niet** → de robots zitten opgesloten,
     kunnen nooit geactiveerd worden én kunnen het probleem niet zelf oplossen. Geen
     herstelpad. Dit is minstens zo kritiek als de mast, mogelijk kritieker.
- **Wat er bij totale mislukking gebeurt is bewust NIET ingevuld.** Of een mislukte
  missie gered wordt (bemande reddingsmissie, of een 2e Pod uit eigen revenu) hangt af
  van data die nu nog niet bestaat: de waarde-afweging van partners en de dan behaalde
  inkomsten. Daarom bewust als "stop / einde" gemarkeerd in plaats van een fantasie-
  scenario te schrijven. Eerlijke niet-invulling, zelfde discipline als de bouwtijd.

> Te doen (optioneel): de 25-batterij-buffer expliciet noemen in de mast-faalanalyse,
> en bloom-deployment naast de mast zetten als tweede harde mission-ender.

---

## 2. Eten/drinken vóór de farm — weggeontworpen via volgorde

**Status: opgelost door ontwerpkeuze.**

- **Mensen komen pas als ALLES al draait** (robots bouwen + bedienen alles autonoom;
  farm draait en is bewezen vóór de eerste mens arriveert). De wankele "opstartperiode
  met mensen erbij" bestaat dus niet — de crew arriveert in een werkend huis, geen
  bouwput. Zelfde gated-growth-logica, toegepast op menselijke aanwezigheid zelf.
- **Bewoners nemen hun eigen voedsel/water-buffer mee** als vangnet voor "mocht er toch
  iets niet in orde zijn". Farm = hoofdvoeding; meegebrachte voorraad = noodbuffer.

Open subvragen (niet dringend):
- Hoe streng is "klaar"? Eén geslaagde oogst of meerdere? Moet er een volle
  voorraadbuffer OP de basis liggen vóór aankomst, zodat een misoogst ná aankomst ook
  gedekt is? (Sluit aan op de "minimum complete and proven"-vraag in build-order.)
- Automatisering moet de farm ook maandenlang autonoom DRAAIEND houden en zelf een
  mislukkende oogst detecteren vóór een mens dat zou zien (link naar denkpunt 3).

---

## 3. Sinter-kwaliteitscontrole — drempel verdiend op aarde, niet bedacht

**Status: methode helder, kalibratie is het werk.**

- **Alles wordt eerst op aarde getest, in vacuümkamers.** Tijdens die testen worden twee
  dingen tegelijk gemeten: (a) de werkelijke sterkte van elk proefstuk (fysieke
  belastingstest), en (b) wat de sensoren ondertussen zagen (spectroscopie, temperatuur,
  laser-feedback). Die koppeling levert de **sensor-signatuur van een goede sinter**.
- Op de Maan is dan geen fysieke breektest per muur nodig: de robot meet real-time met
  dezelfde sensoren en vergelijkt met de op-aarde-geleerde drempel. **Haalt het de
  drempel niet → afgekeurd. Haalt het de drempel of beter → pas dan verder.**
- Dit is gated-growth toegepast op de meetlat zelf: niet alleen bewijzen dát sinteren
  werkt, maar ook kalibreren HOE je weet of het werkt. Empirische ijklijn i.p.v. aanname.

Scherp te houden:
- **Simulant-probleem:** kalibratie gebeurt op highland-anorthiet *simulant*, niet op
  echte Peary-regoliet. Overweeg de eerste lunaire sinter-taken conservatiever te
  accepteren (hogere drempel) tot echt materiaal zich blijkt te gedragen als de simulant.
- **Drempel moet de zwakste plek vangen, niet het gemiddelde.** Belastingstesten op aarde
  moeten ook meten WAAR en HOE het faalt, zodat de sensor-signatuur plaatselijke zwakte
  (holte, slechte laaghechting) herkent — niet alleen algehele kwaliteit.

### 3b. Aanvulling — aarde-team houdt toezicht (autonoom ≠ onbemand)

- **Alle data wordt opgeslagen en naar aarde gestuurd.** Geautomatiseerd betekent NIET
  dat aarde achterover leunt: een team beoordeelt continu de binnenkomende data. Zodra
  iets "niet goed/genoeg" is, kan het team een **update sturen**.
- Dit lost de drempel-zwakte van 3 op: de acceptatie-ijklijn ligt NIET vast bij vertrek.
  Wijkt echte Peary-regoliet af van de simulant, dan ziet het team dat in de data en
  corrigeert de drempel via update. Zelf-corrigerend toezicht.
- **Taakverdeling helder:**
  - *Lokaal/autonoom* = alles wat snel moet (real-time sinter-check, poot-reflex,
    botsing vermijden). Aarde-vertraging onbruikbaar → robot beslist zelf.
  - *Aarde-team* = alles wat oordeel/bijstelling vraagt (drempels herzien, updates
    pushen, patronen herkennen). Vertraging van seconden is hier irrelevant.
- **Communicatievertraging — eerlijk getal:** fysieke round-trip ~2.6 s (~1.3 s één
  kant op, staat geverifieerd in repo). Reken in de praktijk op MEER door verwerking,
  DSN/relay en beoordelingstijd — "±4 s" is een redelijke voorzichtige praktijkschatting
  voor de technische round-trip. Voor toezicht-en-bijsturing (minuten–uren tijdschaal)
  maken die seconden niet uit; ze tellen alleen bij directe besturing, en dat doe je
  bewust NIET (daarvoor is de lokale autonomie).

---

## 4. Reserveonderdelen — in de garages, hoeveelheid door massa-marge

**Status: richting bepaald, exacte berekening voor specialisten.**

- **Reserveonderdelen zitten in de garages achterin** (de 8 garages dienen dubbel:
  robot-onderkomen + onderdelen-opslag — bestaande ruimte, geen aparte voorraadmodule).
- **Hoeveel** hangt af van de **gewichtsmarge bij lancering**. Geen kilogetal verzonnen:
  de bepalende factor (massa-marge) is benoemd, de invulling is voor de lanceer-
  professionals met echte raket-/pod-data. Zelfde discipline als bouwtijd en kosten.

Nuttige randvoorwaarde om alvast mee te geven aan die berekening:
- Gewichtsmarge dwingt een **prioritering** af — niet alleen "hoeveel kg", maar "welke".
- Splitsing: **"dom" mechanisch spul** (gesinterde behuizingen, structurele delen) kan op
  termijn mogelijk zelf uit ISRU; **"slim" elektronisch spul** (moteus-motoren, Jetson-
  breinen, lasers, elektronica) maak je nooit uit regoliet.
- Regel: **geef voorrang aan wat ter plekke onvervangbaar is** (de slimme onderdelen).
  De vloot is uiteindelijk zo duurzaam als het kritische onderdeel dat je niet kunt
  namaken. Reserve-voorraad dus vooral op die onvervangbare onderdelen richten.

### 4b. Correctie — geen elektronica-swap; zwerm IS de redundantie

**Belangrijk inzicht dat 4 bijstelt.**

- **Elektronische componenten swappen is niet realistisch.** Een robot kan een
  kant-en-klaar **been of hoofd** (complete module) koppelen, maar geen losse interne
  elektronica vervangen — te fijn voor grijpers in stof/vacuüm. Dus: **gaat het
  elektrische gedeelte kapot → einde oefening voor die robot.** Geen reparatie op
  componentniveau.
- **Dit is juist de reden om zwermen te sturen i.p.v. een paar.** Redundantie zit niet
  IN de robot (repareerbaarheid) maar IN het aantal (vervangbaarheid door een
  soortgenoot). Eén dode robot = 1/16 capaciteit weg, de rest loopt onveranderd door.
  Het elektronica-reparatieprobleem is niet opgelost maar **wegontworpen** — irrelevant
  gemaakt door aantal.
- **Corrigeert 4:** geen losse elektronische reserveonderdelen om in te bouwen. Reserve
  = hooguit **complete modules** (heel been, hele kop, kant-en-klaar koppelbaar) en
  uiteindelijk **meer hele robots**. Reserve-vraag verschuift van "componenten" naar
  "modules + complete robots".

Open vervolgvraag (zie denkpunt 6): als een robot sterft door dode elektronica maar z'n
mechanische delen nog goed zijn — zijn poten/kop te oogsten als reserve-modules? Dan
wordt een dode robot zelf een onderdelen-bron.

### 4c. Dode robot = oogstbare onderdelen-voorraad

**Sluit de cirkel — versterkt 4 en 4b.**

- Sterft een robot aan kapotte elektronica, dan zijn z'n **mechanische modules vaak nog
  prima** (poten, soms kop). Omdat die kant-en-klaar koppelbaar zijn (zie 4b), kunnen ze
  eraf gehaald worden en als **reserve voor een andere robot** dienen. Dode robot =
  eigen onderdelen-depot.
- **Geen nieuw gereedschap nodig:** de Watchers kunnen al modules decouplen / head-swaps
  doen. Een kadaver oogsten is mechanisch dezelfde handeling als een reparatie. Het
  systeem kán dit al — het hoeft alleen als protocol erkend te worden.
- **Verkleint de meegebrachte voorraad verder:** de vloot genereert z'n eigen reserve-
  modules naarmate robots sterven. De zwerm kannibaliseert z'n doden om langer door te
  gaan — zelfvoorzienende kringloop.

Nuance (beoordeling door aarde-team, zie 3b):
- Niet elke dode robot levert bruikbare modules. Dode elektronica → poten meestal goed.
  Crash/val/structurele schade → mechanische delen mogelijk verbogen → weinig te oogsten.
- Slijtage: een poot met veel loop-uren in stof is "werkend" maar versleten — wel/niet
  hergebruiken is een data-beoordeling ("X uur gelopen, nog goed genoeg, ja/nee").

---

## 5. Snelle reactie vs aarde-vertraging — maglev dubbel weggeredeneerd

**Status: geen issue, om twee redenen.**

- **Eén pod per baan, nooit meerdere** (meerdere per baan kan technisch niet
  gerealiseerd worden). Geen tweede pod = geen botsing = geen split-second botsing-
  vermijding nodig. Probleem wegontworpen door de oorzaak te verwijderen (zelfde patroon
  als farm-volgorde en zwerm-i.p.v.-reparatie).
- **Tegen de tijd dat maglev-transport nodig is, zijn er mensen.** Maglev hoort bij de
  uitgebouwde basis/"stad" (latere fase), niet bij de onbemande aarde-afhankelijke fase.
  Lokaal menselijk toezicht heeft geen aarde-vertraging. De trage schakel (aarde) is dan
  al vervangen door mensen ter plekke.
- Consistentie-check valt dus gunstig uit: het snelle transport komt pas als de trage
  schakel al weg is. Geen verborgen plek waar iets snels op aarde wacht.

Voor later (consequentie, geen probleem): meer transport = meer **banen**, niet meer
pods per baan. Schaalvraag verschuift naar "hoeveel banen" (duur: graven + sinteren +
maglev-spoel). Voor de capaciteitsberekening van de professionals.

> Algemeen principe bevestigd: snel = lokaal/autonoom, traag-oordeel = aarde (of later:
> lokale mensen). Geldt voor robots (gait, sinter-check), noodsituaties, en transport.

---

## 6. Dood casco (na oogsten) — uitvoeringsdetail, niet visie

**Status: bewust overgelaten aan professionals.**

- Na het oogsten van bruikbare modules (4c) blijft een casco over (dode body +
  elektronica). Over jaren stapelen die zich op.
- **Opties bestaan en zijn schaalbaar** (laten liggen / kerkhof / recyclen als grondstof
  via de bestaande metaal-recycling in waste-processing) — maar wélke optie, wanneer en
  hoeveel is een **operationele optimalisatie** die afhangt van energiekosten,
  materiaalopbrengst, werkterrein-druk en wat de robots op dat moment beter te doen
  hebben. Dat is een ingenieurs-/operations-beslissing mét data, geen visie-vraag.
- **Principe (geldt breder):** de visie, principes en architectuur zijn van de visionair;
  het "precies hoeveel / welke methode / welke drempel" is voor de professionals. Zelfde
  discipline als bij bouwtijd, kosten, robotaantal en reserveonderdelen. Eerlijk de grens
  van de eigen rol bewaken = geloofwaardigheid bij die professionals.

---

## 7. Stof tijdens werken — verzacht door "sinteren voor de voet uit"

**Status: blootstelling veel lager dan aangenomen.**

- De robots **sinteren voor de voet uit vanaf de Pod**: ze maken terwijl ze gaan een
  gesinterd, stof-gebonden oppervlak onder zich. Ze ploeteren NIET 24/7 door los stof —
  ze bewegen zich grotendeels over hun eigen gesinterde paden. Gebonden regoliet stuift
  niet; gesinterd oppervlak geeft geen losse scherpe deeltjes.
- **Elegant neveneffect:** het sinteren lost niet alleen het bouwprobleem op, maar
  creëert ook de eigen schone werkomgeving. Stof-vrij gebied groeit mee met de basis.
- Bestaande mitigatie (Si₃N₄ keramische lagers + MoS₂ droge smering) hoeft dus niet tegen
  een constante stof-orkaan te vechten, maar tegen een beheersbare, gelokaliseerde
  blootstelling.

Nuances scherp te houden (testfase aarde / vacuümkamer):
- **Randzone blijft stoffig:** op de grens "gesinterd ↔ los stof" werken ze wél in het
  losse spul (daar gebeurt het sinteren). Blootstelling is niet nul maar **geconcentreerd
  op de werkgrens** — vooral de poten/palm die het dichtst bij vers sinterwerk komen.
  Slijtage is gelokaliseerd, niet overal.
- **Sinteren kan zelf stof opwerpen:** laser → smelt → mogelijk losgemaakte/opgeworpen
  deeltjes (thermische schok, ontgassing). Testvraag voor de vacuümkamer: gedraagt vers-
  gesinterd materiaal zich netjes, of komt er fijn spul vrij dat in de palm-mechanismen
  kruipt?

---

## 8. Zicht op aarde vanaf Peary — sterk idee, percentage verifiëren

**Status: geverifieerd, met nuance.**

- Je geheugen klopte: Peary ligt op de noordelijke limb van de Maan, van opzij gezien
  vanaf aarde → de aarde staat **laag aan de horizon maar zichtbaar**. De 4 "peaks of
  eternal light" (zelfde hoge vrijstaande pieken die zonlicht vangen) hebben de beste
  kans op vrije zichtlijn naar de laag-staande aarde. Je redenering "niet vanuit de
  krater maar vanaf de pieken, en één piek is genoeg want alles staat in verbinding" is
  logisch en grotendeels juist.
- **Nuance — geen gegarandeerde 100% permanente zichtlijn:**
  - "Eeuwig licht" is seizoensgebonden (geen echt eeuwig licht; winter-data ontbreekt);
    libratie laat de aarde soms hoger/lager staan → op laagste momenten kan zicht
    wegvallen vanaf een specifiek punt.
  - Profs meten het **percentage van de tijd** dat de aarde zichtbaar is. Vergelijk
    zuidpool: ~50% zicht vanaf Shackleton-rand werd te laag geacht → Malapert Massif
    (93%) voorgesteld als relais-locatie.
- **Te verifiëren met echte topografische data (LOLA):**
  1. Welk % van de tijd heeft minstens één van de 4 pieken vrij zicht op aarde?
  2. Als < ~100%: accepteer je communicatie-gaten, of leun je op een **relaissatelliet**
     (Lunar Gateway / lunair relais-netwerk — infrastructuur die NIET van jou is)?
- **Verzachtend:** CMB stuurt vooral batchgewijs data (geen real-time besturing — dat is
  lokaal, zie 3b en 5). Korte communicatie-gaten zijn dan acceptabel: data opslaan en
  versturen zodra er weer zicht is. Continue link is een pre, geen harde eis.

---

## 9. Peary-ijs afhankelijkheid — sterker dan gedacht, met eerlijke nuance

**Status: vangnet ingebouwd via timing; ijs-bestaan solide, winbaarheid onzeker.**

- **Grootste vangnet = timing.** Water is voor het grootste deel van de bouw niet nodig,
  en het duurt jaren voor de eerste mens komt. Dus de ijs-aanname hoeft pas waar te zijn
  bij menselijke aankomst — en die jaren bieden tijd voor gerichte ISRU-prospectie die
  het ijs ECHT meet vóórdat er een leven van afhangt. Verifiëren i.p.v. gokken
  (gated-growth).
- **Bewijs dat er íjs is bij de noordpool is solide en meervoudig** (door Berechja
  aangedragen, klopt met repo-bronnen):
  - M3 / Chandrayaan-1 (Li et al. 2018) — direct IR-bewijs oppervlakte-waterijs. (Al in repo.)
  - LCROSS (Colaprete et al. 2010) — inslagpluim toonde waterijs. (Al in repo.)
  - LRO / LEND-neutronendetectie — verhoogde waterstof boven Peary-PSR's.
  - Chandrayaan-2 DFSAR-radar — polarisatie consistent met ondergronds ijs, meters diep.
- **Eerlijke nuance — "aanwezig" ≠ "winbaar op mijn plek":**
  1. Metingen gaan over de **PSR-kraterbodems** (altijd schaduw). Basis staat op de
     **verlichte rand**. IJs zit in de donkere put, mogelijk km's van de werkplek →
     winning is een logistiek probleem op zich.
  2. Concentratie/winbaarheid onzeker: kan fijn vermengd zijn met regoliet in laag %,
     "meters diep vastzit" = moeilijker delven. Verhoogd H-signaal ≠ dikke pure ijslaag.
  3. LEND-neutronendata is wetenschappelijk deels omstreden geweest.
- **Plan-B is ingebouwd:** valt prospectie tegen, dan jaren van tevoren bekend → bijsturen
  zonder levens op het spel: MRE-zuurstof voor ademlucht (geen water nodig), dikkere
  regoliet i.p.v. waterlaag voor afscherming, meer water meebrengen/recyclen voor
  drinkwater + waterstof-brandstof. Onzeker is niet "of er ijs is" maar "hoeveel, hoe
  diep, hoe puur, hoe ver" — exact wat prospectie beantwoordt.

---

## 10. De kritieke fundering: een wérkende zwerm — anders werkt niets

**Status: dé kernprioriteit, scherper dan een stappen-keten.**

- Niet "Pod landt → bloom → mast → sinter" als losse keten — die stappen zijn allemaal
  **leveringsmechanismen voor de zwerm**. Pod, bloom, mast bestaan alleen om de robots op
  de grond te krijgen en van stroom te voorzien. Een perfect geland Pod met uitgevouwen
  mast is **nutteloos als de zwerm niet functioneert**.
- De echte fundering is geen gebeurtenis maar een **capaciteit**: werkt de zwerm? Kunnen
  de robots autonoom, samen, betrouwbaar lopen / sinteren / samenwerken / zichzelf in
  stand houden? Alles (basis, ISRU, farm, mensen) is een gevolg dat pas bestaat als dat
  waar is.
- **Consistent met de hele denklijn:** de zwerm was telkens het antwoord — geen
  elektronica-reparatie nodig (4b), één dode robot geen ramp (4c), levert eigen
  reserveonderdelen (4c), sintert eigen schone pad (7). De zwerm is het hart; de rest is
  ondersteuning of gevolg.
- **Praktische consequentie (bevestigt huidige focus):** het prototype (CMB8LF-S1),
  gait-logica, Jetson voor lokaal zien-en-denken, sinteren testen in vacuümkamers — dat
  IS werk aan de zwerm-capaciteit. De beperkte tijd/geld staat al op het meest kritieke
  punt. Goed instinct.
- **Fase-0 poort, helder criterium:** niet "als de Pod ontworpen is" maar **"als op aarde
  bewezen is dat een zwerm van deze robots autonoom kan lopen, sinteren, samenwerken en
  zichzelf in stand houden."** Lukt dat niet → geen enkele launch heeft zin. Lukt het wel
  → de rest is een kwestie van het naar de Maan krijgen.

### 8b. Satellieten rond de Maan — relais lost zichtlijn-gat op (ESA Moonlight)

**Goed nieuws, gedeeltelijk al operationeel.**

- Er KOMEN satellieten rond de Maan. ESA's **Moonlight-programma**: constellatie van 5
  maansatellieten (1 communicatie + 4 navigatie), datanetwerk tot 400.000 km. Eerste —
  **Lunar Pathfinder** — operationeel 2026; volledig systeem ~2030.
- **Lost denkpunt 8 op:** i.p.v. hopen op vrije zichtlijn vanaf de pieken, stuur je data
  naar een relaissatelliet die het doorgeeft als HIJ zicht op aarde heeft. Vangt de
  zichtlijn-gaten op. Bedoeld juist voor pool-/achterkant-missies die anders zelf een
  relais zouden moeten meenemen. Het is een **dienst** (klant worden), geen eigen bouw.
- **Twee kanttekeningen:**
  1. Moonlight prioriteert nu de **zuidpool** (Artemis). Peary = noordpool. Uitzoeken of
     en wanneer er noordpool-dekking is — concrete vraag voor ESA (OSIP-ingang).
  2. Het is een **externe afhankelijkheid** (ESA/Telespazio-netwerk + hun dekkingskeuzes).
- **Slimste opzet = combinatie:** eigen directe pieklink als onafhankelijke basis +
  Moonlight als relais om gaten te dichten zodra noordpool-dekking bestaat. Twee
  onafhankelijke wegen naar aarde > leunen op één.
