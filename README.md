# Github CLI Speed Test

This repo can be used to test internet speed at the terminal by downloading the _test_ (currently 20MB) file.

## tldr

To roughly check your download speed, copy the command below and run in your terminal

```sh
  curl -L https://raw.githubusercontent.com/bahadzie/speed/main/test.sh | sh
```

## Details

_test_ is created on linux using `dd if=/dev/zero of=test bs=1M count=20`.
Note this file can be up to 100MB (github limit).

The script above runs the command below.
As part of downloading _wget_ will report speed.

```sh
wget -O /dev/null --start-pos=1m https://github.com/bahadzie/speed/raw/refs/heads/main/test
```

## TODO

- update _test.sh_ to use curl instead of wget for downloading file
- process the output to return only the download speed
- check if latency can also be reported
