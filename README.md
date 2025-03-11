# GH Speed test

This is a repo with files for speed testing.

The files were created on linux using

```sh
dd if=/dev/zero of=1mb bs=1M count=1 # 1MB file
dd if=/dev/zero of=10mb bs=1M count=10 # 10MB file
```

In order to check the speed from a terminal try

```sh
# $URL=https://github.com/bahadzie/speed/raw/refs/heads/main/1mb
$URL=https://github.com/bahadzie/speed/raw/refs/heads/main/10mb
wget -O /dev/null --progress=dot:mega $URL
```
