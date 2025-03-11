# GH Speed test

This is a repo with files for speed testing.

The files were created on linux using

```sh
dd if=/dev/zero of=test bs=1M count=20 # 20MB file
```

In order to check the speed from a terminal try

```sh
# --start-post can be adjusted to download from 1-20MB
wget -O /dev/null --start-pos=1m https://github.com/bahadzie/speed/raw/refs/heads/main/test
```

## TODO

- Write a script that can automatically run the speed test

## References

```txt
# from man wget
       -c
       --continue
           Continue getting a partially-downloaded file.  This is useful when you want to finish up a download started by a previous instance of Wget, or by another program.  For instance:

                   wget -c ftp://sunsite.doc.ic.ac.uk/ls-lR.Z

           If there is a file named ls-lR.Z in the current directory, Wget will assume that it is the first portion of the remote file, and will ask the server to continue the retrieval from
           an offset equal to the length of the local file.

           Note that you don't need to specify this option if you just want the current invocation of Wget to retry downloading a file should the connection be lost midway through.  This is
           the default behavior.  -c only affects resumption of downloads started prior to this invocation of Wget, and whose local files are still sitting around.

           Without -c, the previous example would just download the remote file to ls-lR.Z.1, leaving the truncated ls-lR.Z file alone.

           If you use -c on a non-empty file, and the server does not support continued downloading, Wget will restart the download from scratch and overwrite the existing file entirely.

           Beginning with Wget 1.7, if you use -c on a file which is of equal size as the one on the server, Wget will refuse to download the file and print an explanatory message.  The same
           happens when the file is smaller on the server than locally (presumably because it was changed on the server since your last download attempt)---because "continuing" is not
           meaningful, no download occurs.

           On the other side of the coin, while using -c, any file that's bigger on the server than locally will be considered an incomplete download and only "(length(remote) -
           length(local))" bytes will be downloaded and tacked onto the end of the local file.  This behavior can be desirable in certain cases---for instance, you can use wget -c to
           download just the new portion that's been appended to a data collection or log file.

           However, if the file is bigger on the server because it's been changed, as opposed to just appended to, you'll end up with a garbled file.  Wget has no way of verifying that the
           local file is really a valid prefix of the remote file.  You need to be especially careful of this when using -c in conjunction with -r, since every file will be considered as an
           "incomplete download" candidate.

           Another instance where you'll get a garbled file if you try to use -c is if you have a lame HTTP proxy that inserts a "transfer interrupted" string into the local file.  In the
           future a "rollback" option may be added to deal with this case.

           Note that -c only works with FTP servers and with HTTP servers that support the "Range" header.

       --start-pos=OFFSET
           Start downloading at zero-based position OFFSET.  Offset may be expressed in bytes, kilobytes with the `k' suffix, or megabytes with the `m' suffix, etc.

           --start-pos has higher precedence over --continue.  When --start-pos and --continue are both specified, wget will emit a warning then proceed as if --continue was absent.

           Server support for continued download is required, otherwise --start-pos cannot help.  See -c for details.

```
