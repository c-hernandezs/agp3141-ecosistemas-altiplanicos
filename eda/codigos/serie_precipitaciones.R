library(tidyverse)
library(lubridate)

serie_precipitaciones_lauca <- read_csv(file = "datos/clima/EC_series_lauca.csv")

names(serie_precipitaciones_lauca)

serie_mensual_lauca <- serie_precipitaciones_lauca |>
  group_by(agno, mes) |>
  summarise(precipitacion_acumulada_mensual = sum(valor, na.rm = TRUE), .groups = "drop") |>
  mutate(fecha = make_date(agno, mes, 1))

names(serie_mensual_lauca)

# grafico de barras -------------------------------------------------------
# Crear franjas para destacar años (solo años pares en gris)
años_franjas <- data.frame(
  xmin = as.Date(paste0(seq(2014, 2025, 2), "-01-01")),
  xmax = as.Date(paste0(seq(2014, 2025, 2), "-12-31"))
)

serie_mensual_lauca |>
  filter(agno >= 2014) |>
  mutate(media = mean(precipitacion_acumulada_mensual, na.rm = TRUE),
         color = ifelse(precipitacion_acumulada_mensual < media, "Bajo la media", "Sobre la media")) |>
  ggplot(aes(x = fecha, y = precipitacion_acumulada_mensual, fill = color)) +
  geom_col() +
  geom_hline(aes(yintercept = media),
             linetype = "dashed", color = "black", linewidth = 0.8) +
  scale_fill_manual(values = c("Bajo la media" = "red", "Sobre la media" = "steelblue")) +
  scale_x_date(breaks = "1 month", labels = function(x) {
    #mes_inicial <- substr(format(x, "%b"), 1, 1)
    año_text <- ifelse(month(x) == 1, paste0("\n", year(x)), "")
    paste0(año_text)
  }) +
  labs(title = "Precipitación Acumulada Mensual - Lauca (2014-presente)",
       x = "",
       y = "Precipitación Acumulada (mm)",
       fill = "") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 10,
                                   lineheight = 0.8),
        legend.position = "right",
        panel.grid.major.y = element_line(color = "black", linewidth = 0.1),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank())

