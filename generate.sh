#!/bin/sh

# cria o tarball com os arquivos de receitas
tar -czvf tarball/recipes.tar.gz -C recipes .

# faz o md5 e o sha256 do tarball
md5sum tarball/recipes.tar.gz | cut -d ' ' -f 1 > tarball/recipes.tar.gz.md5
sha256sum tarball/recipes.tar.gz | cut -d ' ' -f 1 > tarball/recipes.tar.gz.sha256

echo "tarball, md5 and sha256 generated successfully." 