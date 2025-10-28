# Conectar R a GEE
# AI Assitant: Claude

my_ee_init <- function() {

  cat("Inicializando Google Earth Engine...\n")

  # Inicializar con tu usuario y proyecto altiplano
  ee_Initialize(
    user = "constanzahernandez082@gmail.com",
    project = "altiplano-474715",
    drive = TRUE
  )

  cat("✓ Google Earth Engine inicializado\n")
  cat("✓ Proyecto: altiplano-474715\n")

  # Verificar Drive
  tryCatch({
    usuario_drive <- drive_user()
    cat("✓ Google Drive conectado:", usuario_drive$emailAddress, "\n\n")
  }, error = function(e) {
    cat("⚠ Google Drive no autenticado. Ejecutando autenticación...\n")
    drive_auth()
    usuario_drive <- drive_user()
    cat("✓ Google Drive conectado:", usuario_drive$emailAddress, "\n\n")
  })

  return(invisible(TRUE))
}
