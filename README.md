# Seguimiento de Incendios en Argentina

Este repositorio automatiza la descarga de incendios activos en Argentina usando los **archivos NRT de FIRMS South America (MODIS)**.

## Estructura

- `data/raw/` → Archivos crudos de Sudamérica (descargados automáticamente, no subir a GitHub)
- `data/argentina/` → Archivos filtrados solo para Argentina
- `scripts/01_download_argentina.R` → Script para descargar y filtrar los datos

## Cómo usar

1. Clonar el repositorio:

```bash
git clone https://github.com/TU_USUARIO/incendios_arg.git
