# Peary Crater — Peaks of Eternal Light · Pod Deployment Map

> **Document:** `docs/infrastructure/peary-deployment.md`  
> **Revision:** 4 · 2026  
> **Licence:** CC0 1.0 Universal — Open Blueprint  
> **Status:** Phase 0 · Planning

---

## Overview

Peary Crater (88.6°N, ⌀ ~79 km) is the primary candidate location for the first Chrystal Moon Base infrastructure cluster. Four elevated points on its rim are candidate high-illumination peaks — the best of which receives sunlight for ~89% of the lunar year (Noda et al. 2008), among the highest values measured anywhere on the Moon. These peaks (historically called "peaks of eternal light", though no lunar point is lit 100% of the year) are the anchor positions for the first four infrastructure pods.

Each pod sits on a PEL, harvesting solar power and relaying communications. Sintered regolith roads (highland anorthosite) lead from each pod down into the crater, converging on a central **⌀ 505 m communications zone** positioned to minimise total path length variance across all four routes.

---

## Deployment Schematic

![Peary Crater Pod Deployment Map](peary-deployment-map.svg)

*Deployment schematic — four candidate peaks on the crater rim (pods deployed sequentially, one proven before the next), sintered regolith road network, central ⌀ 505 m convergence zone.*  
*Hosted interactive version: [chrystalmoonbase.com/peary-deployment](https://chrystalmoonbase.com/peary-deployment)*

---

## Pod Positions

Four candidate high-illumination peaks on the Peary rim have been identified, based on Bussey et al. (2005), Noda et al. (2008) and Mazarico et al. (2011) illumination data. The ~89% figure is the best measured peak; the four candidate peaks range roughly 86–94% depending on peak and study.

**Deployment is sequential, not simultaneous.** Pod 1 lands first and must prove autonomous operation before Pod 2 is sent; capability grows pod by pod (see `../../roadmap/growth-model-gated.md`). The table below lists the candidate peaks and the intended deployment *order* — not four pods arriving at once.

| Pod   | Peak (informal)  | Rim azimuth | Illumination |
|-------|------------------|-------------|--------------|
| POD 1 | Pk. Aldrin       | ~338°       | ~86–94% (TBD) |
| POD 2 | Pk. Shackleton   | ~42°        | ~86–94% (TBD) |
| POD 3 | Pk. Nobile       | ~88°        | ~86–94% (TBD) |
| POD 4 | Pk. Haworth      | ~162°       | ~86–94% (TBD) |

> **Note:** Peak names are informal working labels. Official nomenclature pending IAU review.

---

## Road Network

### Design Principle

Each sintered road runs from its pod at the crater rim to the edge of the central convergence circle. Roads are:

- **Tapered** — 18 m wide at the pod anchor, narrowing to 4 m at the circle edge
- **Sintered** — compacted and laser-sintered regolith surface (highland anorthosite) using the Phase 0 robot fleet
- **Equal-length** — the convergence circle is positioned at the **least-squares circumcenter** of the four pod positions, minimising length variance across all four routes

### Equal-Length Geometry

Four points on a crater rim are generally not concyclic. The circumcenter that minimises total variance is computed via the overdetermined linear system:

```
For pod positions P₁…P₄, find C = (cx, cy) minimising Σ (|Pᵢ - C|² − r²)²

Linear form (subtract P₁ equation from Pᵢ):
  2(xᵢ − x₁)·cx + 2(yᵢ − y₁)·cy = xᵢ² + yᵢ² − x₁² − y₁²

Solved via least-squares (A^T A x = A^T b)
```

**Result:** Max road-length deviation Δmax < 1 km across all four routes (~2.6% of total length).

---

## Convergence Zone · ⌀ 505 m

The central communications and coordination platform is a circular zone of 505 m diameter, positioned at the least-squares circumcenter of the four PEL peaks.

| Parameter         | Value                          |
|-------------------|--------------------------------|
| Diameter          | 505 m                          |
| Centre (display)  | 451.6, 446.9 (schematic units) |
| Function          | Communications hub, coordination platform, resupply staging |
| Surface           | Sintered regolith pad          |
| Access            | 4 × sintered regolith roads from the peak pods |

---

## Technical Parameters

| Parameter        | Value                   |
|------------------|-------------------------|
| Crater           | Peary                   |
| Location         | 88.6°N, lunar north pole |
| Crater diameter  | ~79 km                  |
| Rim height       | ~ 2–3 km above floor    |
| Peak illumination | ~89% of lunar year (best peak; range ~86–94%) |
| Coord. system    | LOLA / LRO 2024         |
| Phase            | 0 · Prototype & planning |

---

## References

```
[1] Bussey, D.B.J., Fristad, K.E., Schenk, P.M., Robinson, M.S. & Spudis, P.D. (2005).
    Constant illumination at the lunar north pole.
    Nature, 434, 842. https://doi.org/10.1038/434842a

[1b] Noda, H., et al. (2008).
    Illumination conditions at the lunar polar regions by KAGUYA (SELENE) laser altimeter.
    Geophysical Research Letters, 35, L24203. https://doi.org/10.1029/2008GL035692

[2] Mazarico, E., et al. (2011).
    Illumination conditions of the lunar polar regions using LOLA topography.
    Icarus, 211(2), 1066–1081. https://doi.org/10.1016/j.icarus.2010.10.030

[3] Smith, D.E., et al. (2010).
    Initial observations from the Lunar Orbiter Laser Altimeter (LOLA).
    Geophysical Research Letters, 37, L18204.

[4] WAC North Pole mosaic — LROC / NASA GSFC / Arizona State University, 2024.
    https://lroc.im-ldi.com/visit/exhibits/1/gallery/15
```

---

## Files

| File | Description |
|------|-------------|
| `peary-deployment.md` | This document |
| `peary-deployment.html` | Interactive web page (CMB site) |
| `peary-deployment-map.svg` | Schematic map (static export) |
| `peary_blueprint.jsx` | React component (animated, CMB-styled) |

---

*Chrystal Moon Base · Open Blueprint · CC0 1.0 Universal*  
*No flags. No patents. Built for all of humanity.*  
*[chrystalmoonbase.com](https://chrystalmoonbase.com) · [github.com/ChrystalMoonBase](https://github.com/ChrystalMoonBase/ChrystalMoonBase)*
