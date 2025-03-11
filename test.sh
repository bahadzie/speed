#!/bin/sh

# --start-post can be adjusted to download from 1-20MB
# wget -O /dev/null --start-pos=1m https://github.com/bahadzie/speed/raw/refs/heads/main/test

# url='https://file-examples-com.github.io/uploads/2017/10/file_example_JPG_1MB.jpg'
url='https://github.com/bahadzie/speed/raw/refs/heads/main/test'

if avg_speed=$(curl -qfsS -w '%{speed_download}' -o /dev/null --url "$url")
then
  echo "$avg_speed"
  # numfmt --to=iec <<<"$avg_speed"
fi