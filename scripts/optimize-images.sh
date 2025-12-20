#!/bin/bash
# optimize-images.sh
# Konvertuje JPG/PNG do WebP, zmenší na max 1920px šířku, kvalita 80%
#
# Použití: ./scripts/optimize-images.sh [složka]
# Příklad: ./scripts/optimize-images.sh images/2020-01
#          ./scripts/optimize-images.sh  (zpracuje celou images/ složku)
#
# Vyžaduje: sudo apt install imagemagick webp

IMAGES_DIR="${1:-images}"
MAX_WIDTH=1920
QUALITY=80

# Kontrola závislostí
if ! command -v convert &> /dev/null; then
    echo "Chyba: ImageMagick není nainstalován"
    echo "Spusť: sudo apt install imagemagick"
    exit 1
fi

# Počítadla
total=0
converted=0
failed=0

echo "Zpracovávám složku: $IMAGES_DIR"
echo "Max šířka: ${MAX_WIDTH}px, Kvalita: ${QUALITY}%"
echo "-------------------------------------------"

# Najdi všechny JPG/PNG soubory
while IFS= read -r -d '' file; do
    ((total++))

    # Výstupní soubor s .webp příponou
    output="${file%.*}.webp"

    echo -n "[$total] $file -> "

    # Konverze: zmenšení + WebP
    if convert "$file" -resize "${MAX_WIDTH}x>" -quality $QUALITY "$output" 2>/dev/null; then
        # Získej velikosti pro porovnání
        orig_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        new_size=$(stat -f%z "$output" 2>/dev/null || stat -c%s "$output" 2>/dev/null)

        # Procenta úspory
        if [ "$orig_size" -gt 0 ]; then
            saved=$(( (orig_size - new_size) * 100 / orig_size ))
            echo "OK (úspora ${saved}%)"
        else
            echo "OK"
        fi

        # Smazání originálu
        rm "$file"
        ((converted++))
    else
        echo "CHYBA"
        ((failed++))
    fi
done < <(find "$IMAGES_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0)

echo "-------------------------------------------"
echo "Celkem: $total, Konvertováno: $converted, Chyby: $failed"

# Zobraz novou velikost složky
echo ""
echo "Velikost složky po optimalizaci:"
du -sh "$IMAGES_DIR"
