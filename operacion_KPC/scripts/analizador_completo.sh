
#!/bin/bash
# Autor: Amaru Arnillas
# Fecha: 26/10/2026
# Descripcion: Analisis completo de un aislado KPC.

echo "=== OPERACION KPC - INFORME COMPLETO ==="
echo ""

# Solicitar informacion del aislado
read -p "ID del aislado: " id
read -p "Genes detectados: " genes
read -p "Fecha del analisis (DD/MM/AAAA): " fecha

# Obtener la secuencia de ADN
adn=$(grep -A1 "$id" operacion_KPC/datos_crudos/aislados_uci.fasta | tail -1)

# Calcular la longitud y extremos
longitud=${#adn}
inicio=${adn:0:3}
final=${adn: -3}

# Transcribir ADN a ARN
arn=${adn//T/U}

# La longitud se conserva porque T se reemplaza por U
# sin agregar ni eliminar nucleotidos.

# Extraer genes de resistencia
primer_gen=${genes%%,*}
ultimo_gen=${genes##*,}
resto_genes=${genes#*,}

# Crear carpeta para resultados
mkdir -p operacion_KPC/resultados

# Definir el nombre del reporte
reporte="operacion_KPC/resultados/reporte_${id}.txt"

# Guardar los resultados en un archivo
echo "INFORME - OPERACION KPC" > "$reporte"
echo "Fecha del analisis: $fecha" >> "$reporte"
echo "Generado el: $(date)" >> "$reporte"
echo "" >> "$reporte"

echo "=== INFORMACION DEL AISLADO ===" >> "$reporte"
echo "Aislado: $id" >> "$reporte"
echo "Longitud: $longitud nucleotidos" >> "$reporte"
echo "Inicio 5': $inicio" >> "$reporte"
echo "Extremo 3': $final" >> "$reporte"
echo "" >> "$reporte"

echo "=== TRANSCRIPCION ===" >> "$reporte"
echo "ADN: $adn" >> "$reporte"
echo "ARN: $arn" >> "$reporte"
echo "Longitud ADN: ${#adn}" >> "$reporte"
echo "Longitud ARN: ${#arn}" >> "$reporte"
echo "" >> "$reporte"

echo "=== GENES DE RESISTENCIA ===" >> "$reporte"
echo "Lista completa: $genes" >> "$reporte"
echo "Gen principal: $primer_gen" >> "$reporte"
echo "Ultimo gen: $ultimo_gen" >> "$reporte"
echo "Resto de genes: $resto_genes" >> "$reporte"

# Mostrar el reporte en pantalla
echo ""
cat "$reporte"

