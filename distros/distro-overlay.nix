{ distro, python }:
self: super:
let
  base = rosSelf: rosSuper: {
    lib = super.lib // import ../lib { inherit self rosSelf; };
  
    callPackage = self.newScope rosSelf;

    buildRosPackage = rosSelf.callPackage ./build-ros-package { };

    buildEnv = rosSelf.callPackage ./build-env {
      inherit (self) buildEnv;
    };

    inherit python;
    pythonPackages = rosSelf.python.pkgs;

    boost = self.boost.override {
      python = rosSelf.python;
      enablePython = true;
    };
  };

  overrides = rosSelf: rosSuper: with rosSelf.lib; {
    # ROS package overrides/fixups

    urdfdom = self.urdfdom;
    urdfdom-headers = self.urdfdom-headers;

    ament-cmake-core = rosSuper.ament-cmake-core.overrideAttrs ({
      propagatedBuildInputs ? [], ...
    }: {
      propagatedBuildInputs = [ self.cmake rosSelf.ament-package ] ++ propagatedBuildInputs;
      setupHook = ./ament-cmake-core-setup-hook.sh;
    });

    camera-calibration-parsers = patchBoostPython rosSuper.camera-calibration-parsers;

    catkin = rosSuper.catkin.overrideAttrs ({
      propagatedBuildInputs ? [],
      prePhases ? [],
      postPatch ? "", ...
    }: let
      setupHook = self.callPackage ./catkin-setup-hook { } distro;
    in {
      propagatedBuildInputs = [ self.cmake setupHook ] ++ propagatedBuildInputs;

      postPatch = postPatch + ''
        patchShebangs cmake
        substituteInPlace cmake/templates/python_distutils_install.sh.in \
          --replace /usr/bin/env "${self.coreutils}/bin/env"
      '';
    });

    # Packages that depend on catkin-pip still fail because they try to
    # download from the internet, but it should work outside of Nix builds.
    catkin-pip = rosSuper.catkin-pip.overrideAttrs ({
      postPatch ? "", ...
    }: {
      postPatch = postPatch + ''
        patchShebangs cmake
        substituteInPlace cmake/scripts/path_prepend.sh \
          --replace /bin/sed "${self.gnused}/bin/sed"
        substituteInPlace cmake/catkin-pip-prefix.cmake.in \
          --replace NO_SYSTEM_ENVIRONMENT_PATH ""
      '';
    });

    cob-light = patchBoostSignals rosSuper.cob-light;

    cv-bridge = (patchBoostPython rosSuper.cv-bridge).overrideAttrs ({
      propagatedBuildInputs ? [], ...
    }: {
      propagatedBuildInputs = propagatedBuildInputs ++ [ rosSelf.pythonPackages.opencv3 ];
    });

    dynamic-reconfigure = rosSuper.dynamic-reconfigure.overrideAttrs ({
      postPatch ? "", ...
    }: {
      postPatch = postPatch + ''
        substituteInPlace cmake/setup_custom_pythonpath.sh.in \
          --replace '#!/usr/bin/env sh' '#!${self.stdenv.shell}'
      '';
    });

    fake-localization = patchBoostSignals rosSuper.fake-localization;

    fmilibrary-vendor = patchVendorUrl rosSuper.fmilibrary-vendor {
      url = "https://jmodelica.org/fmil/FMILibrary-2.0.3-src.zip";
      sha256 = "16lx6355zskrb7wgw2bzdzms36pcjyl2ry03wgsac5215jg1zhjc";
    };

    # This build system contains fractal levels of stupidity
    foonathan-memory-vendor = patchVendorGit rosSuper.foonathan-memory-vendor {
      url = "https://github.com/foonathan/memory.git";
      sha256 = "1n7xxi61wzpixb3kldnl826syb4yml613q4i38d0cciydhy1gwzl";
      fetchgitArgs = {
        # Needed by the postFetch, then removed there
        leaveDotGit = true;
        # Prevent the build system from trying to download random files
        postFetch = ''
          cd "$out/cmake/comp"
          git fetch https://github.com/foonathan/compatibility.git
          git checkout -f cf13bff238397aab0d8c49b7f6263233cf8a2396
          sed -i 's|\(set(COMP_REMOTE_URL\s\).*|\1"file://''${CMAKE_CURRENT_LIST_DIR}/")|' \
            comp_base.cmake
          rm -rf "$out/.git"
        '';
      };
    };

    gazebo-ros = rosSuper.gazebo-ros.overrideAttrs ({ ... }:{
      setupHook = ./gazebo-ros-setup-hook.sh;
    });

    gmapping = patchBoostSignals rosSuper.gmapping;

    image-cb-detector = patchBoostSignals rosSuper.image-cb-detector;

    laser-cb-detector = patchBoostSignals rosSuper.laser-cb-detector;

    libphidget21 = patchVendorUrl rosSuper.libphidget21 {
      url = "https://www.phidgets.com/downloads/phidget21/libraries/linux/libphidget/libphidget_2.1.9.20190409.tar.gz";
      sha256 = "07w54dmr75vq2imngfy66nk1sxlvkzhl2p6g362q0a02f099jy0f";
    };

    libphidget22 = patchVendorUrl rosSuper.libphidget22 {
      url = "https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22/libphidget22-1.4.20190605.tar.gz";
      sha256 = "1ab4d7ngvx009vajqv3kxw0s77z0hdd9xb8in1mvx86i1l3vndxa";
    };

    libphidgets = patchVendorUrl rosSuper.libphidgets {
      url = "https://www.phidgets.com/downloads/phidget21/libraries/linux/libphidget/libphidget_2.1.8.20151217.tar.gz";
      sha256 = "0lpaskqxpklm05050wwvdqwhw30f2hpzss8sgyvczdpvvqzjg4vk";
    };

    libyaml-vendor = patchVendorUrl rosSuper.libyaml-vendor {
      url = "https://github.com/yaml/libyaml/archive/10c907871f1ccd779c7fccf6b81a62762b5c4e7b.zip";
      sha256 = "0v6ks4hpxmakgymcfvafynla76gl3866grgwf4vjdsb4rsvr13vx";
    };

    map-server = rosSuper.map-server.overrideAttrs ({
      nativeBuildInputs ? [], ...
    }: {
      nativeBuildInputs = nativeBuildInputs ++ [ self.pkgconfig ];
    });

    message-filters = patchBoostSignals rosSuper.message-filters;

    message-relay = rosSuper.message-relay.overrideAttrs ({
      postPatch ? "", ...
    }: {
      postPatch = postPatch + ''
        patchShebangs scripts
      '';
    });

    pr2-tilt-laser-interface = patchBoostSignals rosSuper.pr2-tilt-laser-interface;

    python-qt-binding = rosSuper.python-qt-binding.overrideAttrs ({
      propagatedNativeBuildInputs ? [],
      postPatch ? "", ...
    }: {
      propagatedNativeBuildInputs = propagatedNativeBuildInputs ++ [ rosSelf.pythonPackages.sip ];
      postPatch = ''
        sed -e "s#sipconfig\._pkg_config\['default_sip_dir'\]#'${rosSelf.pythonPackages.pyqt5}/share/sip'#" \
            -e "s#qtconfig\['QT_INSTALL_HEADERS'\]#'${self.qt5.qtbase.dev}/include'#g" \
            -i cmake/sip_configure.py
      '' + postPatch;

      setupHook = self.writeText "python-qt-binding-setup-hook" ''
        _pythonQtBindingPreFixupHook() {
          # Prevent /build RPATH references
          rm -rf devel/lib
        }
        preFixupHooks+=(_pythonQtBindingPreFixupHook)
      '';
    });

    roscpp = patchBoostSignals rosSuper.roscpp;

    rosidl-default-runtime = rosSuper.rosidl-default-runtime.overrideAttrs ({
      propagatedBuildInputs ? [], ...
    }: {
      propagatedBuildInputs = [ rosSelf.rmw-fastrtps-cpp ] ++ propagatedBuildInputs;
    });

    rqt-gui = rosSuper.rqt-gui.overrideAttrs ({
      nativeBuildInputs ? [],
      postFixup ? "", ...
    }: {
      nativeBuildInputs = nativeBuildInputs ++ [ self.makeWrapper ];

      postFixup = ''
        wrapProgram $out/bin/rqt \
          --prefix QT_PLUGIN_PATH : "${self.qt5.qtbase.bin}/${self.qt5.qtbase.qtPluginPrefix}"
      '' + postFixup;
    });

    rviz = rosSuper.rviz.overrideAttrs ({
      nativeBuildInputs ? [],
      postFixup ? "", ...
    }: {
      nativeBuildInputs = nativeBuildInputs ++ [ self.makeWrapper ];

      postFixup = ''
        wrapProgram $out/bin/rviz \
          --prefix QT_PLUGIN_PATH : "${self.qt5.qtbase.bin}/${self.qt5.qtbase.qtPluginPrefix}"
      '' + postFixup;
    });

    rviz-ogre-vendor = rosSuper.rviz-ogre-vendor.overrideAttrs ({
      preFixup ? "", ...
    }: {
      dontFixCmake = true;
      preFixup = ''
        # Prevent /build RPATH references
        rm -r ogre_install
      '' + preFixup;
    });

    rxcpp-vendor = patchVendorUrl rosSuper.rxcpp-vendor {
      url = "https://github.com/ReactiveX/RxCpp/archive/v4.1.0.tar.gz";
      sha256 = "1smxrcm0s6bz05185dx1i2xjgn47rq7m247pblil6p3bmk3lkfyk";
    };

    shared-queues-vendor = patchVendorUrl (patchVendorUrl rosSuper.shared-queues-vendor {
      url = "https://github.com/cameron314/concurrentqueue/archive/8f65a8734d77c3cc00d74c0532efca872931d3ce.zip";
      sha256 = "0cmsmgc87ndd9hiv187xkvjkn8fipn3hsijjc864h2lfcyigbxq1";
    }) {
      url = "https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
      sha256 = "1255n51y1bjry97n4w60mgz6b9h14flfrxb01ihjf6pwvvfns8ag";
    };

    tf = patchBoostSignals rosSuper.tf;

    tf2 = patchBoostSignals rosSuper.tf2;

    tinydir-vendor = patchVendorUrl rosSuper.tinydir-vendor {
      url = "https://github.com/cxong/tinydir/archive/1.2.4.tar.gz";
      sha256 = "1qjwky7v4b9d9dmxzsybnhiz6xgx94grc67sdyvlp1d4kfkfsl4w";
    };

    uncrustify-vendor = patchVendorUrl rosSuper.uncrustify-vendor {
      url = "https://github.com/uncrustify/uncrustify/archive/uncrustify-0.68.1.tar.gz";
      sha256 = "04ndwhcn9iv3cy4p5wgh5z0vx2sywqlydyympn9m3h5458w1aijh";
    };

    urdf = patchBoostPython rosSuper.urdf;

    yaml-cpp-vendor = patchVendorUrl rosSuper.yaml-cpp-vendor {
      url = "https://github.com/jbeder/yaml-cpp/archive/0f9a586ca1dc29c2ecb8dd715a315b93e3f40f79.zip";
      sha256 = "1g45f71mk4gyca550177qf70v5cvavlsalmg7x8bi59j6z6f0mgz";
    };
  };
in self.rosPackages.lib.mkOverlay [
  base
  (import (./. + "/${distro}/generated.nix"))
  overrides
  (import (./. + "/${distro}/overrides.nix") self)
]
