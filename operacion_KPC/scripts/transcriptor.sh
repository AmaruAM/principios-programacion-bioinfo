
#!/bin/bash
# Autor: Amaru Arnillas
# Fecha: 26/10/2026
# Descripcion: Simula la transcripcion de ADN a ARN.

echo "=== OPERACION KPC - FASE 2 ==="
echo ""

# Pedir el ID del aislado
read -p "ID del aislado: " id

# Obtener la secuencia de ADN desde el archivo FASTA
adn=$(grep -A1 "$id" operacion_KPC/datos_crudos/aislados_uci.fasta | tail -1)

# Convertir todas las timinas (T) en uracilos (U)
arn=${adn//T/U}

# Calcular las longitudes
longitud_adn=${#adn}
longitud_arn=${#arn}

# La longitud no cambia porque cada T se sustituye por una U,
# sin agregar ni eliminar nucleotidos en esta simulacion.

# Mostrar resultados
echo ""
echo "=== TRANSCRIPCION: ADN A ARNm - $id ==="
echo "ADN (5' a 3') : $adn"
echo "ARN (5' a 3') : $arn"
echo "Longitud ADN  : $longitud_adn bases"
echo "Longitud ARN  : $longitud_arn bases"
