# Landing Zone Criteria
## Chrystal Moon Base — Site Selection

**Status:** Concept document  
**Licence:** CC0

---

## What the Pod Needs to Land Safely

The Pod is a large, heavy structure deploying a ~35-metre mast. Its landing zone must meet specific criteria, or the mission fails before it begins.

---

## Required Criteria

### Slope
Maximum surface slope: estimated **5 degrees** over the footprint of the deployed bloom leaves.

At steeper slopes, the bloom leaves cannot deploy evenly. The uphill leaves will be shorter to the ground than the downhill leaves, creating an asymmetric working platform. Beyond 5 degrees, this asymmetry may prevent proper Vectran cloth tensioning and leaf sintering.

The v2.5 variable-hinge configuration can compensate for some slope variation within individual leaf positions, but cannot correct gross terrain tilt.

### Flat Zone Size
Minimum flat zone diameter: **30 metres** (estimated, with margin for TRN landing accuracy of 10 metres CEP).

A 30-metre flat zone allows a Pod with a 10-metre bloom diameter to land within the zone even with a 10-metre position error in any direction, with 5 metres of margin.

If TRN accuracy improves to 5 metres CEP, the minimum flat zone diameter reduces to 20 metres.

### Rock Density
The landing legs and bloom leaves must contact the surface without impacting large rocks. Maximum acceptable surface rock size within the landing footprint: approximately **0.3 metres** height (estimated).

Larger rocks would prevent leaves from lying flat on the surface and could damage landing leg structure.

### Bearing Capacity
The regolith must support the Pod's weight distributed across the landing legs and deployed bloom leaves. Regolith bearing capacity at the Peary rim is not directly measured. Estimates based on Apollo sample data and general highland regolith models suggest adequate bearing capacity for the Pod's ground pressure, but this must be verified.

### Foundation — From Bearing to Levelling

Bearing capacity (can the ground hold the weight?) is not the same problem as *evenness* (does it hold the weight uniformly?). For a low, wide lander these are nearly the same. For a tall, slender mast they are not.

Every lander to date — Apollo through the recent robotic missions — has stayed on the surface without sinking. Below the loose top few centimetres, lunar regolith is surprisingly dense and well-compacted; bearing strength rises quickly with depth. Sinking is therefore not the real risk. The real risks for a ~35 m mast are **differential settlement** and **tilt**: if the regolith under one footing compacts slightly more than under another, a tall mast leans, and a small tilt at the base becomes a large displacement at the top.

This matters most because the chosen sites are crater-rim peaks. The Peary rim is described in the literature as worn and eroded — rugged ridges, loose impact debris, possibly unstable talus, and variable regolith depth. On a rim, bearing capacity can vary sharply over short distances: bedrock just under the surface in one spot, loose slope material a few metres away. The general "regolith is firm" rule is *least* reliable on precisely the terrain CMB wants to build on.

**The solution is already in the toolkit: a sintered foundation pad.** Before the mast is raised, the robots sinter a regolith foundation pad under the Pod footprint — converting loose regolith into a solid, load-spreading, levelled base. This neutralises both differential settlement and local slope, and it is fully ISRU (no imported foundation material). Leaf sintering (see `phase-0.2-the-pod.md`, "Leaf Sintering") is effectively the first stage of this pad. The pad does not assume the ground is good enough; it *makes* the ground good enough.

### Illumination
The landing zone must be within an area receiving at minimum **85% annual illumination** based on published SELENE/LRO data, with the specific landing point preferably above 89%.

### Earth Visibility
Continuous Earth line-of-sight must be confirmed for the specific landing zone. Not all points on the Peary rim near-side have unobstructed Earth view — local topographic shadowing can block the line of sight.

---

## Current Status

A precise landing zone has not been selected. The criteria above are the requirements that a selection must meet. Detailed terrain analysis using LRO LOLA data at maximum resolution, combined with illumination modelling and Earth visibility calculation, is required before a specific landing zone can be proposed.

This analysis is an open task. Planetary scientists and mission analysts with access to LRO data are invited to contribute.
