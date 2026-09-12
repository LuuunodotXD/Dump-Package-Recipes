#!/bin/sh

# cria o tarball com os arquivos de receitas
tar -czvf tarball/recipes.tar.gz recipes/*

# faz o md5 e o sha256 do tarball
md5sum tarball/recipes.tar.gz | cut -d ' ' -f 1 > tarball/recipes.tar.gz.md5
sha256sum tarball/recipes.tar.gz | cut -d ' ' -f 1 > tarball/recipes.tar.gz.sha256

echo "Tarball, MD5 and SHA256 generated successfully." 