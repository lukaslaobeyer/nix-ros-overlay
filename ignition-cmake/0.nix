{ stdenv, callPackage, ... } @ args :

callPackage ./. ({
  majorVersion = "";
  version = "0.6.1";
  srcSha256 = "0zj9rra6hr5l9x32xbdvghwj1izrriqv5ljay2widsgmx8znqy5s";
} // args)
