## Figura ciclos anuales de precipitación

## Objetivo: Generar una figura que permita analizar patrones de precipitación
## en período de análisis

## Autor: Constanza Hernández
## Fecha: Primavera 2025
## Programación asistida con Claude IA

library(tidyverse)
library(lubridate)

# Cargar y procesar datos -------------------------------------------------
serie_precipitaciones_lauca <- read_csv(file = "datos/clima/EC_series_lauca.csv")

serie_mensual_lauca <- serie_precipitaciones_lauca |>
  group_by(agno, mes) |>
  summarise(precipitacion_acumulada_mensual = sum(valor, na.rm = TRUE), .groups = "drop") |>
  mutate(fecha = make_date(agno, mes, 1))

# Filtrar período 2014-2024 y preparar datos -----------------------------
serie_filtrada <- serie_mensual_lauca |>
  filter(agno >= 2014 & agno <= 2024) |>
  mutate(mes = as.numeric(mes))

# Preparar datos para gráfico ---------------------------------------------
ciclos_anuales <- serie_filtrada

mediana_historica <- serie_filtrada |>
  group_by(mes) |>
  summarise(precip_mediana = median(precipitacion_acumulada_mensual, na.rm = TRUE))

# Gráfico -----------------------------------------------------------------
grafico_precipitaciones <- ggplot(ciclos_anuales, aes(x = mes, y = precipitacion_acumulada_mensual)) +
  geom_area(fill = "#2E86AB", alpha = 0.2) +
  geom_line(color = "#2E86AB", linewidth = 0.8) +
  geom_line(data = mediana_historica,
            aes(x = mes, y = precip_mediana),
            color = "red", linewidth = 0.7, linetype = "dashed") +
  facet_wrap(~ agno, ncol = 4) +
  scale_x_continuous(breaks = c(1, 3, 5, 7, 9, 11),
                     labels = c("Ene", "Mar", "May", "Jul", "Sept", "Nov")) +
  labs(x = NULL, y = "Precipitación mensual (mm)") +
  theme_bw(base_size = 16) +
  theme(
    strip.background = element_blank(),
    strip.text = element_text(face = "bold", size = 16, hjust = 0),
    panel.grid.major.y = element_line(color = "gray85", linewidth = 0.3),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_rect(color = "gray50", linewidth = 0.5)
  )

print(grafico_precipitaciones)

# Exportar ----------------------------------------------------------------
ggsave("eda/figura_precipitaciones_lauca.png",
       plot = grafico_precipitaciones,
       width = 15, height = 8,
       dpi = 600,
       bg = "white")
