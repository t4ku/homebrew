require 'formula'

class Exiftool < Formula
  url 'http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-8.60.tar.gz'
  homepage 'http://www.sno.phy.queensu.ca/~phil/exiftool/index.html'
  md5 '0a80c7a9b16b3d7d48b5be2e42643f7b'

  def install
    system "perl", "Makefile.PL"
    system "make", "test"

    # Install privately to the Cellar
    libexec.install ["exiftool", "lib"]

    # Link the executable script into "bin"
    bin.mkpath
    (bin + 'exiftool').write <<-EOBIN
#!/bin/bash

which_exiftool=`which $0`
dirname_exiftool=$(dirname $which_exiftool)
readlink_exiftool=$(readlink $which_exiftool)
dirname_unlinked_exiftool=$(dirname $dirname_exiftool/$readlink_exiftool)
$dirname_unlinked_exiftool/../libexec/exiftool "$@"
EOBIN
  end
end
