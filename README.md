# Visualización y Análisis de la Dinámica Fenológica de Ecosistemas Altiplánicos mediante Series Temporales NDVI: Parque Nacional Lauca

## Pregunta de Investigación
¿Cómo varían los patrones fenológicos de la vegetación entre diferentes tipos de cobertura vegetal en el Parque Nacional Lauca, y cuál es su relación con la precipitación y temperatura en el período 2014-2024?

## Hipótesis
Los diferentes tipos de cobertura vegetal en los ecosistemas altiplánicos del Parque Nacional Lauca presentan patrones de productividad diferenciados cuya variabilidad temporal está significativamente determinada por la precipitación, con desfases temporales específicos para cada tipo de cobertura.

## Objetivo
Caracterizar los patrones de productividad de diferentes tipos de cobertura vegetal en ecosistemas altiplánicos del norte de Chile mediante proxy de productividad primaria con series temporales de NDVI de alta resolución temporal (Landsat, 2014-2024) y evaluar su relación con variables climáticas.

## Datos 

### Índice espectral
**Landsat 8/9 (USGS)**
- **Plataforma:** Google Earth Engine (GEE)
- **Período:** 2014-01-01 a 2024-12-31
- **Resolución temporal:** 16 días
- **Resolución espacial:** 30 m
- **Bandas utilizadas:** B4 (Red), B5 (NIR), QA_PIXEL (control de calidad)
- **Índice:** NDVI = (NIR - Red) / (NIR + Red)
- **Formato:** Raster GeoTIFF

### Clima 
**CR2MET** (Centro de Ciencia del Clima y la Resiliencia)
- **Variables:** 
  - Precipitación (mm/día)
- **Resolución espacial:** ~5 km (0.05°)
- **Resolución temporal:** Diaria
- **Formato:** NetCDF4 / CSV

### Área de estudio
- Parque Nacional Lauca.shp
- **Fuente:** SNASPE (Sistema Nacional de Áreas Silvestres Protegidas del Estado)

### Coberturas Vegetacionales
- Catastro de uso del suelo CONAF
- Tipos de cobertura: Humedales, Matorrales-pastizales, Bosques
- **Formato:** Shapefile (.shp)

## Organización de Carpetas
```
agp3141-fenologia-ecosistemas-altiplanicos/
│
├── README.md                          # Este archivo
│
├── datos/                             # Datos de entrada
│   ├── catastro-veg/                  # Coberturas vegetacionales CONAF
│   │   └── catastro-uso-lauca.shp
│   ├── limites/                       # Límites de parques nacionales
│   │   └── snaspe-lauca.shp
│   ├── ndvi/                          # Series temporales NDVI
│   │   └── serie-ndvi-lauca.tif
│   └── clima/                         # Datos climáticos CR2MET
│       ├── precipitacion-2014-2024.csv
│       └── temperatura-2014-2024.csv
│
├── EDA/                               # Análisis Exploratorio de Datos
│   ├── codigos/
│   │   └── eda.R
│   └── figuras/
│       └── plot-figura.png
│
├── Análisis NDVI/                         # Análisis NDVI
│   ├── codigos/
│   │   └── NDVI-por-cobsuelo.R
│   │   
│   └── figuras/
│       ├── plot-mapas-ndvi.png
│       └── plot-serie-ndvi-coberturas.png
│
└── NDVI-y-clima/                 # Análisis NDVI-Clima
    ├── codigos/
    │   ├── comparacion-clima-ndvi.R
    │   └── visualizacion-comparacion.R
    └── figuras/
        └── plot-series-comparadas.png
```

## Autor
**Constanza Hernández**  
Magíster en Recursos Naturales  
Pontificia Universidad Católica de Chile  
Curso: AGP3141 - Visualización de Datos Ambientales en R  
Fecha: Primavera 2025

---

