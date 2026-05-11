// ── CMB Codex Data ────────────────────────────────────────────────────────
// Lunar materials & resources — what the Moon already contains.
// Each entry: id, cat, letter, tag, name, sum, desc, specs{}, ref
// Reconstructed from published mission data: Apollo, LCROSS, SELENE, LRO.

var codexData = [

  // ── A ──────────────────────────────────────────────────────────────────
  {id:'al',  cat:'Metal',    letter:'A', tag:'M-Al Module',
   name:'Aluminium',
   sum:'Most abundant structural metal in the lunar crust.',
   desc:'Aluminium makes up approximately 13 wt% of the highland regolith, primarily locked in plagioclase feldspar (anorthosite). It is the primary structural metal targeted by the CMB M-Al module via molten oxide electrolysis. Lightweight, corrosion-resistant in vacuum, and essential for the solar mast frame, dome frames, and cable runs.',
   specs:{'Abundance (highlands)':'~13 wt%','Abundance (mare)':'~8 wt%','Source mineral':'Plagioclase feldspar (anorthosite)','Extraction method':'Molten oxide electrolysis (MOE)','Melting point':'660 °C','Key uses':'Structural frames, solar panel mounts, cable conduit'},
   ref:'Taylor & McLennan (2009) Planetary Crusts; Schwandt et al. (2012) Planet. Space Sci.'},

  {id:'ar',  cat:'Gas',      letter:'A', tag:'Trace atmosphere',
   name:'Argon',
   sum:'Trace noble gas in the thin lunar exosphere.',
   desc:'Argon-40, produced by radioactive decay of potassium-40 in the crust, outgasses into the lunar exosphere. Detected by Apollo mass spectrometers and LADEE. Concentrations are extremely low but measurable. Not a primary resource target but relevant for atmospheric modelling and closed-loop life support studies.',
   specs:{'Source':'Radioactive decay of ⁴⁰K','Detection':'Apollo 17 LACE, LADEE 2013','Exosphere concentration':'~2 × 10⁴ cm⁻³ at night','Isotope':'⁴⁰Ar dominant','Use potential':'Inert gas for welding, minimal'},
   ref:'Stern (1999) Rev. Geophys.; Benna et al. (2015) Geophys. Res. Lett.'},

  // ── B ──────────────────────────────────────────────────────────────────
  {id:'ba',  cat:'Rock',     letter:'B', tag:'Primary regolith',
   name:'Basalt',
   sum:'Mare volcanic rock — the primary sintering feedstock.',
   desc:'Lunar mare basalts cover roughly 17% of the Moon\'s surface. Rich in pyroxene, olivine, and ilmenite, they are the direct feedstock for CMB\'s laser-sintering process. Basalt melts at 1100–1200 °C and resolidifies into a dense, load-bearing ceramic. Phase 0 Demonstrator 1 tests laser sintering of basalt simulant at operational depth. The sintered floor is the foundation of everything else.',
   specs:{'Coverage':'~17% of lunar surface','Composition':'Pyroxene 50%, olivine 20%, ilmenite 15%, plagioclase 15%','Melting point':'1100–1200 °C','Sintered density':'~2.8 g/cm³','Compressive strength':'~150 MPa (sintered)','Key uses':'Sintered floor, road network, dome base'},
   ref:'Heiken, Vaniman & French (1991) Lunar Sourcebook; Fateri et al. (2019) Sci. Rep.'},

  {id:'bf',  cat:'Material', letter:'B', tag:'Structural fibre',
   name:'Basalt Fibre',
   sum:'High-strength fibre spun from molten basalt — no Earth imports needed.',
   desc:'Basalt fibre is produced by melting basalt rock and extruding it through bushings, similar to fibreglass production. Lunar basalt\'s composition makes it well-suited: tensile strength ~3 GPa, chemical resistance, stable from −260 °C to +700 °C. Used in CMB for composite structural panels, rope, and reinforcing sintered surfaces. The entire feedstock is available on-site.',
   specs:{'Tensile strength':'~3,000 MPa','Density':'~2.7 g/cm³','Temperature range':'−260 to +700 °C','Production method':'Melt + bushing extrusion','Feedstock':'Local mare basalt','Key uses':'Composite panels, structural rope, surface reinforcement'},
   ref:'Kamenny Vek (2018) — basalt fibre properties; Benaroya (2018) Building Lunar Habitats'},

  // ── C ──────────────────────────────────────────────────────────────────
  {id:'ca',  cat:'Metal',    letter:'C', tag:'M-Ca Module',
   name:'Calcium',
   sum:'Tenth most abundant element in the lunar crust — structural ceramic precursor.',
   desc:'Calcium is present at 10–11 wt% in the highland regolith, primarily as calcium-rich plagioclase (anorthosite). The CMB M-Ca module targets calcium for production of calcium oxide (quicklime) and calcium silicate cements — lunar equivalents of Portland cement. Also essential for glass production alongside silicon and aluminium oxides.',
   specs:{'Abundance':'~10–11 wt% highlands','Source mineral':'Anorthosite (CaAl₂Si₂O₈)','Target compound':'CaO (quicklime), CaSiO₃ (wollastonite)','Processing temp':'~1600 °C (reduction)','Key uses':'Lunar cement, glass additive, slag filler'},
   ref:'Taylor & McLennan (2009) Planetary Crusts; Heiken et al. (1991) Lunar Sourcebook Ch.2'},

  {id:'co',  cat:'Element',  letter:'C', tag:'Trace solar wind',
   name:'Carbon',
   sum:'Solar-wind-implanted carbon — trace amounts with high strategic value.',
   desc:'Carbon is implanted in the top layer of lunar regolith by the solar wind at concentrations of roughly 50–130 ppm. Small by weight, but strategically critical: carbon is needed for steel production (iron + carbon = steel), lubricants (graphite), and as a component of closed-loop life support chemistry. The M-C module extracts carbon by heating regolith to ~700 °C in vacuum and capturing the outgassed CO.',
   specs:{'Concentration':'50–130 ppm (solar wind zone)','Extraction temp':'~700 °C (vacuum heating)','Target compounds':'CO, CO₂, graphite, carbides','Source depth':'Top 1–2 m of regolith','Key uses':'Steel production, lubricants, life support chemistry'},
   ref:'Haskin & Warren (1991) Lunar Sourcebook Ch.8; Gibson & Johnson (1971) Geochim. Cosmochim. Acta'},

  {id:'cr',  cat:'Element',  letter:'C', tag:'Trace metal',
   name:'Chromium',
   sum:'Minor element in mare basalts — useful for stainless steel and coatings.',
   desc:'Chromium occurs at 0.1–0.5 wt% in lunar mare basalts, primarily in spinel and chromite minerals. Though a minor constituent, it is valuable for corrosion-resistant steel alloys (stainless steel) and hard surface coatings. The high-vacuum lunar environment means corrosion is less critical than on Earth, but chromium coatings provide protection during the brief thermal cycling of the lunar day–night cycle.',
   specs:{'Abundance (mare)':'0.1–0.5 wt%','Source mineral':'Chromite (FeCr₂O₄), spinel','Target alloy':'Stainless steel (Fe + Cr + Ni)','Key uses':'Corrosion-resistant alloys, hard coatings'},
   ref:'Papike, Taylor & Simon (1991) Lunar Sourcebook Ch.5'},

  // ── F ──────────────────────────────────────────────────────────────────
  {id:'fe',  cat:'Metal',    letter:'F', tag:'M-Fe Module',
   name:'Iron',
   sum:'The structural backbone of CMB — 5–14 wt% in regolith.',
   desc:'Iron is the most abundant transition metal in lunar regolith, ranging from ~5 wt% in highlands to ~14 wt% in iron-rich mare basalts. The primary ore is ilmenite (FeTiO₃). The CMB M-Fe module uses hydrogen reduction to extract metallic iron: FeTiO₃ + H₂ → Fe + TiO₂ + H₂O. The hydrogen is recycled from the water produced. Iron is the feedstock for structural steel, machinery components, and robot chassis parts.',
   specs:{'Abundance (highlands)':'5–7 wt%','Abundance (mare)':'10–14 wt%','Primary ore':'Ilmenite (FeTiO₃)','Extraction method':'Hydrogen reduction or MOE','Melting point':'1538 °C','Key uses':'Steel, robot chassis, machinery, structural beams'},
   ref:'Schwandt et al. (2012) Planet. Space Sci.; Taylor & McLennan (2009)'},

  // ── G ──────────────────────────────────────────────────────────────────
  {id:'gl',  cat:'Material', letter:'G', tag:'Structural transparent',
   name:'Glass',
   sum:'Dome windows, optical fibres, and insulation — made from local regolith.',
   desc:'The Moon is rich in glass precursors: SiO₂, Al₂O₃, CaO, MgO and TiO₂ are all present in the regolith in the right proportions for a range of glass compositions. Impact glass already exists naturally throughout the regolith. CMB targets borosilicate-equivalent glass for dome windows (UV-resistant, thermally stable) and silica glass wool for insulation. Glass fibres also serve as optical communication cables within the base.',
   specs:{'Si content':'~45 wt% SiO₂ in regolith','Glass type':'Basaltic glass, engineered silicate glass','Processing temp':'~1400–1600 °C','Transparency':'UV to near-IR (borosilicate equivalent)','Key uses':'Dome windows, optical fibre, insulation, containers'},
   ref:'Taylor & Carrier (1992) J. Aerosp. Eng.; Warren & Brandt (2008) JGR; Heiken et al. (1991)'},

  // ── H ──────────────────────────────────────────────────────────────────
  {id:'h3',  cat:'Gas',      letter:'H', tag:'M-He3 Module',
   name:'Helium-3',
   sum:'Rare fusion fuel implanted by solar wind — potentially worth more than gold.',
   desc:'Helium-3 is implanted in the top metres of lunar regolith by the solar wind at concentrations of 4–30 ppb. It is the ideal fuel for deuterium–helium-3 fusion reactions, producing minimal neutron radiation compared to D–T fusion. Estimated lunar reserve: ~1.1 million tonnes. 100 kg of He-3 could power a European city for a year. The CMB M-He3 module heats regolith to ~700 °C to release implanted noble gases and condenses the He-3. Long-term, this is one of the Moon\'s most strategically important resources.',
   specs:{'Concentration':'4–30 ppb (surface)','Total lunar reserve':'~1.1 × 10⁶ tonnes (est.)','Extraction method':'Thermal outgassing at 700 °C','Fusion reaction':'D + ³He → ⁴He + p (14.7 MeV)','Energy yield':'~18.4 MWh/g','Key uses':'Fusion fuel, strategic export'},
   ref:'Fa & Jin (2007) Icarus 190; Wittenberg, Santarius & Kulcinski (1986) Fusion Tech.'},

  {id:'h2',  cat:'Element',  letter:'H', tag:'M-H2 Module',
   name:'Hydrogen',
   sum:'Solar wind and polar ice — the key to water, rocket fuel, and reduction chemistry.',
   desc:'Hydrogen exists on the Moon in two forms: implanted in regolith by the solar wind (50–150 ppm), and as water ice in permanently shadowed craters at the poles (LCROSS confirmed 5.6 wt% H₂O in the Cabeus plume). The M-H2 module extracts hydrogen primarily from polar ice via electrolysis. Hydrogen is essential for iron reduction (H₂ + FeTiO₃ → Fe), for rocket propellant (LH2/LOX), and for closed-loop life support systems.',
   specs:{'Solar wind concentration':'50–150 ppm','Polar ice (Cabeus)':'~5.6 wt% H₂O equiv.','Extraction methods':'Electrolysis of water ice; thermal regolith heating','Key compounds':'H₂O, H₂, NH₃ (with N)','Key uses':'Iron reduction, rocket fuel, life support, water production'},
   ref:'Colaprete et al. (2010) Science 330; Sunshine et al. (2009) Science 326'},

  // ── I ──────────────────────────────────────────────────────────────────
  {id:'il',  cat:'Mineral',  letter:'I', tag:'Primary ore',
   name:'Ilmenite',
   sum:'The Moon\'s most important ore — source of iron, titanium, and oxygen.',
   desc:'Ilmenite (FeTiO₃) is the primary metallic ore of the Moon, concentrated in mare basalts at up to 15 wt% in titanium-rich regions. It is the feedstock for the CMB M-Fe and M-Ti modules. Hydrogen reduction of ilmenite also produces water (H₂O), which is then electrolysed for oxygen and recycled hydrogen. One tonne of ilmenite yields approximately 290 kg iron, 155 kg titanium (as TiO₂), and 360 kg oxygen — making it the most resource-efficient ore on the Moon.',
   specs:{'Formula':'FeTiO₃','Abundance (Ti-rich mare)':'Up to 15 wt%','Fe yield per tonne':'~290 kg','Ti yield per tonne':'~155 kg (as TiO₂)','O yield per tonne':'~360 kg','Reduction reaction':'FeTiO₃ + H₂ → Fe + TiO₂ + H₂O'},
   ref:'Schwandt et al. (2012) Planet. Space Sci.; Papike et al. (1991) Lunar Sourcebook Ch.5'},

  // ── M ──────────────────────────────────────────────────────────────────
  {id:'mg',  cat:'Metal',    letter:'M', tag:'M-Mg Module',
   name:'Magnesium',
   sum:'Lightweight structural metal — 5–9 wt% in regolith.',
   desc:'Magnesium is the fourth most abundant element in the lunar regolith, present primarily in pyroxene ((Mg,Fe)SiO₃) and olivine ((Mg,Fe)₂SiO₄). It is lighter than aluminium and useful for lightweight alloys and refractory ceramics. The CMB M-Mg module targets magnesium oxide (MgO) and metallic Mg via carbothermal or electrolytic reduction. MgO is also a key refractory material for high-temperature process vessels inside the base.',
   specs:{'Abundance':'5–9 wt%','Source minerals':'Pyroxene, olivine, spinel','Density':'1.74 g/cm³ (metal)','Melting point':'650 °C','Target compounds':'Mg metal, MgO refractory','Key uses':'Lightweight alloys, refractory linings, heat shields'},
   ref:'Taylor & McLennan (2009) Planetary Crusts; Heiken et al. (1991) Lunar Sourcebook Ch.2'},

  {id:'mn',  cat:'Element',  letter:'M', tag:'Trace metal',
   name:'Manganese',
   sum:'Minor alloying element — trace concentrations with useful applications.',
   desc:'Manganese occurs at 0.1–0.2 wt% in lunar regolith, primarily in pyroxenes and oxides. As a steel alloying element, manganese improves hardness, strength, and resistance to impact damage. Small additions (1–2 wt% Mn) to iron significantly improve the mechanical performance of CMB-produced steel structural components.',
   specs:{'Abundance':'0.1–0.2 wt%','Source':'Pyroxene solid solution','Role in steel':'Deoxidiser, hardener (~1 wt%)','Melting point':'1246 °C','Key uses':'Steel alloy, deoxidiser'},
   ref:'Papike et al. (1991) Lunar Sourcebook Ch.5'},

  // ── N ──────────────────────────────────────────────────────────────────
  {id:'ni',  cat:'Metal',    letter:'N', tag:'Meteoritic component',
   name:'Nickel',
   sum:'Mostly meteoritic in origin — important for stainless steel production.',
   desc:'Nickel in lunar regolith is predominantly of meteoritic origin, concentrated in the regolith by billions of years of micrometeorite bombardment. Concentrations are low (0.01–0.05 wt%) but recoverable from the bulk regolith. Nickel is essential for stainless steel (Fe + Cr + Ni) and nickel-based superalloys for high-temperature applications. The CMB M-Fe module recovers co-extracted nickel as a valuable by-product.',
   specs:{'Abundance':'0.01–0.05 wt%','Origin':'Predominantly meteoritic','Key alloy':'Stainless steel (Fe18Cr8Ni)','Melting point':'1455 °C','Key uses':'Stainless steel, superalloys, electrodes'},
   ref:'Heiken et al. (1991) Lunar Sourcebook Ch.8; Taylor & McLennan (2009)'},

  {id:'ni2', cat:'Gas',      letter:'N', tag:'M-N2 Module',
   name:'Nitrogen',
   sum:'Critical for life support — trace solar wind source on the Moon.',
   desc:'Nitrogen is implanted in the regolith by the solar wind at 60–130 ppm. It is essential for a breathable atmosphere (78% of Earth\'s air is N₂), plant growth in future hydroponic farms, and as a carrier gas in manufacturing processes. The CMB M-N2 module extracts nitrogen by heating regolith and separating the outgassed N₂ cryogenically. This is one of the most challenging extractions due to the low concentration, making nitrogen conservation in closed loops critical.',
   specs:{'Concentration':'60–130 ppm (solar wind)','Extraction method':'Thermal outgassing + cryogenic separation','Atmosphere role':'78% of breathable air by volume','Agricultural role':'Protein synthesis, hydroponic nutrient solution','Key uses':'Life support atmosphere, agriculture, inert process gas'},
   ref:'Gibson & Johnson (1971) Geochim.; Haskin & Warren (1991) Lunar Sourcebook Ch.8'},

  // ── O ──────────────────────────────────────────────────────────────────
  {id:'ol',  cat:'Mineral',  letter:'O', tag:'Mare mineral',
   name:'Olivine',
   sum:'Magnesium-iron silicate — common in mare basalts and pyroclastic deposits.',
   desc:'Olivine ((Mg,Fe)₂SiO₄) is a primary mineral in mare basalts and certain pyroclastic glass bead deposits. It is a source of both magnesium and iron, and its high melting point (~1900 °C for pure forsterite) makes it useful as a refractory material. Lunar olivine is generally iron-rich (fayalitic) in mare and magnesium-rich (forsteritic) in primitive highland cumulates.',
   specs:{'Formula':'(Mg,Fe)₂SiO₄','Melting point':'1205–1890 °C (Fe–Mg range)','Abundance':'5–20 wt% in mare basalts','Key elements':'Mg, Fe, Si, O','Key uses':'Refractory aggregate, Mg and Fe source'},
   ref:'Papike et al. (1991) Lunar Sourcebook Ch.5; Heiken et al. (1991)'},

  {id:'ox',  cat:'Gas',      letter:'O', tag:'M-O2 Module',
   name:'Oxygen',
   sum:'43–46 wt% of the regolith — the single most abundant element on the Moon.',
   desc:'Oxygen is locked in mineral form throughout the entire lunar regolith at 43–46 wt%, making it by far the most abundant element on the Moon. The challenge is extracting it from oxide bonds. CMB\'s M-O2 module uses two pathways: molten oxide electrolysis (MOE) of regolith directly, and hydrogen reduction of ilmenite (which produces water, then electrolysed for O₂). Oxygen is needed for rocket propellant (LOX), life support breathing gas, and oxidiser for fuel cells. One tonne of regolith contains ~430–460 kg of oxygen.',
   specs:{'Abundance':'43–46 wt% of regolith','Extraction method 1':'Molten oxide electrolysis (MOE)','Extraction method 2':'H₂ reduction of ilmenite → H₂O → electrolysis','O₂ per tonne regolith':'~430–460 kg (theoretical)','Key uses':'Life support, rocket propellant (LOX), fuel cells'},
   ref:'Schwandt et al. (2012) Planet. Space Sci.; Heiken et al. (1991) Lunar Sourcebook'},

  // ── P ──────────────────────────────────────────────────────────────────
  {id:'pl',  cat:'Mineral',  letter:'P', tag:'Highland mineral',
   name:'Plagioclase Feldspar',
   sum:'The dominant mineral of the lunar highlands — primary aluminium and calcium source.',
   desc:'Plagioclase feldspar (mainly anorthite, CaAl₂Si₂O₈) is the dominant mineral in the lunar highlands, making up 70–90% of anorthosite. It is the primary source of aluminium and calcium in the CMB extraction chain. The bright, heavily cratered lunar highlands visible from Earth are almost entirely anorthosite — a record of the Moon\'s primordial magma ocean solidification ~4.5 billion years ago.',
   specs:{'Mineral series':'Albite (NaAlSi₃O₈) to anorthite (CaAl₂Si₂O₈)','Highland end-member':'Anorthite (~An₉₀–₉₈)','Abundance (highlands)':'70–90 vol%','Al content':'~13 wt% Al in anorthite','Ca content':'~14 wt% Ca in anorthite','Key uses':'Al and Ca extraction feedstock'},
   ref:'Papike et al. (1991) Lunar Sourcebook Ch.5; Smith et al. (1970) Proc. Apollo 11 LSC'},

  {id:'py',  cat:'Mineral',  letter:'P', tag:'Primary silicate',
   name:'Pyroxene',
   sum:'Most abundant mineral in mare basalts — Fe, Mg, Ca, and Si source.',
   desc:'Pyroxene ((Ca,Mg,Fe)SiO₃) is the most abundant mineral in lunar mare basalts, comprising 40–60 vol% of the rock. It contains recoverable concentrations of iron, magnesium, calcium, and silicon — effectively making it a multi-element ore. Low-calcium pyroxenes (pigeonite, orthopyroxene) dominate in mare; high-calcium pyroxene (augite) is also present. Pyroxene is the primary feedstock entering the CMB extraction cascade.',
   specs:{'Formula':'(Ca,Mg,Fe)SiO₃','Mare abundance':'40–60 vol%','Key elements':'Fe, Mg, Ca, Si','Melting point':'~1200–1400 °C','Key uses':'Multi-element ore, sintering additive, refractory'},
   ref:'Papike et al. (1991) Lunar Sourcebook Ch.5; Heiken et al. (1991)'},

  // ── R ──────────────────────────────────────────────────────────────────
  {id:'re',  cat:'Rock',     letter:'R', tag:'Universal substrate',
   name:'Regolith',
   sum:'The Moon\'s unconsolidated surface layer — feedstock for everything.',
   desc:'Lunar regolith is the fragmented, unconsolidated surface layer produced by 4.5 billion years of meteorite impacts. Typically 4–10 m deep in the highlands, 4–5 m in the mare, with grain sizes from microns to centimetres. It is the universal feedstock for CMB: sintered for floors, heated for gas extraction, electrolysed for metals and oxygen, and used as radiation shielding in bulk. Average composition: 45% O, 22% Si, 13% Al, 8% Ca, 6% Fe, 4% Mg, 2% Ti.',
   specs:{'Depth':'4–15 m typical','Average grain size':'70 µm mean','Density (bulk)':'1.5–1.9 g/cm³','Composition':'O 45%, Si 22%, Al 13%, Ca 8%, Fe 6%, Mg 4%, Ti 2%','Sintering temp':'~1100–1300 °C','Key uses':'Sintering, bulk shielding, all extraction processes'},
   ref:'Heiken, Vaniman & French (1991) Lunar Sourcebook Ch.2–9'},

  // ── S ──────────────────────────────────────────────────────────────────
  {id:'si',  cat:'Element',  letter:'S', tag:'M-Si Module',
   name:'Silicon',
   sum:'Second most abundant element — solar cells and structural glass from local material.',
   desc:'Silicon makes up ~22 wt% of the lunar regolith, second only to oxygen. It is present primarily as SiO₂ in all silicate minerals. The CMB M-Si module extracts metallurgical-grade silicon via carbothermal reduction (SiO₂ + 2C → Si + 2CO), producing the feedstock for photovoltaic cells and fibreglass. Solar panels manufactured on-site from lunar silicon would eliminate the need to launch solar infrastructure from Earth.',
   specs:{'Abundance':'~22 wt% of regolith','Source':'All silicate minerals (SiO₂ bonded)','Extraction method':'Carbothermal reduction (SiO₂ + 2C → Si + 2CO)','Solar cell grade':'Metallurgical → electronic via purification','Key uses':'PV solar cells, glass, silicone compounds, semiconductor'},
   ref:'Heiken et al. (1991) Lunar Sourcebook; Williams et al. (1995) — lunar silicon solar cells'},

  {id:'sod', cat:'Element',  letter:'S', tag:'Trace alkali metal',
   name:'Sodium',
   sum:'Trace alkali metal — detected in the lunar exosphere.',
   desc:'Sodium is present in small quantities in lunar rocks (~0.3 wt% in mare basalts) and is the dominant species detected spectroscopically in the thin lunar exosphere, where it produces a faint yellow emission. Sodium is sputtered off the surface by solar wind ions and UV photons. As a resource, it is a minor but useful addition to glass formulations and as a component of certain battery chemistry (sodium-ion batteries).',
   specs:{'Abundance':'~0.3 wt% in mare basalts','Exosphere':'Dominant detected species, visible glow','Extraction':'Low-temperature volatilisation','Key uses':'Sodium-ion batteries, glass modifier, minor alloy additive'},
   ref:'Potter & Morgan (1988) Science 241; Heiken et al. (1991) Lunar Sourcebook'},

  {id:'su',  cat:'Element',  letter:'S', tag:'M-S Module',
   name:'Sulphur',
   sum:'Volatile element — concrete binder, battery electrolyte, and chemical feedstock.',
   desc:'Sulphur is present in lunar regolith at 500–1000 ppm, primarily in troilite (FeS) and other sulphide minerals. It is one of the most strategically interesting minor elements: sulphur concrete (sulphur + aggregate heated to ~130 °C) sets without water and is strong and waterproof — ideal for lunar construction. Sulphur is also useful as a battery electrolyte (lithium-sulphur), a chemical reducing agent, and a component of certain semiconductor dopants.',
   specs:{'Abundance':'500–1000 ppm','Source mineral':'Troilite (FeS), sulphide phases','Extraction method':'Thermal volatilisation at 440 °C','Concrete mix':'~35 wt% S + 65 wt% aggregate at 130 °C','Concrete strength':'~40–60 MPa','Key uses':'Sulphur concrete, Li-S batteries, chemical feedstock'},
   ref:'Grugel (2012) Icarus — lunar sulphur concrete; Fabes & Poison (2002) — sulphur properties'},

  // ── T ──────────────────────────────────────────────────────────────────
  {id:'ti',  cat:'Metal',    letter:'T', tag:'M-Ti Module',
   name:'Titanium',
   sum:'High-strength, low-density structural metal — up to 7 wt% in Ti-rich mare.',
   desc:'Titanium is concentrated in titanium-rich mare basalts at up to 7 wt% TiO₂, extractable from ilmenite (FeTiO₃) as a co-product of iron extraction. Metallic titanium is 45% lighter than steel with comparable strength, and uniquely resistant to temperature extremes. The CMB solar mast, dome framework, and robot chassis components use titanium alloy (Ti-6Al-4V) for their load-bearing elements. It is also biocompatible, relevant for future medical applications on the base.',
   specs:{'Abundance (Ti-rich mare)':'Up to 7 wt% TiO₂','Primary source':'Ilmenite (FeTiO₃)','Density':'4.5 g/cm³ (60% of steel)','Tensile strength':'~900 MPa (Ti-6Al-4V)','Melting point':'1668 °C','Key uses':'Mast, dome frame, robot chassis, pressure vessels'},
   ref:'Schwandt et al. (2012) Planet. Space Sci.; Papike et al. (1991) Lunar Sourcebook'},

  // ── W ──────────────────────────────────────────────────────────────────
  {id:'wa',  cat:'Compound', letter:'W', tag:'M-H2O Module',
   name:'Water Ice',
   sum:'Confirmed at both poles — drinking water, rocket fuel, and radiation shield.',
   desc:'Water ice has been confirmed in permanently shadowed craters (PSRs) at both lunar poles by multiple missions: LCROSS impacted Cabeus crater and detected 5.6 wt% H₂O in the ejecta plume; Chandrayaan-1 M3 detected surface ice exposures; LRO LAMP and Diviner confirmed cold-trap temperatures below 40 K. Water is the single most valuable resource at the poles: it provides drinking water, is electrolysed for O₂ (breathable) and H₂ (fuel), and in bulk provides radiation shielding equivalent to 30 cm of aluminium.',
   specs:{'Confirmed by':'LCROSS (2009), M3/Chandrayaan-1, LRO','Cabeus concentration':'~5.6 wt% H₂O','PSR temperature':'30–40 K (near absolute zero)','Total polar estimate':'600 million – 1 billion tonnes','Electrolysis yield':'111 kg O₂ + 14 kg H₂ per 100 kg H₂O','Key uses':'Drinking water, O₂/H₂ propellant, radiation shielding'},
   ref:'Colaprete et al. (2010) Science 330; Li et al. (2018) PNAS; Hayne et al. (2015) Icarus'},

  // ── Additional entries ─────────────────────────────────────────────────
  {id:'an',  cat:'Rock',     letter:'A', tag:'Highland rock',
   name:'Anorthosite',
   sum:'The Moon\'s original crust — a 4.5-billion-year-old solidified magma ocean.',
   desc:'Anorthosite is the dominant rock of the lunar highlands, composed almost entirely of calcium-rich plagioclase feldspar (anorthite). It represents the primordial lunar crust that crystallised from the global magma ocean ~4.5 billion years ago. The bright, heavily cratered face of the Moon visible from Earth is anorthosite. For CMB it is the primary highland feedstock: rich in aluminium (~13 wt%), calcium (~11 wt%), and silicon (~22 wt%).',
   specs:{'Composition':'90–98% anorthite (CaAl₂Si₂O₈)','Age':'~4.45 Ga (primordial crust)','Density':'~2.7 g/cm³','Coverage':'~83% of lunar surface','Key elements':'Al (~13%), Ca (~11%), Si (~22%), O (~46%)','Key uses':'Al/Ca extraction, cement production, glass'},
   ref:'Smith et al. (1970) Proc. Apollo 11 LSC; Taylor & McLennan (2009)'},

  {id:'sp',  cat:'Mineral',  letter:'S', tag:'Spinel group',
   name:'Spinel',
   sum:'Oxide mineral found in highland rocks — chromium and aluminium source.',
   desc:'Spinel (MgAl₂O₄) and chromite (FeCr₂O₄) are spinel-group minerals found in lunar rocks, particularly in highland anorthosites and mare basalts. Pure spinel is one of the hardest natural oxides, with excellent thermal stability to ~2100 °C. Chromite is a source of chromium for stainless steel. Both are useful as high-temperature refractory materials in the processing modules.',
   specs:{'Spinel formula':'MgAl₂O₄','Chromite formula':'FeCr₂O₄','Hardness':'7.5–8 Mohs','Melting point (spinel)':'2135 °C','Key uses':'Refractory material, Cr and Al source'},
   ref:'Papike et al. (1991) Lunar Sourcebook Ch.5'},

  {id:'zo',  cat:'Compound', letter:'Z', tag:'Lunar ceramics',
   name:'Zirconia',
   sum:'Trace zirconium oxide — ultra-high-temperature ceramic for reactor and furnace use.',
   desc:'Zirconium is present in trace amounts in lunar rocks (~0.01–0.05 wt%), concentrated in the rare mineral zircon (ZrSiO₄) found in KREEP-rich rocks and some mare basalts. Zirconia (ZrO₂) is the most thermally stable oxide known, with a melting point of 2715 °C. Even in small quantities, it is valuable as a refractory liner for the high-temperature processing furnaces in CMB\'s extraction modules, where it withstands the extreme conditions required for metal reduction.',
   specs:{'Formula':'ZrO₂','Source mineral':'Zircon (ZrSiO₄)','Melting point':'2715 °C','Abundance':'Trace (0.01–0.05 wt% in KREEP rocks)','Key uses':'Refractory furnace liners, thermal barrier coatings'},
   ref:'Meyer (1998) Lunar Sample Compendium; Papike et al. (1991)'},

  {id:'kr',  cat:'Rock',     letter:'K', tag:'KREEP terrane',
   name:'KREEP',
   sum:'Potassium-Rare Earth-Phosphorus — the Moon\'s geochemically enriched terrane.',
   desc:'KREEP is a geochemical component of the lunar crust enriched in potassium (K), rare earth elements (REE), and phosphorus (P), plus thorium and uranium. Concentrated in the Procellarum KREEP Terrane (PKT) on the near side. While not a primary CMB resource, KREEP rocks are strategically important: they contain rare earth elements needed for powerful permanent magnets (neodymium, dysprosium), phosphorus for life support chemistry, and thorium/uranium as potential long-term energy sources.',
   specs:{'Key elements':'K, REE (La–Lu), P, Th, U','Location':'Procellarum KREEP Terrane','Th concentration':'~10 ppm (vs ~0.1 ppm global avg)','REE use':'Permanent magnets, catalysts, electronics','P use':'Fertilisers, life support chemistry'},
   ref:'Warren & Wasson (1979) Proc. LPSC; Jolliff et al. (2000) JGR'},

  {id:'py2', cat:'Compound', letter:'P', tag:'Impact melt glass',
   name:'Pyroclastic Glass',
   sum:'Volcanic glass beads — concentrated solar-wind volatiles in pure form.',
   desc:'Lunar pyroclastic glass beads, erupted during ancient fire-fountain volcanic episodes, are found in extensive dark deposits across the Moon (Taurus-Littrow, Aristarchus Plateau, etc.). They have a very high surface-area-to-volume ratio from their beaded form, and are among the highest-concentration carriers of solar-wind-implanted volatiles: hydrogen, helium, carbon, nitrogen, and sulphur. The Apollo 17 orange glass is the most studied example. CMB prioritises pyroclastic deposits near the base site as a premium volatile feedstock.',
   specs:{'Examples':'Apollo 17 orange glass, green glass','Volatile content':'H ~150 ppm, He ~300 ppm, C ~100 ppm','Formation':'Fire-fountain volcanic eruptions','Surface area':'High — ideal for gas extraction','Key uses':'Premium volatile extraction, He-3 source, glass feedstock'},
   ref:'Heiken & McKay (1974) Proc. LPSC; Delano (1986) JGR'},

  {id:'tr',  cat:'Mineral',  letter:'T', tag:'Sulphide ore',
   name:'Troilite',
   sum:'Iron sulphide — the primary sulphur carrier in lunar rocks.',
   desc:'Troilite (FeS) is the most common sulphide mineral in lunar rocks, present in nearly all returned samples at 0.05–0.5 wt%. It is the primary carrier of sulphur on the Moon. The CMB M-S module heats regolith to 440 °C in vacuum, volatilising sulphur from troilite for collection. Co-extracted iron is fed into the M-Fe production stream. Troilite is particularly concentrated in mare basalts and meteoritic components of the regolith.',
   specs:{'Formula':'FeS','Abundance':'0.05–0.5 wt% in basalts','S content':'36.4 wt% S by mass','Decomposition temp':'440 °C in vacuum','Co-product':'Metallic iron (Fe)','Key uses':'Sulphur source, co-iron extraction'},
   ref:'Papike et al. (1991) Lunar Sourcebook Ch.5; Heiken et al. (1991)'},

  {id:'re2', cat:'Element',  letter:'R', tag:'Rare earth elements',
   name:'Rare Earth Elements',
   sum:'Lanthanides in KREEP terrain — essential for motors, magnets, and electronics.',
   desc:'Rare earth elements (REEs: lanthanum through lutetium, plus yttrium) are present in the lunar crust at low concentrations (~1–10 ppm) but are strongly concentrated in KREEP rocks (~10–100 ppm for individual REEs). They are critical for high-performance permanent magnets (Nd-Fe-B magnets in robot motors), phosphors, catalysts, and precision electronics. As CMB moves toward Phase 1.2 manufacturing independence, local REE extraction becomes important for producing motors and electronic components on-site.',
   specs:{'Concentration (average)':'1–10 ppm individual REEs','KREEP concentration':'10–100 ppm','Key REEs':'Nd (magnets), Dy (high-T magnets), La, Ce (catalysts)','Extraction method':'Acid leaching of KREEP-rich materials','Key uses':'Permanent magnets, motors, phosphors, electronics'},
   ref:'Haskin et al. (1991) Lunar Sourcebook Ch.8; Jolliff et al. (2000) JGR'},

  {id:'va',  cat:'Element',  letter:'V', tag:'Trace transition metal',
   name:'Vanadium',
   sum:'Trace transition metal — steel hardener and redox battery electrolyte.',
   desc:'Vanadium is present in lunar mare basalts at ~0.02–0.05 wt%, primarily in pyroxene and oxide minerals. As a steel alloying element, even 0.1 wt% vanadium significantly improves strength and toughness. More importantly, vanadium pentoxide (V₂O₅) is the active material in vanadium redox flow batteries — a highly scalable energy storage technology suitable for the large-scale energy storage required during Peary\'s ~40-day annual low-illumination periods.',
   specs:{'Abundance':'0.02–0.05 wt% in mare','Source':'Pyroxene, oxide minerals','Steel role':'Hardener, grain refiner (0.1 wt%)','Battery role':'Vanadium redox flow battery electrolyte','Energy storage':'Scalable GWh-class storage possible','Key uses':'Alloy steel, large-scale energy storage'},
   ref:'Papike et al. (1991) Lunar Sourcebook; Skyllas-Kazacos et al. (2011) — vanadium batteries'},

  {id:'ph',  cat:'Compound', letter:'P', tag:'Life support chemistry',
   name:'Phosphorus',
   sum:'Essential for life — trace amounts recoverable from KREEP-rich rocks.',
   desc:'Phosphorus is present in lunar rocks at 300–1200 ppm, primarily as apatite (Ca₅(PO₄)₃(F,Cl,OH)) in KREEP-rich materials. It is biologically essential: every living cell requires phosphorus for DNA, RNA, ATP (energy currency), and cell membranes. For CMB hydroponic agriculture in Phase 2, phosphorus is the limiting nutrient — it cannot be obtained from air or water and must be extracted from the regolith. The M-P sub-module targets apatite dissolution with organic acids produced on-site.',
   specs:{'Concentration':'300–1200 ppm','Source mineral':'Apatite Ca₅(PO₄)₃(F,Cl,OH)','Concentration in KREEP':'Up to 2000 ppm','Biological role':'DNA, RNA, ATP, cell membranes','Extraction':'Acid leaching of KREEP-rich regolith','Key uses':'Hydroponics fertiliser, biology, electronics'},
   ref:'Haskin & Warren (1991) Lunar Sourcebook Ch.8; Warren & Wasson (1979)'},

];

// ── Helper: get translated field ──────────────────────────────────────────
function cxT(d, field) {
  if (d.i18n && d.i18n[CL] && d.i18n[CL][field]) return d.i18n[CL][field];
  return d[field] || '';
}

// ── SVG icons per category ────────────────────────────────────────────────
var CX_ICONS = {
  'Metal':    '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><polygon points="12,2 22,8.5 22,15.5 12,22 2,15.5 2,8.5"/></svg>',
  'Gas':      '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="12" cy="12" r="10"/><path d="M12 2a10 10 0 0 1 0 20"/><path d="M2 12h20"/></svg>',
  'Rock':     '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M4 20 L8 8 L14 14 L18 6 L22 20 Z"/></svg>',
  'Mineral':  '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M12 2l7 4v8l-7 4-7-4V6z"/><line x1="12" y1="2" x2="12" y2="22"/><line x1="5" y1="6" x2="19" y2="18"/><line x1="19" y1="6" x2="5" y2="18"/></svg>',
  'Element':  '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="12" cy="12" r="3"/><circle cx="12" cy="12" r="8"/><line x1="12" y1="4" x2="12" y2="20"/><line x1="4" y1="12" x2="20" y2="12"/></svg>',
  'Compound': '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="8" cy="12" r="3"/><circle cx="16" cy="8" r="3"/><circle cx="16" cy="16" r="3"/><line x1="11" y1="12" x2="13" y2="9"/><line x1="11" y1="12" x2="13" y2="15"/></svg>',
  'Material': '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><rect x="3" y="3" width="18" height="18" rx="2"/><line x1="3" y1="9" x2="21" y2="9"/><line x1="3" y1="15" x2="21" y2="15"/><line x1="9" y1="3" x2="9" y2="21"/></svg>',
};
function getCxIcon(cat) {
  return CX_ICONS[cat] || CX_ICONS['Element'];
}

// ── Render codex grid ─────────────────────────────────────────────────────
function renderCodex(data) {
  var grid = document.getElementById('cx-grid');
  if (!grid) return;
  if (!data || data.length === 0) {
    grid.innerHTML = '<div class="cx-empty">' + (T('cx.noresults') || '// No results') + '</div>';
    return;
  }
  grid.innerHTML = data.map(function(d, i) {
    var num = String(i + 1).padStart(2, '0');
    return '<div class="cx-card" onclick="openModal(\'' + d.id + '\')">'
      + '<div class="cx-arr"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M7 17L17 7M7 7h10v10"/></svg></div>'
      + '<div class="cx-icon">' + getCxIcon(d.cat) + '</div>'
      + '<div class="cx-num">// ' + d.cat.toUpperCase() + ' &middot; ' + num + '</div>'
      + '<div class="cx-name">' + cxT(d, 'name') + '</div>'
      + '<div class="cx-tag">' + d.tag + '</div>'
      + '<div class="cx-desc">' + cxT(d, 'sum') + '</div>'
      + '</div>';
  }).join('');
}

// ── Filter codex ──────────────────────────────────────────────────────────
function filterCodex(query) {
  var q = (query || '').toLowerCase().trim();
  var filtered;
  if (!q) {
    filtered = codexData;
  } else if (q.length === 1 && q.match(/[a-z]/)) {
    // Single letter = alpha filter
    filtered = codexData.filter(function(d) {
      return d.letter.toLowerCase() === q;
    });
  } else {
    filtered = codexData.filter(function(d) {
      return (cxT(d,'name') + cxT(d,'sum') + cxT(d,'desc') + d.cat + d.tag)
        .toLowerCase().indexOf(q) !== -1;
    });
  }
  // Update alpha button states
  document.querySelectorAll('.alpha-btn').forEach(function(btn) {
    var l = btn.getAttribute('data-l');
    btn.classList.toggle('active', l && l.toLowerCase() === q);
    if (btn.textContent === 'ALL') btn.classList.toggle('active', !q);
  });
  renderCodex(filtered);
}
