# Visualización y Análisis de la Dinámica Fenológica de Ecosistemas Altiplánicos mediante Series Temporales NDVI: Lauca y Volcán Isluga

## Pregunta de Investigación
¿Cómo varían los patrones fenológicos de la vegetación entre diferentes tipos de cobertura vegetal en los Parques Nacionales Lauca y Volcán Isluga, y cuál es su relación con la precipitación y temperatura en el período 2018-2024?

## Hipótesis

Los diferentes tipos de cobertura vegetal en los ecosistemas altiplánicos de los Parques Nacionales Lauca y Volcán Isluga presentan patrones fenológicos diferenciados con variabilidad temporal está significativamente determinada por la precipitación y la temperatura, con desfases temporales específicos para cada tipo de cobertura.

## Objetivo
Caracterizar los patrones fenológicos de diferentes tipos de cobertura vegetal en ecosistemas altiplánicos del norte de Chile mediante series temporales de NDVI de alta resolución temporal (Sentinel-2, 2018-2024) y evaluar su relación con variables climáticas.


## Datos 

### Índice espectral

**Sentinel-2 (COPERNICUS/S2_SR_HARMONIZED)**
- **Plataforma:** Google Earth Engine (GEE)
- **Período:** 2018-01-01 a 2024-12-31
- **Resolución temporal:** 5 días
- **Resolución espacial:** 10 m
- **Bandas utilizadas:** B4 (Red), B8 (NIR), QA60 (control de calidad)
- **Índice:** NDVI = (NIR - Red) / (NIR + Red)
- Formato: vector .shp

### Clima 

**CR2** (Centro de Ciencia del Clima y la Resiliencia)
- **Variables:** 
  - Precipitación (mm/día)
  - Temperatura mínima (°C)
  - Temperatura máxima (°C)
- **Resolución espacial:** ~5 km (0.05°)
- **Resolución temporal:** Diaria
- **Formato:** NetCDF4

### Área de estudio
- Parque Nacional Lauca.sho
- Parque Nacional Volcán Isluga.shp
- **Fuente:** SNASPE (Sistema Nacional de Áreas Silvestres Protegidas del Estado)

### Coberturas Vegetacionales
- Catastro de uso del suelo CONAF
- Tipos de cobertura: Humedales, Matorrales-pastizales, bosques.
- Formato: vector .shp



## Organización de Carpetas

```
agp3141-fenologia-ecosistemas-altiplanicos/
│
├── README.md                          # Este archivo
│
├── datos/                             # Datos de entrada
│   ├── catastro-veg/                  # Coberturas vegetacionales CONAF
│   │   ├── catastro-uso-lauca.shp
│   │   └── catastro-uso-isluga.shp
│   ├── limites/                       # Límites de parques nacionales
│   │   ├── snaspe-lauca.shp
│   │   └── snaspe-isluga.shp
│   ├── ndvi/                          # Series temporales NDVI
│   │   ├── serie-ndvi-lauca.tif
│   │   └── serie-ndvi-isluga.tif
│   └── clima/                         # Datos climáticos CR2MET
│       ├── precipitaciones.csv
│       └── temperaturas.csv
│
├── EDA/                               # Análisis Exploratorio de Datos
│   ├── codigos/
│   │   └── eda.R
│   └── figuras/
│       └── plot-figura.png
│
├── Fenologia/                         # Análisis Fenológico
│   ├── codigos/
│   │   ├── calculo-fenologia.R
│   │   └── visualizacion-fenologia.R
│   └── figuras/
│       └── plot-fenologia.png
│
└── Fenologia-y-clima/                 # Análisis Fenología-Clima
    ├── codigos/
    │   ├── comparacion-fenologia.R
    │   └── visualizacion-comparacion.R
    └── figuras/
        └── plot-figura.png
```



## Métricas Fenológicas

- **SOS (Start of Season)**: Inicio de la temporada de crecimiento
- **POS (Peak of Season)**: Momento de máxima actividad fotosintética
- **EOS (End of Season)**: Fin de la temporada de crecimiento
- **LOS (Length of Season)**: Duración de la temporada de crecimiento (días)

---

## Autor

**Constanza Hernández**  
Magíster en Recursos Naturales 
Pontificia Unviersidad Católica de Chile  
Curso: AGP3141 - Visualización de Datos Ambientales en R  
Fecha: Primavera 2025

---
