{ stdenv, callPackage, ignition, gts, glib, freeimage, ffmpeg, ... } @ args :

let
  ignition-cmake = ignition.cmake0;
  ignition-math = ignition.math4;
in (callPackage ./. ({
  majorVersion = "";
  version = "1.1.1";
  srcSha256 = "0z5cb8c806skcp7pn291k16lr2ffyn9g93763bv6sywsgf36b7jz";
  inherit ignition-cmake ignition-math;
} // args)).overrideDerivation ({
  propagatedBuildInputs ? [], ...
}: {
  propagatedBuildInputs = propagatedBuildInputs ++ [ ignition-math gts freeimage
    ffmpeg.dev ];
})
