# Revisión de CSL (TMS)

## Hallazgo principal

El texto recibido contiene **dos documentos XML concatenados** en el mismo archivo:

- Un primer bloque que comienza con `<?xml version="1.0" encoding="utf-8"?>` y termina con `</style>`.
- Inmediatamente después, un segundo bloque que vuelve a comenzar con `<?xml version="1.0" encoding="utf-8"?>`.

Esto hace que el archivo sea inválido para Zotero/CSL.

## Corrección recomendada

- Dejar **solo un** bloque `<style>...</style>`.
- Eliminar desde el segundo `<?xml ...?>` hasta el último `</style>` (o viceversa, conservar el segundo y eliminar el primero), ya que ambos bloques son equivalentes.

## Nota

No se detectaron otros errores de estructura al revisar visualmente el primer bloque; el problema crítico es la duplicación completa del documento.
