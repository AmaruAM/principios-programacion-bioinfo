
#!/bin/bash
# Autor: Amaru Arnillas
# Fecha: 26/10/2026
# Descripcion: Calcula la longitud y los extremos de una secuencia de ADN.

echo "=== OPERACION KPC - FASE 1 ==="
echo ""

read -p "ID del aislado: " id

# Obtener la secuencia del archivo FASTA
secuencia=$(grep -A1 "$id" operacion_KPC/datos_crudos/aislados_uci.fasta | tail -1)

# Calcular la longitud exacta
longitud=${#secuencia}

# Extraer los primeros y ultimos 3 nucleotidos
inicio=${secuencia:0:3}
final=${secuencia: -3}

# Mostrar los resultados
echo ""
echo "Aislado             : $id"
echo "Secuencia           : $secuencia"
echo "Longitud exacta     : $longitud nucleotidos"
echo "Posible inicio 5'   : $inicio"
echo "Extremo 3'          : $final"
