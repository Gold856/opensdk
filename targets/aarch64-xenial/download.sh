#! /usr/bin/env bash

source "$(dirname "$0")/version.env" || exit
source "$(dirname "$0")/../../scripts/downloads_tools.sh" || exit

signed sig https://ftp.gnu.org/gnu/gcc/gcc-${V_GCC}/gcc-${V_GCC}.tar.gz
signed sig https://ftp.gnu.org/gnu/binutils/binutils-${V_BIN}.tar.bz2
signed sig https://ftp.gnu.org/gnu/mpfr/mpfr-${V_MPFR}.tar.bz2
signed sig https://ftp.gnu.org/gnu/mpc/mpc-${V_MPC}.tar.gz
signed sig https://ftp.gnu.org/gnu/gmp/gmp-${V_GMP}.tar.bz2

signed asc https://sourceforge.net/projects/expat/files/expat/${Vw_EXPAT}/expat-${Vw_EXPAT}.tar.bz2

basic-download https://ftp.gnu.org/gnu/gdb/gdb-${V_GDB}.tar.gz
POOL="http://ports.ubuntu.com/pool/main/"
basic-download $POOL/g/gccgo-6/libgcc1_${Va_LIBGCCGO}_arm64.deb
basic-download $POOL/g/gccgo-6/libgcc1-dbg_${Va_LIBGCCGO}_arm64.deb
basic-download $POOL/g/gcc-5/libgcc-5-dev_${Va_LIBGCC}_arm64.deb
basic-download $POOL/g/gcc-5/libatomic1_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libatomic1-dbg_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libstdc++6_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libstdc++6-5-dbg_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libstdc++-5-dev_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libasan2_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libasan2-dbg_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libgomp1_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libgomp1-dbg_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libubsan0_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libubsan0-dbg_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libitm1_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/gcc-5/libitm1-dbg_${Va_LIBSTDCPP}_arm64.deb
basic-download $POOL/g/glibc/libc6_${Va_LIBC}_arm64.deb
basic-download $POOL/g/glibc/libc6-dbg_${Va_LIBC}_arm64.deb
basic-download $POOL/g/glibc/libc6-dev_${Va_LIBC}_arm64.deb
basic-download $POOL/l/linux/linux-libc-dev_${Va_LINUX}_arm64.deb

basic-download http://www.bastoul.net/cloog/pages/download/cloog-${V_CLOOG}.tar.gz
basic-download http://isl.gforge.inria.fr/isl-${V_ISL}.tar.bz2
