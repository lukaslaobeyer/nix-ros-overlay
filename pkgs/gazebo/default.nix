{ lib, stdenv, fetchurl, cmake, pkgconfig, ronn, gazeboSimulator, protobuf
, freeimage, libGL, curl, tinyxml, tinyxml-2, libtar, tbb, ogre1_9, ffmpeg
, libusb, sdformat ? gazeboSimulator.sdformat, qt5, qt ? qt5.qtbase, boost
, libxslt, libuuid, ignition, ignition-cmake ? ignition.cmake0
, ignition-msgs ? ignition.msgs1, ignition-math ? ignition.math4
, ignition-transport ? ignition.transport4, qwt6

, openal, withAudioSupport ? false
, doxygen, withDocs ? true
, bullet, withBulletEngineSupport ? false
, graphviz, withModelEditorSchematicView ? true # graphviz needed for this view
, gdal, withDigitalElevationTerrainsSupport ? true
, gts, withConstructiveSolidGeometrySupport ? true
, hdf5, withHdf5Support ? true
, version ? "10.1.0"
, srcSha256 ? "11s2djrzz4w18pdiybzvpl8z4qzmh77aj456rp4jhjbhjy3cy7wa"
, ... }: with lib;

stdenv.mkDerivation rec {
  pname = "gazebo";
  inherit version;

  src = fetchurl {
    url = "https://osrf-distributions.s3.amazonaws.com/gazebo/releases/${pname}-${version}.tar.bz2";
    sha256 = srcSha256;
  };

  enableParallelBuilding = true;

  cmakeFlags = [
    "-DCMAKE_INSTALL_LIBDIR:PATH=lib"
    "-DCMAKE_INSTALL_INCLUDEDIR=include"
    "-DUSE_HOST_CFLAGS=False"
  ];

  nativeBuildInputs = [ cmake pkgconfig ronn ] ++ optional (versionAtLeast version "8") qt5.wrapQtAppsHook;
  propagatedNativeBuildInputs = [ pkgconfig ];

  buildInputs = [
    libGL
    curl
    tinyxml
    tinyxml-2
    libtar
    libusb
    qt
    libxslt
    libuuid
    ignition-cmake
    qwt6
  ] ++ optional withAudioSupport openal
    ++ optional withBulletEngineSupport bullet
    ++ optional withModelEditorSchematicView graphviz
    ++ optional withDigitalElevationTerrainsSupport gdal
    ++ optional withConstructiveSolidGeometrySupport gts
    ++ optional withHdf5Support hdf5;

  propagatedBuildInputs = [
    freeimage
    boost
    protobuf
    sdformat
    tbb
    ogre1_9
    ffmpeg
    ignition-math
    ignition-transport
    ignition-msgs
  ];

  meta = {
    homepage = http://gazebosim.org/;
    description = "Multi-robot simulator for outdoor environments";
    license = licenses.asl20;
    maintainers = with maintainers; [ pxc lopsided98 ];
  };
}
