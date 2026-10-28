
#!/bin/bash
# Autor: Amaru Arnillas
# Fecha: 26/10/2026
# Descripcion: Extrae genes de resistencia de una lista.

echo "=== OPERACION KPC - FASE 3 ==="
echo ""

# Solicitar nombre del archivo del aislado
read -p "Archivo del aislado: " archivo

# Quitar la extension .fasta
id=${archivo%.fasta}

# Solicitar lista de genes
read -p "Genes detectados: " genes

# Extraer genes usando patrones de Bash
primer_gen=${genes%%,*}
ultimo_gen=${genes##*,}
resto_genes=${genes#*,}

# Mostrar los resultados
echo ""
echo "=== INFORME DE RESISTENCIA - $id ==="
echo "Gen principal       : $primer_gen"
echo "Ultimo gen          : $ultimo_gen"
echo "Resto de la lista   : $resto_genes"

