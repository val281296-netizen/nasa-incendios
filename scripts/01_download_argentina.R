
---

## **3️⃣ Script: `scripts/01_download_argentina.R`**

```r
# 01_download_argentina.R
library(httr)
library(lubridate)
library(dplyr)

# -------------------------------
# Configuración
# -------------------------------
url_base <- "https://nrt3.modaps.eosdis.nasa.gov/archive/FIRMS/modis-c6.1/South_America/MODIS_C6_1_South_America_24h.csv"

# Crear carpetas si no existen
dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)
dir.create("data/argentina", recursive = TRUE, showWarnings = FALSE)

# -------------------------------
# Nombre de archivo con fecha y hora
# -------------------------------
hora <- format(Sys.time(), "%Y%m%d_%H%M")
archivo_raw <- paste0("data/raw/incendios_SA_", hora, ".csv")
archivo_arg <- paste0("data/argentina/incendios_ARG_", hora, ".csv")

# -------------------------------
# Descargar CSV de South America
# -------------------------------
res <- GET(url_base)
if(status_code(res) == 200){
  writeBin(content(res, "raw"), archivo_raw)
  message("Archivo NRT descargado: ", archivo_raw)
} else {
  stop("Error al descargar archivo. Status: ", status_code(res))
}

# -------------------------------
# Filtrar solo Argentina
# -------------------------------
datos <- read.csv(archivo_raw)

argentina <- datos %>%
  filter(latitude >= -55, latitude <= -21,
         longitude >= -73, longitude <= -53)

write.csv(argentina, archivo_arg, row.names = FALSE)
message("Archivo filtrado para Argentina: ", archivo_arg)
