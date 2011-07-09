require 'formula'

class Gauche <Formula
  url 'http://prdownloads.sourceforge.net/gauche/Gauche-0.9.1.tgz'
  homepage ''
  md5 '6134e9c16aef2bc9fd3fa7e8fbebdd10'
  head 'https://gauche.svn.sourceforge.net/svnroot/gauche/Gauche/trunk/'

  # depends_on 'cmake'

  def install
    system "./configure","--enable-threads=pthreads","--enable-multibyte=utf-8"
    # system "cmake . #{std_cmake_parameters}"
    system "make"
    system "make install"
  end
end
