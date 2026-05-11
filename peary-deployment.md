# Peary Crater — Peaks of Eternal Light · Pod Deployment Map

> **Document:** `docs/infrastructure/peary-deployment.md`  
> **Revision:** 4 · 2026  
> **Licence:** CC0 1.0 Universal — Open Blueprint  
> **Status:** Phase 0 · Planning

---

## Overview

Peary Crater (88.6°N, ⌀ 73.1 km) is the primary candidate location for the first Chrystal Moon Base infrastructure cluster. Four elevated points on its rim receive near-continuous solar illumination — these **Peaks of Eternal Light (PELs)** are the anchor positions for the first four infrastructure pods.

Each pod sits on a PEL, harvesting solar power and relaying communications. Sintered basalt roads lead from each pod down into the crater, converging on a central **⌀ 505 m communications zone** positioned to minimise total path length variance across all four routes.

---

## Deployment Schematic

![Peary Crater Pod Deployment Map](peary-deployment-map.svg)

*Deployment schematic — four PEL pods on the crater rim, basalt road network, central ⌀ 505 m convergence zone.*  
*Hosted interactive version: [chrystalmoonbase.com/peary-deployment](https://chrystalmoonbase.com/peary-deployment)*

---

## Pod Positions

All four pods are positioned at Peaks of Eternal Light on the Peary rim, based on Speyerer & Robinson (2005) and Mazarico et al. (2011) illumination data.

| Pod   | Peak (informal)  | Rim azimuth | Illumination |
|-------|------------------|-------------|--------------|
| POD 1 | Pk. Aldrin       | ~338°       | > 90%        |
| POD 2 | Pk. Shackleton   | ~42°        | > 90%        |
| POD 3 | Pk. Nobile       | ~88°        | > 90%        |
| POD 4 | Pk. Haworth      | ~162°       | > 90%        |

> **Note:** Peak names are informal working labels. Official nomenclature pending IAU review.

---

## Road Network

### Design Principle

Each basalt road runs from its pod at the crater rim to the edge of the central convergence circle. Roads are:

- **Tapered** — 18 m wide at the pod anchor, narrowing to 4 m at the circle edge
- **Sintered** — compacted and laser-sintered regolith surface using the Phase 0 robot fleet
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
| Access            | 4 × basalt roads from PEL pods |

---

## Technical Parameters

| Parameter        | Value                   |
|------------------|-------------------------|
| Crater           | Peary                   |
| Location         | 88.6°N, lunar north pole |
| Crater diameter  | 73.1 km                 |
| Rim height       | ~ 2–3 km above floor    |
| PEL illumination | > 90% of lunar year     |
| Coord. system    | LOLA / LRO 2024         |
| Phase            | 0 · Prototype & planning |

---

## References

```
[1] Speyerer, E.J. & Robinson, M.S. (2005).
    Persistently illuminated regions at the lunar poles.
    Nature, 434, 842–844. https://doi.org/10.1038/nature03479

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
