require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54Jsmin < AbstractPhp54Extension
  init
  homepage 'http://pecl.php.net/package/jsmin'
  url 'http://pecl.php.net/get/jsmin-0.1.1.tgz'
  sha1 'b1abfb443ce5df80866fc9350a792f3be814f568'
  head 'https://github.com/sqmk/pecl-jsmin.git'

  def install
    Dir.chdir "jsmin-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/jsmin.so"
    write_config_file unless build.include? "without-config-file"
  end
end
