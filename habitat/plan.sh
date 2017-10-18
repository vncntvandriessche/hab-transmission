pkg_name=transmission
pkg_origin=transmission
pkg_version="2.92"
pkg_maintainer="vncntvandriessche <https://github.com/vncntvandriessche>"
pkg_license=('MIT')
# pkg_description=""
pkg_source="https://github.com/transmission/transmission-releases/raw/master/transmission-2.92.tar.xz"
pkg_filename="${pkg_name}-${pkg_version}.tar.xz"
pkg_shasum="3a8d045c306ad9acb7bf81126939b9594553a388482efa0ec1bfb67b22acd35f"

pkg_deps=(
  core/cacerts
  core/openssl
  core/zlib
)

pkg_build_deps=(
  core/curl
  core/gcc
  core/gettext
  core/intltool
  core/libevent
  core/make
  core/perl
  core/pkg-config
  core/zlib
)

pkg_exports=(
  [port]=network.port
)

do_build() {
  ./configure -q
  make -s
}

do_install() {
    make install
}

pkg_svc_run="/usr/local/bin/transmission-daemon --config-dir /var/lib/transmission-daemon --foreground"
