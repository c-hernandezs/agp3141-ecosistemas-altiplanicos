# config.R - Configuración de rutas de datos

# Ruta base a los datos en OneDrive
datos_path <- "C:/Users/const/OneDrive - Universidad Católica de Chile/Magister/Primavera 2025/visualizacion de datos ambientales en R/agp3141-fenologia-ecosistemas-altiplanicos/datos"

# Verificar que la ruta existe
if (!dir.exists(datos_path)) {
  warning("No se encuentra la carpeta de datos en: ", datos_path)
} else {
  message("✓ Carpeta de datos encontrada")
}

# Función helper para construir rutas
ruta_datos <- function(...) {
  file.path(datos_path, ...)
}

# Listar estructura de carpetas (para verificar)
if (dir.exists(datos_path)) {
  message("\nEstructura de datos disponible:")
  carpetas <- list.dirs(datos_path, recursive = FALSE, full.names = FALSE)
  print(carpetas)
}