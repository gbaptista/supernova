set -e

for file in **/**/*_test.lua; do
  lua "$file"
done

for file in *_test.lua; do
  lua "$file"
done
