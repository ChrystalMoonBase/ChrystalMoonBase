# HORIZON — ISRU-kabelnetwerk & de tunnel-worm

**Chrystal Moon Base — speculatief / verre-toekomst hoofdstuk**

> **Status: HORIZON (speculatief).** Dit hoofdstuk is bewust gescheiden van de harde
> CMB-pijlers (CMB8LF-robots, MAST-POD, MRE-keten, sequentieel gated-growth model).
> Het beschrijft een *verre-toekomst* uitbreiding. De natuurkunde en de bronnen zijn
> zo eerlijk mogelijk neergezet; de haalbaarheid op korte termijn wordt **niet** geclaimd.
> Waar iets tegen een natuurwet in gaat, staat dat er expliciet bij.
>
> Leeswijzer categorieën (gebruikt in dit document):
> - **(1) Onmogelijk door natuurwet** — geen budget lost dit op.
> - **(2) Mogelijk, maar zwaar/duur** — fysisch toegestaan, praktisch enorm.
> - **(3) Mogelijk én haalbaar** — bewezen techniek, alleen nog niet op de Maan gedaan.

---

## 0. Waar dit vandaan komt — de redeneerlijn

Dit concept is niet als "oplossing" bedacht en daarna goedgepraat. Het is het
*eindpunt* van een eerlijke redeneerketen die begon bij een heel ander idee en stap
voor stap tegen de natuurkunde werd getoetst. De route is belangrijk, want hij laat
zien **waarom** de uiteindelijke vorm is wat hij is.

1. **Beginvraag:** vier Pods op de vier *peaks of (near-)eternal light* van Peary, om
   minder last van schaduw te hebben dan met één peak.
2. **Eerste idee:** koppel die peaks met een **laser** over de krater (tot ~100 km),
   zodat ze energie kunnen delen.
3. **Toetsing →** dat is **categorie (1)**: de diffractielimiet en de records van
   DARPA / China / Caltech laten zien dat 100 km vermogensoverdracht twee à drie
   ordegrootten voorbij de stand van de techniek ligt. *Geen budget lost dit op.*
4. **Tweede idee:** koppel ze dan met **kabel**.
5. **Toetsing →** 100 km kabel van Aarde meeslepen is **categorie (2)** maar absurd:
   zelfs de dunste zilverdraad weegt al ~10,5 ton (zie §5). Een raket kan dat niet
   redelijk leveren.
6. **Doorbraak in het denken:** je hoeft de energie **helemaal niet** te transporteren.
   Houd de Pods **energetisch zelfstandig** en deel alleen **coördinatie/communicatie**.
   Dan lost het schaduwprobleem zich op door *spreiding van locaties*, niet door
   energie-transport. Dit is **categorie (3)**.
7. **Gevolg:** als er dan toch kabel nodig is (voor communicatie, of in een verre
   toekomst toch stroom), maak je 'm **ter plaatse** uit regoliet (aluminium), en leg
   je 'm **ondergronds** met een trage **smelt-worm**. Ook **categorie (3)**.

> **Kernconclusie:** de Maan beloont wie niets onnodigs meesleept. Elk idee dat
> "verbind twee verre punten met meegenomen materiaal of een laserstraal" botst met
> een natuurwet (1) of met de raket (2). De ISRU-route — maak alles lokaal, leg het
> ondergronds, deel alleen kennis — is de enige die in categorie (3) past.

---

## 1. Het netwerk-concept (top-level)

**Vier energetisch zelfstandige Pods** op de vier peaks of (near-)eternal light op de
rand van de Peary-krater (88,6°N), verbonden tot een **vermaasd (mesh) communicatie-
netwerk**. De Pods zijn de **knooppunten** (coördinatie) én de **bakens** (navigatie
voor de mollen die het netwerk aanleggen).

### 1.1 Waarom vier zelfstandige Pods i.p.v. één grote

- De peaks zijn **smalle bergkammen**, geen plateaus (zie §2). Je *kunt* niet alles op
  één top zetten — spreiding is fysiek afgedwongen.
- Terwijl de Zon laag rond de horizon draait, valt de ene top in terreinschaduw terwijl
  de andere juist verlicht is. Vier gespreide Pods dekken elkaars donkere momenten af →
  **gecombineerde verlichtingsgraad hoger dan elke enkele top.**
- Elke Pod heeft **eigen zon + eigen opslag + eigen robots**. Valt er één uit, draaien
  de andere door. Geen enkele Pod is onmisbaar.

### 1.2 Waarom alleen communicatie koppelen, geen energie

- Energie over tientallen km transporteren = verlieslatend (kabel: I²R-verlies) of
  fysisch onmogelijk (laser, §4). Communicatie is een **signaal**, geen ampères → de
  kabel mag flinterdun, de worm mag dun, je smelt veel minder (§7.3).
- De Pods coördineren: *"Peak 1 zit nu in de schaduw — Peaks 2/3/4 nemen het rekenwerk
  en de aansturing over."* Het schaduw-doel wordt bereikt **zonder één watt over de
  krater te sturen.**

### 1.3 De mesh-topologie

Volledige mesh tussen 4 punten = **6 verbindingen**: 1–2, 1–3, 1–4, 2–3, 2–4, 3–4.
- **Robuust / zelfgenezend:** valt 1–2 weg, dan loopt het verkeer via 1–3–2 of 1–4–2.
  Net als het internet: geen enkele kabel is onmisbaar.
- **Past in gated-growth:** bouw één verbinding, bewijs de worm, voeg dan de volgende
  toe. *"Wat er al ligt, blijft liggen."* Elke gelukte tunnel is blijvende winst.
- **Afweging:** 6 tunnels = 6× het werk. Een **ring** (1–2–3–4–1, vier verbindingen)
  geeft al bijna alle robuustheid voor twee derde van het werk. Diagonalen 1–3 en 2–4
  zijn optioneel, voor extra redundantie.

---

## 2. De locatie — wat de bronnen écht zeggen over Peary

> Staande CMB-regel: materiaal-/geologie-/natuurkunde-claims worden tegen bronnen
> getoetst, niet uit het geheugen beweerd. (Oorsprong: het "basalt-fiasco" — meerdere
> AI's leverden mare-basalt/JSC-1A data voor een highland-anorthiet-site.)

- **Vier peaks bestaan, gedocumenteerd.** Bussey et al. (2004), o.b.v. Clementine-
  beelden: *vier* bergachtige gebieden op de rand van Peary lijken de hele maandag
  verlicht te blijven. (Wikipedia: *Peary (crater)*; Astronomy.com.)
- **"Eternal" is niet 100% — eerlijk in repo houden.** LRO-topografie toont dat géén
  punt op de Maan eeuwigdurend licht krijgt in zowel winter als zomer. Het
  repo-cijfer **~89% verlichting** is dus correct en eerlijk; níet 100%.
  (Wikipedia: *Peary (crater)*; arxiv 1608.01989.)
- **De peaks zijn smalle kammen.** De 90–99% / 100%-verlichte zones zijn "opvallend
  dun — voornamelijk bergkammen en kraterranden." Aan de zuidpool: "eilanden van niet
  meer dan een paar honderd meter breed in een oceaan van eeuwige duisternis."
  (arxiv 1608.01989; en-academic.) → **bevestigt dat spreiding fysiek nodig is.**
- **Kraterdiameter ~79 km** (Wikipedia; bronnen variëren 73–79 km — Peary is onregelmatig). → vier punten op die rand liggen
  typisch **tientallen km** uit elkaar; de overkant kan richting ~70–100 km.
- **Relevante paper voor zonne-onderbouwing:** *"Towers on the Peaks of Eternal Light:
  Quantifying the Available Solar Power"* — Hinshelwood, Peary, Whipple; voor een
  lander van 2 m hoog lopen de gemiddelde verlichtingsniveaus op tot ~88%.
  (ResearchGate 349547324.)

> **Belangrijk voor afstanden:** de exacte onderlinge afstanden tussen de vier Peary-
> toppen zijn in de geraadpleegde bronnen **niet** als hard getal gevonden. De
> "tientallen km" is een **geometrische schatting** uit de kraterdiameter, geen
> gemeten waarde. *Te verifiëren* uit de "Towers on the Peaks"-paper (echte
> coördinaten) vóór dit als hard in het ontwerp gaat.

---

## 3. Waarom 100 km vermogensoverdracht NIET kan — de records (categorie 1)

De diffractielimiet (spotdiameter ≈ 2,44 · λ · L / D) is **golfnatuurkunde** en geldt
ook in een perfect vacuüm. Kleinere zendoptiek = *grotere* spot (niet kleiner). De
enige manier om de spot klein te houden is een **grótere** zendopening D.

| Demonstratie | Vermogen | Afstand | Rendement | Bron |
|---|---|---|---|---|
| **DARPA POWER / PRAD** (laser, 2025) | ~0,8 kW | 8,6 km | ~20% (korte afstand) | darpa.mil; nextbigfuture |
| Vorig laser-record | 0,23 kW | 1,7 km | — | darpa.mil |
| DARPA-doel 2028 | 5 kW | ~193 km | — (drone-**relais**) | nextbigfuture |
| **China / Xidian** (microgolf, 2026) | 1,18 kW | ~100 **m** (grondtoren 75 m) | 20,8% | chinadaily; scmp |
| **Caltech MAPLE** (microgolf, ruimte, 2023) | LED's branden | **30 cm** intern | — | caltech.edu |
| Caltech → Aarde | **"detecteerbaar"** spoor | ~500 km | verwaarloosbaar | caltech.edu; spaceref |

**Doel CMB-koppeling:** ~130 kW over 100 km. Dat is grofweg **160× meer vermogen over
12× de afstand** dan het wereldrecord — op vermogen, afstand én rendement tegelijk.

- **DARPA 20%** en **China 20,8%** landen onafhankelijk op hetzelfde getal → dit is de
  huidige grens, geen toeval.
- **Caltech** noemt z'n Aarde-ontvangst bewust *"detectable"*: net meetbaar, geen
  bruikbaar vermogen. De diffractie werd niet omzeild — ze liepen erin vast.
- **Diffractie-rekensom** (λ ≈ 1 µm, L = 100 km): zendspiegel D = 1 m → spot ≈ **240 m**.
  Spot terug naar ~10 m → D ≈ **25 m** precisie-optiek. Groter dan de grootste telescoop
  op Aarde. Dat sinter je niet uit regoliet.

### 3.1 Het Maan-voordeel (eerlijk: het helpt, maar sloopt de muur niet)

De Maan is **wél** een betere plek voor laser dan de Aarde:
- **Geen atmosfeer** → geen turbulentie (geen "fonkeling" die de bundel uitsmeert),
  geen absorptie, geen weer. DARPA testte juist horizontaal door de dikste atmosfeer
  als *worst case* — dat probleem heb je op de Maan niet.
- **Geen thermal blooming** (laser warmt geen lucht op die de bundel vervormt).
- **Vrije, lange zichtlijnen** tussen bergkammen.

→ Op **korte hops (10–30 km, naburige toppen)** verschuift dit de haalbaarheid echt in
je voordeel: daar was diffractie al beheersbaar, en zonder atmosfeer presteer je beter
dan elke aardse demo. **Maar** voor de volle 100 km blijft de diffractie-/optiekgrootte
de muur — de Maan geeft de *beste* natuurkunde, niet een *andere*.

---

## 4. De oplossing voor het schaduwprobleem (categorie 3)

Niet energie transporteren, maar **locaties spreiden + coördinatie delen**:

- 4 autonome Pods op 4 peaks → er is vrijwel altijd minstens één peak in het licht.
- Een **mesh-communicatienet** laat ze als één systeem samenwerken.
- Resultaat: **minder schaduw-uitval dan met één peak** — precies het oorspronkelijke
  doel — zónder kabel- of laser-energietransport over de krater.

Bonus: bij het *eventueel* later toch leggen van fysieke verbindingen (communicatie, of
in verre toekomst stroom) is **relais** de juiste vorm (korte hops top-naar-top), exact
zoals DARPA's drone-netwerk. Nooit één sprong van 100 km.

---

## 5. Geleider-materiaal — wat geleidt, en wat je kunt MAKEN

### 5.1 Beste geleiders (kamertemperatuur, algemeen)
1. **Zilver** — absolute nr. 1 (laagste soortelijke weerstand).
2. **Koper** — ~5–6% minder, veel goedkoper → aardse standaard.
3. **Goud** — minder dan koper, corrodeert niet.
4. **Aluminium** — ~60% van koper, maar veel lichter (ruimtevaart-bedrading, HV-lijnen).

> Bij cryogene kou kunnen sommige materialen **supergeleidend** worden (weerstand = 0).
> De permanent beschaduwde Peary-bodems (~30–40 K) zijn koud genoeg — **maar**: HTS-
> supergeleiders zijn brosse keramieken (niet uit regoliet te sinteren, mee te nemen),
> én je *peaks* staan in het licht (warm), niet in de schaduw. Koude plek ≠ zonne-plek.
> → supergeleiding is interessant maar niet de praktische peak-koppeling.

### 5.2 Zilver op de Maan? Ja, maar onwinbaar
- LCROSS (2009) vond zilver + kwik in krater Cabeus; vluchtige metalen **migreren naar
  de koudere polen** (atoom voor atoom). De polen zijn dus relatief het rijkst.
  (NationalGeographic; Streetwise.)
- **Maar** hoofdonderzoeker Schultz, letterlijk: de magere concentratie *"betekent niet
  dat we ernaar kunnen gaan mijnen."* De Maan mist de **gelokaliseerde ertsaders** die
  op Aarde door water/tektoniek/vulkanisme ontstonden. Zilver zit als losse atomen
  tussen het stof, niet in winbare aders. (arxiv 2109.02201.)
- → **Zilver winnen voor kabel = niet realistisch.** Blijft meegenomen-luxe voor alleen
  de allerkritischste kleine verbindingen.

### 5.3 De ISRU-geleider: ALUMINIUM uit anorthiet
- MRE (Molten Regolith Electrolysis) haalt **eerst ijzer, dan silicium, dan aluminium**
  uit gesmolten regoliet door er stroom door te sturen; zuurstof is bijproduct.
  (Blue Origin "Blue Alchemist": Fe→Si→Al, **>1600 °C** — zelfde keystone-temp als in
  de bestaande CMB factory-chain.)
- Bulk-aluminium komt uit **anorthiet**, overvloedig in de **highland**-regio = jouw
  Peary-terrein. (ScienceDirect S0094576525002747.)
- **Rangschikking "geleidt goed én winbaar":**
  1. **Aluminium** — ~60% van koper, licht, winbaar via MRE. **De ISRU-geleider.**
  2. IJzer — winbaar (zelfs als eerste), maar slechte geleider (~16% van koper).
  3. Silicium — halfgeleider; niet als kabel, wél voor zonnecellen.

> **Energie-spanningspunt (eerlijk):** een volwaardige metaalfabriek vraagt fors
> vermogen. Eén bron: een efficiënte ISRU-plant = **6 776 kg hardware + 311 kW** zon
> voor 25 t metaal + 23,9 t zuurstof per jaar. CMB levert nu **104–143 kW** → metaal-
> productie moet **gefaseerd**, of drijft je vermogensbehoefte op. Geen showstopper,
> wel een echte ontwerpspanning. (arxiv 2408.05823.)

### 5.4 Hoe dik moet een 500 kW-kabel zijn? (de spanning bepaalt alles)
Vermogen P = U · I. Het is de **stroom (I)** die smelt, niet het vermogen. Daarom
hoogspanning → lage stroom → dunne draad.

| Spanning | Stroom (500 kW) | Zilver-doorsnede (ruw) | Diameter (ruw) |
|---|---|---|---|
| 48 V | ~10 400 A | ~2 000 mm² | **~5 cm** (onhandelbaar) |
| 1 000 V | ~500 A | ~95–120 mm² | **~1,1 cm** |
| 10 000 V | ~50 A | ~10 mm² | **~3,5 mm** (dunner dan potlood) |

> Conclusie: **kabeldikte was nooit het probleem.** Binnen een Pod / over korte afstand
> is een paar mm tot ~1 cm genoeg. Het probleem was altijd de **100 km afstand + het
> leggen**, niet de dikte. Maan-kou helpt (lagere weerstand, betere koeling in schaduw);
> vacuüm werkt tegen koeling in het licht (geen convectie). Getallen zijn de
> *smelt*-grens, niet het efficiëntie-optimum.

### 5.5 Waarom 100 km kabel meeslepen niet kan (categorie 2, maar absurd)
- Dunste variant (3,5 mm, 10 mm² zilver) × 100 km = **1 m³ zilver ≈ 10,5 ton**.
- 1 kV-variant (~1 cm, 100 mm²) = **~105 ton** — zes à zeven Falcon Heavy-vluchten,
  puur voor kabel.
- → Eén kabel verslindt je hele missiebudget. **Maak 'm dus ter plaatse.**

---

## 6. Isolatie / mantel — uit dezelfde regoliet (categorie 3)

**Geen rubber, geen krimpkous, geen meegenomen kunststof** (organisch, vergaat in
UV/straling, bros bij maannacht-kou, niet ISRU). De mantel komt uit je eigen grondstof.

- **Regolietglas is van zichzelf een uitstekende elektrische isolator**: lage
  diëlektrische constante, hoge diëlektrische sterkte. Glasvezel kan **direct uit de
  bodem** of uit **bijproducten van de metaalproductie** (anorthiet, slak uit Al/Ti-
  extractie). (ResearchGate 268564326.)
- **Anorthiet-keramiek** (CaO·Al₂O₃·2SiO₂): zeer lage diëlektrische constante, gebruikt
  als substraat voor elektronica/zonnecellen. (NASA Ray/Ramachandran.)
- **Alumina (Al₂O₃)**: klassieke technische isolator, hoge sterkte + isolatie; komt uit
  je eigen aluminiumketen. (ScienceDirect S0955221926001998.)
- Bron vat het samen: regoliet → "bouwmateriaal, isolatie (thermisch én **elektrisch**),
  stralingsschild, behuizingen." (ScienceDirect S0022309326000517.)

**Drie ISRU-mantelopties:**
1. **Geëmailleerde glasmantel** — kabel door gesmolten regolietglas trekken (zoals
   geëmailleerd koperdraad: glasachtige laklaag, geen rubber). Past op je smelt-techniek.
2. **Glasvezel-omwikkeling** — buigzamer dan een massieve glaslaag (vezels buigen, een
   glasplaat breekt). Aantrekkelijk voor een kabel die je door een koker trekt.
3. **Anorthiet/alumina-keramiek coating** — voor zware isolatie / hoogspanning.

> **Heb je de mantel over de hele lengte wel nodig?** In de glazen koker, in vacuüm, is
> er geen lucht en geen vocht — de twee oorzaken van kortsluiting op Aarde. Ligt de
> kabel **los** in z'n koker (raakt nergens metaal), dan is volle isolatie mogelijk
> overbodig. **Isoleer waar nodig** (verbindingen, doorvoeren, bij de Pods), niet blind
> overal. Scheelt veel materiaal en energie. — Glas blijft **bros van karakter**: kies
> glasvezel of een héél dunne emaillelaag boven een dikke starre glasbuis.

---

## 7. De tunnel-worm ("mol") — werking (categorie 3)

Doel: ondergronds een **glazen koker** aanleggen waarin de (communicatie- of stroom-)
kabel ligt. Ondergronds, want regoliet beschermt tegen micrometeorieten, thermische
swing en straling.

### 7.1 Drie problemen die elkaar oplossen
| Maan-probleem | Normale aanpak faalt omdat… | Worm-oplossing |
|---|---|---|
| **Vooruitkomen** (1/6 g: te licht om af te zetten) | duwen tegen grond → glijdt achteruit | **peristaltisch klemmen** zijwaarts tegen de wand (gripkracht zelf opgewekt, zwaartekracht-onafhankelijk) |
| **Afvoer** (spoil verstopt lange dunne tunnel) | graven produceert grond die nergens heen kan | **smelten** i.p.v. graven → smelt wordt opzij geduwd, stolt tot wand. Géén afvoer. |
| **Kracht/precisie** | brute kracht onbeschikbaar | **traag** gaan → weinig kracht per stap. "Langzaam is een feature." |

### 7.2 Twee zones (belangrijke correctie in het ontwerp)
De worm behandelt de wand in **twee fysiek gescheiden zones**:
- **VOORKANT (werkzone):** smeltkop + grip. Mag **ruw** zijn — hier wil je juist grip.
  Vers, net gestold glas; spikes/klemmen bijten/grijpen hier.
- **ACHTERKANT (kokerzone):** de definitieve **gladde** glazen koker waar de kabel in
  ligt. Raakt de worm niet meer; is "af".
→ Geen tegenstrijdigheid tussen "grip" en "glad": het zijn andere stukken tunnel.
Eventueel gruis van de spikes wordt door de smeltkop **mee-versmolten** in de wand.

### 7.3 Diameter is kritisch, lengte is vrij
- **Smelt-energie schaalt met diameter² (πr²).** Gat 2× breder = **4×** energie. →
  maak het gat **zo smal als de kabel toelaat**.
- **Lengte mag (en moet):** lang geeft (a) thermische scheiding tussen hete kop en koele
  grip-zone, en (b) meer grip-contactpunten = meer trekkracht. Dun-én-lang vechten niet;
  ze wijzen dezelfde kant op.
- **Ondergrens diameter** = niet de smelt-fysica, maar de **inbouwruimte**: kabel +
  doorvoer + smeltkop + hitteschild + grip + besturing moeten náást elkaar passen.
  Ruwe schatting **~3–5 cm** (onderbouwde gok, geen berekend feit).

### 7.4 Voortbeweging — opties en afweging
| Methode | Voordeel | Nadeel | Past bij CMB? |
|---|---|---|---|
| **Peristaltisch klemmen** | zacht, weinig kracht, geen krassen, geen gruis | klemtiming + hitte-scheiding | **best** — past bij "traag & licht", bewaart gladde wand |
| **Gespikte gripwieltjes** (WC, niet-magnetisch) | mechanisch simpel, grip-via-bite, zwaartekracht-onafhankelijk | krassen/gruis (vooraan → mee-versmolten), lagers = koudlas-risico | optie, mits MoS₂ |
| **Schroef-voortbeweging** | continu, elegant | draaien kost koppel; grip in glad glas glijdt; graaf-functie overbodig | minst geschikt voor een *smelter* |

> **Spike-materiaal:** "hard + niet-magnetisch + niet-bros" is een **trilemma** — kies
> er twee. Beste gok: **wolfraamcarbide met niet-magnetische binder (nikkel i.p.v.
> kobalt)**. Keramiek = hard + niet-magnetisch maar **bros**. Titaan = niet-magnetisch
> + taai maar **zachter** (krast). Niet-magnetisch is gewenst: (a) ijzerstof hecht niet,
> (b) verstoort de magnetisch-gelagerde MAST-POD-bearing niet.

### 7.5 Oriëntatie ondergronds — een van de pittigste deelproblemen
Op de Maan vallen de makkelijke methoden weg: **geen GPS** (geen maan-navigatiesats),
**geen kompas** (geen globaal magneetveld), **geen zicht** (ondergronds).
Wat overblijft, in combinatie:
- **IMU (traagheidsnavigatie):** gyro's + versnellingsmeters tellen elke beweging op.
  Zwakte: **drift** (fouten stapelen op over afstand) → herijking nodig.
- **De kabel als navelstreng:** altijd "terug" bekend + **communicatielijn** naar de
  basis, die mee-rekent en correcties stuurt.
- **Pods als bakens + bekende doel-coördinaten:** elke worm graaft van een **bekende**
  Pod naar een **bekende** Pod → niet verkennen, alleen koers-houden naar een vast punt;
  bakens herijken de IMU-drift.

### 7.6 Vastplakken van de kabel — opgelost door traagheid + losheid
- **Mechanisme A — vastbakken aan nog-zacht glas:** **traag genoeg** gaan zodat de wand
  al **volledig gestold** is vóór de kabel arriveert → **categorie: opgelost** (jouw
  inzicht, klopt 100%).
- **Mechanisme B — koudlassen (vacuüm-aanhechting, ook tussen koude harde vlakken):**
  traagheid raakt dit niet rechtstreeks, **maar**: (a) **ruime koker** → kabel raakt de
  wand nauwelijks; (b) **glas-tegen-aluminium** (ongelijke materialen) last veel minder
  dan metaal-op-metaal; (c) **MoS₂** als zekerheid. → samen praktisch uitgesloten.

### 7.7 Productie + leggen ineen — en het "mantelbuis"-voordeel
- De **kabelfabriek produceert continu** en de worm **legt tijdens productie** (naald-
  en-draad): het gelegde deel blijft **stil** liggen, alleen vers materiaal komt erbij →
  vermijdt de meeschuif-wrijving van "de hele lengte vooruittrekken".
- **Reparatie/upgrade = goedkoop:** de dure stap (smelten van de tunnel) doe je **één
  keer**. Glas op de Maan vergaat niet. Bij kabelbreuk: oude kabel eruit, verse er via
  de **bestaande koker** in — geen worm, geen smelt-energie. Je hebt het **mantelbuis-
  principe** heruitgevonden: tunnel = blijvende infrastructuur, kabel = vervangbare
  inhoud. Voorwaarde: kabel **los** in **ruime, gladde** koker (zelfde keuze die ook
  wrijving én vastbakken oplost — drie vliegen, één keuze).

---

## 8. Benodigde fabriekjes (uitbreiding factory-landscape: 22 → 26)

> Bestaande keten: 22 modules, MRE-keystone ~1600 °C. De onderstaande modules sluiten
> daar direct op aan (delen warmte/voeding/grondstof). Alle processen zijn op Aarde
> eeuwenoude, bewezen techniek — **geen** ervan stuit op een natuurwet (anders dan §3).

| # | Module | Input → Output | Maan-voordeel | Maan-uitdaging |
|---|---|---|---|---|
| **F1** | **Gieterij** (continugieten) | zuiver Al (uit MRE) → draadstaaf (rod) | **vacuüm = geen oxidatie**; kan direct uit MRE-smelt doorlopen (minder herverhitten) | koeling alleen via straling/geleiding |
| **F2** | **Walserij / extrusie** | rod → dunne draadstaaf | inert vacuüm | warmte-management |
| **F3** | **Draadtrekkerij + ANNEALING** | draadstaaf → kabel (op maat) | vacuüm = schoon | **matrijsslijtage** (regoliet schuurt) + **MoS₂** vacuüm-smering nodig; gloeien tegen brosheid |
| **F4** | **Mantel-/isolatie-unit** | kabel + regolietglas/vezel/keramiek → geïsoleerde kabel | grondstof = bijproduct van MRE | bros glas → vezel of dunne email |

Plus het **veld-systeem** (geen fabriek, maar het inzet-platform):
- **Tunnel-worm (CMB8LF-afgeleide):** smeltkop (laser/verhitter, hergebruik sinter-
  techniek) + grip (peristaltisch / WC-spikes) + hitteschild + IMU + kabeldoorvoer.
  *Horizontaal neefje van de sinter-robot.*

> **Annealing (gloeien)** is in F3 **geen los stapje maar essentieel:** koud getrokken
> Al wordt hard/bros → zou breken bij het leggen. Gloeien maakt het weer buigzaam. Idem
> voor het tunnelglas: **langzaam** gestold/gegloeid glas is veel taaier en spannings-
> armer — **maar blijft bros van karakter** (buigt niet plastisch). Voor de zachte,
> trage, lichtbelaste situatie hier is dat geen praktisch probleem; de nuance moet wél
> in het dossier staan (ESA-geloofwaardigheid).

---

## 9. Eerlijke eindbalans

**Wat werkt (categorie 3):**
- 4 energetisch zelfstandige Pods, mesh-gekoppeld voor **communicatie/coördinatie**.
- Schaduw-doel bereikt via **spreiding + coördinatie**, niet via energietransport.
- **Aluminium** geleider uit anorthiet (MRE), **glas/keramiek** isolatie uit dezelfde
  regoliet — één grondstof, drie functies (geleider, tunnel, mantel).
- **Trage smelt-worm** legt een gladde glazen **mantelbuis**; kabel los erin →
  vervangbaar/upgradebaar, plakt niet vast.

**Wat niet werkt (categorie 1) — eerlijk benoemen in elk publiek stuk:**
- **130 kW laser over 100 km**: twee à drie ordegrootten voorbij DARPA/China/Caltech.
  Diffractie is een natuurwet; geen budget en geen Maan-vacuüm lost het op. Korte hops
  (10–30 km) zijn een ander verhaal en daar helpt het vacuüm wél.

**Open punten / te verifiëren:**
- Echte onderlinge **afstanden** tussen de 4 Peary-toppen (uit "Towers on the Peaks").
- Worm-**ondergrens diameter** (afhankelijk van smelttechniek + vermogenskeuze).
- **Energiebalans** metaalfabriek vs. CMB-vermogen (311 kW vs. 104–143 kW → faseren).

---

## 10. Bronnen (geraadpleegd, dit hoofdstuk)

**Power beaming / records**
- DARPA POWER/PRAD — darpa.mil/news/2025/darpa-program-distance-record-power-beaming
- NextBigFuture — DARPA 800 W @ 8,6 km; doel 5 kW @ 120 mijl (drone-relais)
- China / Xidian "Sun Chasing" — chinadaily.com.cn; scmp.com (1,18 kW @ ~100 m, 20,8%)
- Caltech MAPLE / SSPD-1 — caltech.edu; spaceref.com ("detectable" naar Aarde; 30 cm intern)

**Peary / peaks of eternal light**
- Wikipedia — *Peary (crater)* (4 peaks, Bussey 2004; ~79 km; geen perpetueel licht)
- Astronomy.com — *Eternal light at a lunar pole* (73 km krater)
- arxiv 1608.01989 — *The Peaks of Eternal Light* (smalle kammen; 90–99%/100% kaart)
- ResearchGate 349547324 — *Towers on the Peaks of Eternal Light* (zonne-power, ~88%)

**Zilver / regoliet-metalen**
- NationalGeographic / Streetwise — LCROSS zilver+kwik, polaire migratie, "niet mijnbaar"
- arxiv 2109.02201 — geen gelokaliseerde ertsaders op de Maan
- Blue Origin "Blue Alchemist" — MRE Fe→Si→Al, >1600 °C
- ScienceDirect S0094576525002747 — Al uit anorthiet (highland), molten-salt electrolysis
- arxiv 2408.05823 / ScienceDirect S0094576522006579 — ISRU-plant: 6776 kg + 311 kW → 25 t/a

**Isolatie / glas-keramiek uit regoliet**
- ResearchGate 268564326 — glasvezel uit regoliet/bijproducten; lage ε, hoge diëlektr. sterkte
- ScienceDirect S0955221926001998 — Al₂O₃-keramiek (sterkte + isolatie), regoliet-joining
- ScienceDirect S0022309326000517 — regoliet → o.a. elektrische isolatie
- NASA Ray/Ramachandran — anorthiet-keramiek, lage diëlektrische constante

**KRUSTY (referentie-energie, ander hoofdstuk)**
- nasa.gov; tandfonline 00295450.2020.1725382; atomicinsights — 1 kWe, 5 kWt, ~$18–20M

---

*Einde HORIZON-hoofdstuk. Speculatief; gescheiden van de harde CMB-pijlers.
Natuurkunde en bronnen zo eerlijk mogelijk; korte-termijn haalbaarheid niet geclaimd.*
