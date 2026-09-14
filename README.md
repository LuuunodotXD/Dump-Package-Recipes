# dumpkg-recipes

Official recipe repository for [dumpkg](https://github.com/LuuunodotXD/dumpkg).

## structure

```
recipes/          # .binfile for each package
tarball/          # generated recipes.tar.gz and checksums
generate.sh       # generates the tarball and checksums
```

## binfile format

```sh
name=curl
version=8.11.0
description=A command-line tool for transferring data with URLs
url=https://example.com/packages/curl-8.11.0.tar.gz
compression=gzip        # gzip, bzip2, xz — default is gzip
md5=d41d8cd98f00b204e9800998ecf8427e
sha256=e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
deps=zlib openssl       # space-separated, resolved by install flag "-d"
postinstall=ldconfig    # optional command to run after install
conffiles=/etc/curl/curlrc  # space-separated, preserved on upgrade
```

## adding a package

1. Create `recipes/<name>.binfile` following the format above
2. Run `sh generate.sh` to regenerate the tarball and checksums
3. Commit and push — update the `recipes_url` in your `dumpkg.conf` if needed

## notes

- `deps` are resolved installing package with "--depinst" or "-d";
- `conffiles` are preserved when upgrading — not removed when the package is removed;
- the package tarball must extract directly to `/` (e.g., `usr/bin/curl`, not `/usr/bin/curl`);
- `compression` defaults to `gzip` if omitted.