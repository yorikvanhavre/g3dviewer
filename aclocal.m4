# generated automatically by aclocal 1.7.9 -*- Autoconf -*-

# Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2002
# Free Software Foundation, Inc.
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

# Like AC_CONFIG_HEADER, but automatically create stamp file. -*- Autoconf -*-

# Copyright 1996, 1997, 2000, 2001 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

AC_PREREQ([2.52])

# serial 6

# AM_CONFIG_HEADER is obsolete.  It has been replaced by AC_CONFIG_HEADERS.
AU_DEFUN([AM_CONFIG_HEADER], [AC_CONFIG_HEADERS($@)])

# Do all the work for Automake.                            -*- Autoconf -*-

# This macro actually does too much some checks are only needed if
# your package does certain things.  But this isn't really a big deal.

# Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003
# Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

# serial 10

AC_PREREQ([2.54])

# Autoconf 2.50 wants to disallow AM_ names.  We explicitly allow
# the ones we care about.
m4_pattern_allow([^AM_[A-Z]+FLAGS$])dnl

# AM_INIT_AUTOMAKE(PACKAGE, VERSION, [NO-DEFINE])
# AM_INIT_AUTOMAKE([OPTIONS])
# -----------------------------------------------
# The call with PACKAGE and VERSION arguments is the old style
# call (pre autoconf-2.50), which is being phased out.  PACKAGE
# and VERSION should now be passed to AC_INIT and removed from
# the call to AM_INIT_AUTOMAKE.
# We support both call styles for the transition.  After
# the next Automake release, Autoconf can make the AC_INIT
# arguments mandatory, and then we can depend on a new Autoconf
# release and drop the old call support.
AC_DEFUN([AM_INIT_AUTOMAKE],
[AC_REQUIRE([AM_SET_CURRENT_AUTOMAKE_VERSION])dnl
 AC_REQUIRE([AC_PROG_INSTALL])dnl
# test to see if srcdir already configured
if test "`cd $srcdir && pwd`" != "`pwd`" &&
   test -f $srcdir/config.status; then
  AC_MSG_ERROR([source directory already configured; run "make distclean" there first])
fi

# test whether we have cygpath
if test -z "$CYGPATH_W"; then
  if (cygpath --version) >/dev/null 2>/dev/null; then
    CYGPATH_W='cygpath -w'
  else
    CYGPATH_W=echo
  fi
fi
AC_SUBST([CYGPATH_W])

# Define the identity of the package.
dnl Distinguish between old-style and new-style calls.
m4_ifval([$2],
[m4_ifval([$3], [_AM_SET_OPTION([no-define])])dnl
 AC_SUBST([PACKAGE], [$1])dnl
 AC_SUBST([VERSION], [$2])],
[_AM_SET_OPTIONS([$1])dnl
 AC_SUBST([PACKAGE], ['AC_PACKAGE_TARNAME'])dnl
 AC_SUBST([VERSION], ['AC_PACKAGE_VERSION'])])dnl

_AM_IF_OPTION([no-define],,
[AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE", [Name of package])
 AC_DEFINE_UNQUOTED(VERSION, "$VERSION", [Version number of package])])dnl

# Some tools Automake needs.
AC_REQUIRE([AM_SANITY_CHECK])dnl
AC_REQUIRE([AC_ARG_PROGRAM])dnl
AM_MISSING_PROG(ACLOCAL, aclocal-${am__api_version})
AM_MISSING_PROG(AUTOCONF, autoconf)
AM_MISSING_PROG(AUTOMAKE, automake-${am__api_version})
AM_MISSING_PROG(AUTOHEADER, autoheader)
AM_MISSING_PROG(MAKEINFO, makeinfo)
AM_MISSING_PROG(AMTAR, tar)
AM_PROG_INSTALL_SH
AM_PROG_INSTALL_STRIP
# We need awk for the "check" target.  The system "awk" is bad on
# some platforms.
AC_REQUIRE([AC_PROG_AWK])dnl
AC_REQUIRE([AC_PROG_MAKE_SET])dnl
AC_REQUIRE([AM_SET_LEADING_DOT])dnl

_AM_IF_OPTION([no-dependencies],,
[AC_PROVIDE_IFELSE([AC_PROG_CC],
                  [_AM_DEPENDENCIES(CC)],
                  [define([AC_PROG_CC],
                          defn([AC_PROG_CC])[_AM_DEPENDENCIES(CC)])])dnl
AC_PROVIDE_IFELSE([AC_PROG_CXX],
                  [_AM_DEPENDENCIES(CXX)],
                  [define([AC_PROG_CXX],
                          defn([AC_PROG_CXX])[_AM_DEPENDENCIES(CXX)])])dnl
])
])


# When config.status generates a header, we must update the stamp-h file.
# This file resides in the same directory as the config header
# that is generated.  The stamp files are numbered to have different names.

# Autoconf calls _AC_AM_CONFIG_HEADER_HOOK (when defined) in the
# loop where config.status creates the headers, so we can generate
# our stamp files there.
AC_DEFUN([_AC_AM_CONFIG_HEADER_HOOK],
[# Compute $1's index in $config_headers.
_am_stamp_count=1
for _am_header in $config_headers :; do
  case $_am_header in
    $1 | $1:* )
      break ;;
    * )
      _am_stamp_count=`expr $_am_stamp_count + 1` ;;
  esac
done
echo "timestamp for $1" >`AS_DIRNAME([$1])`/stamp-h[]$_am_stamp_count])

# Copyright 2002  Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA

# AM_AUTOMAKE_VERSION(VERSION)
# ----------------------------
# Automake X.Y traces this macro to ensure aclocal.m4 has been
# generated from the m4 files accompanying Automake X.Y.
AC_DEFUN([AM_AUTOMAKE_VERSION],[am__api_version="1.7"])

# AM_SET_CURRENT_AUTOMAKE_VERSION
# -------------------------------
# Call AM_AUTOMAKE_VERSION so it can be traced.
# This function is AC_REQUIREd by AC_INIT_AUTOMAKE.
AC_DEFUN([AM_SET_CURRENT_AUTOMAKE_VERSION],
	 [AM_AUTOMAKE_VERSION([1.7.9])])

# Helper functions for option handling.                    -*- Autoconf -*-

# Copyright 2001, 2002  Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

# serial 2

# _AM_MANGLE_OPTION(NAME)
# -----------------------
AC_DEFUN([_AM_MANGLE_OPTION],
[[_AM_OPTION_]m4_bpatsubst($1, [[^a-zA-Z0-9_]], [_])])

# _AM_SET_OPTION(NAME)
# ------------------------------
# Set option NAME.  Presently that only means defining a flag for this option.
AC_DEFUN([_AM_SET_OPTION],
[m4_define(_AM_MANGLE_OPTION([$1]), 1)])

# _AM_SET_OPTIONS(OPTIONS)
# ----------------------------------
# OPTIONS is a space-separated list of Automake options.
AC_DEFUN([_AM_SET_OPTIONS],
[AC_FOREACH([_AM_Option], [$1], [_AM_SET_OPTION(_AM_Option)])])

# _AM_IF_OPTION(OPTION, IF-SET, [IF-NOT-SET])
# -------------------------------------------
# Execute IF-SET if OPTION is set, IF-NOT-SET otherwise.
AC_DEFUN([_AM_IF_OPTION],
[m4_ifset(_AM_MANGLE_OPTION([$1]), [$2], [$3])])

#
# Check to make sure that the build environment is sane.
#

# Copyright 1996, 1997, 2000, 2001 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

# serial 3

# AM_SANITY_CHECK
# ---------------
AC_DEFUN([AM_SANITY_CHECK],
[AC_MSG_CHECKING([whether build environment is sane])
# Just in case
sleep 1
echo timestamp > conftest.file
# Do `set' in a subshell so we don't clobber the current shell's
# arguments.  Must try -L first in case configure is actually a
# symlink; some systems play weird games with the mod time of symlinks
# (eg FreeBSD returns the mod time of the symlink's containing
# directory).
if (
   set X `ls -Lt $srcdir/configure conftest.file 2> /dev/null`
   if test "$[*]" = "X"; then
      # -L didn't work.
      set X `ls -t $srcdir/configure conftest.file`
   fi
   rm -f conftest.file
   if test "$[*]" != "X $srcdir/configure conftest.file" \
      && test "$[*]" != "X conftest.file $srcdir/configure"; then

      # If neither matched, then we have a broken ls.  This can happen
      # if, for instance, CONFIG_SHELL is bash and it inherits a
      # broken ls alias from the environment.  This has actually
      # happened.  Such a system could not be considered "sane".
      AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
alias in your environment])
   fi

   test "$[2]" = conftest.file
   )
then
   # Ok.
   :
else
   AC_MSG_ERROR([newly created file is older than distributed files!
Check your system clock])
fi
AC_MSG_RESULT(yes)])

#  -*- Autoconf -*-


# Copyright 1997, 1999, 2000, 2001 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

# serial 3

# AM_MISSING_PROG(NAME, PROGRAM)
# ------------------------------
AC_DEFUN([AM_MISSING_PROG],
[AC_REQUIRE([AM_MISSING_HAS_RUN])
$1=${$1-"${am_missing_run}$2"}
AC_SUBST($1)])


# AM_MISSING_HAS_RUN
# ------------------
# Define MISSING if not defined so far and test if it supports --run.
# If it does, set am_missing_run to use it, otherwise, to nothing.
AC_DEFUN([AM_MISSING_HAS_RUN],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
test x"${MISSING+set}" = xset || MISSING="\${SHELL} $am_aux_dir/missing"
# Use eval to expand $SHELL
if eval "$MISSING --run true"; then
  am_missing_run="$MISSING --run "
else
  am_missing_run=
  AC_MSG_WARN([`missing' script is too old or missing])
fi
])

# AM_AUX_DIR_EXPAND

# Copyright 2001 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

# For projects using AC_CONFIG_AUX_DIR([foo]), Autoconf sets
# $ac_aux_dir to `$srcdir/foo'.  In other projects, it is set to
# `$srcdir', `$srcdir/..', or `$srcdir/../..'.
#
# Of course, Automake must honor this variable whenever it calls a
# tool from the auxiliary directory.  The problem is that $srcdir (and
# therefore $ac_aux_dir as well) can be either absolute or relative,
# depending on how configure is run.  This is pretty annoying, since
# it makes $ac_aux_dir quite unusable in subdirectories: in the top
# source directory, any form will work fine, but in subdirectories a
# relative path needs to be adjusted first.
#
# $ac_aux_dir/missing
#    fails when called from a subdirectory if $ac_aux_dir is relative
# $top_srcdir/$ac_aux_dir/missing
#    fails if $ac_aux_dir is absolute,
#    fails when called from a subdirectory in a VPATH build with
#          a relative $ac_aux_dir
#
# The reason of the latter failure is that $top_srcdir and $ac_aux_dir
# are both prefixed by $srcdir.  In an in-source build this is usually
# harmless because $srcdir is `.', but things will broke when you
# start a VPATH build or use an absolute $srcdir.
#
# So we could use something similar to $top_srcdir/$ac_aux_dir/missing,
# iff we strip the leading $srcdir from $ac_aux_dir.  That would be:
#   am_aux_dir='\$(top_srcdir)/'`expr "$ac_aux_dir" : "$srcdir//*\(.*\)"`
# and then we would define $MISSING as
#   MISSING="\${SHELL} $am_aux_dir/missing"
# This will work as long as MISSING is not called from configure, because
# unfortunately $(top_srcdir) has no meaning in configure.
# However there are other variables, like CC, which are often used in
# configure, and could therefore not use this "fixed" $ac_aux_dir.
#
# Another solution, used here, is to always expand $ac_aux_dir to an
# absolute PATH.  The drawback is that using absolute paths prevent a
# configured tree to be moved without reconfiguration.

# Rely on autoconf to set up CDPATH properly.
AC_PREREQ([2.50])

AC_DEFUN([AM_AUX_DIR_EXPAND], [
# expand $ac_aux_dir to an absolute path
am_aux_dir=`cd $ac_aux_dir && pwd`
])

# AM_PROG_INSTALL_SH
# ------------------
# Define $install_sh.

# Copyright 2001 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

AC_DEFUN([AM_PROG_INSTALL_SH],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
install_sh=${install_sh-"$am_aux_dir/install-sh"}
AC_SUBST(install_sh)])

# AM_PROG_INSTALL_STRIP

# Copyright 2001 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

# One issue with vendor `install' (even GNU) is that you can't
# specify the program used to strip binaries.  This is especially
# annoying in cross-compiling environments, where the build's strip
# is unlikely to handle the host's binaries.
# Fortunately install-sh will honor a STRIPPROG variable, so we
# always use install-sh in `make install-strip', and initialize
# STRIPPROG with the value of the STRIP variable (set by the user).
AC_DEFUN([AM_PROG_INSTALL_STRIP],
[AC_REQUIRE([AM_PROG_INSTALL_SH])dnl
# Installed binaries are usually stripped using `strip' when the user
# run `make install-strip'.  However `strip' might not be the right
# tool to use in cross-compilation environments, therefore Automake
# will honor the `STRIP' environment variable to overrule this program.
dnl Don't test for $cross_compiling = yes, because it might be `maybe'.
if test "$cross_compiling" != no; then
  AC_CHECK_TOOL([STRIP], [strip], :)
fi
INSTALL_STRIP_PROGRAM="\${SHELL} \$(install_sh) -c -s"
AC_SUBST([INSTALL_STRIP_PROGRAM])])

#                                                          -*- Autoconf -*-
# Copyright (C) 2003  Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

# serial 1

# Check whether the underlying file-system supports filenames
# with a leading dot.  For instance MS-DOS doesn't.
AC_DEFUN([AM_SET_LEADING_DOT],
[rm -rf .tst 2>/dev/null
mkdir .tst 2>/dev/null
if test -d .tst; then
  am__leading_dot=.
else
  am__leading_dot=_
fi
rmdir .tst 2>/dev/null
AC_SUBST([am__leading_dot])])

# serial 5						-*- Autoconf -*-

# Copyright (C) 1999, 2000, 2001, 2002, 2003  Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.


# There are a few dirty hacks below to avoid letting `AC_PROG_CC' be
# written in clear, in which case automake, when reading aclocal.m4,
# will think it sees a *use*, and therefore will trigger all it's
# C support machinery.  Also note that it means that autoscan, seeing
# CC etc. in the Makefile, will ask for an AC_PROG_CC use...



# _AM_DEPENDENCIES(NAME)
# ----------------------
# See how the compiler implements dependency checking.
# NAME is "CC", "CXX", "GCJ", or "OBJC".
# We try a few techniques and use that to set a single cache variable.
#
# We don't AC_REQUIRE the corresponding AC_PROG_CC since the latter was
# modified to invoke _AM_DEPENDENCIES(CC); we would have a circular
# dependency, and given that the user is not expected to run this macro,
# just rely on AC_PROG_CC.
AC_DEFUN([_AM_DEPENDENCIES],
[AC_REQUIRE([AM_SET_DEPDIR])dnl
AC_REQUIRE([AM_OUTPUT_DEPENDENCY_COMMANDS])dnl
AC_REQUIRE([AM_MAKE_INCLUDE])dnl
AC_REQUIRE([AM_DEP_TRACK])dnl

ifelse([$1], CC,   [depcc="$CC"   am_compiler_list=],
       [$1], CXX,  [depcc="$CXX"  am_compiler_list=],
       [$1], OBJC, [depcc="$OBJC" am_compiler_list='gcc3 gcc'],
       [$1], GCJ,  [depcc="$GCJ"  am_compiler_list='gcc3 gcc'],
                   [depcc="$$1"   am_compiler_list=])

AC_CACHE_CHECK([dependency style of $depcc],
               [am_cv_$1_dependencies_compiler_type],
[if test -z "$AMDEP_TRUE" && test -f "$am_depcomp"; then
  # We make a subdir and do the tests there.  Otherwise we can end up
  # making bogus files that we don't know about and never remove.  For
  # instance it was reported that on HP-UX the gcc test will end up
  # making a dummy file named `D' -- because `-MD' means `put the output
  # in D'.
  mkdir conftest.dir
  # Copy depcomp to subdir because otherwise we won't find it if we're
  # using a relative directory.
  cp "$am_depcomp" conftest.dir
  cd conftest.dir
  # We will build objects and dependencies in a subdirectory because
  # it helps to detect inapplicable dependency modes.  For instance
  # both Tru64's cc and ICC support -MD to output dependencies as a
  # side effect of compilation, but ICC will put the dependencies in
  # the current directory while Tru64 will put them in the object
  # directory.
  mkdir sub

  am_cv_$1_dependencies_compiler_type=none
  if test "$am_compiler_list" = ""; then
     am_compiler_list=`sed -n ['s/^#*\([a-zA-Z0-9]*\))$/\1/p'] < ./depcomp`
  fi
  for depmode in $am_compiler_list; do
    # Setup a source with many dependencies, because some compilers
    # like to wrap large dependency lists on column 80 (with \), and
    # we should not choose a depcomp mode which is confused by this.
    #
    # We need to recreate these files for each test, as the compiler may
    # overwrite some of them when testing with obscure command lines.
    # This happens at least with the AIX C compiler.
    : > sub/conftest.c
    for i in 1 2 3 4 5 6; do
      echo '#include "conftst'$i'.h"' >> sub/conftest.c
      : > sub/conftst$i.h
    done
    echo "${am__include} ${am__quote}sub/conftest.Po${am__quote}" > confmf

    case $depmode in
    nosideeffect)
      # after this tag, mechanisms are not by side-effect, so they'll
      # only be used when explicitly requested
      if test "x$enable_dependency_tracking" = xyes; then
	continue
      else
	break
      fi
      ;;
    none) break ;;
    esac
    # We check with `-c' and `-o' for the sake of the "dashmstdout"
    # mode.  It turns out that the SunPro C++ compiler does not properly
    # handle `-M -o', and we need to detect this.
    if depmode=$depmode \
       source=sub/conftest.c object=sub/conftest.${OBJEXT-o} \
       depfile=sub/conftest.Po tmpdepfile=sub/conftest.TPo \
       $SHELL ./depcomp $depcc -c -o sub/conftest.${OBJEXT-o} sub/conftest.c \
         >/dev/null 2>conftest.err &&
       grep sub/conftst6.h sub/conftest.Po > /dev/null 2>&1 &&
       grep sub/conftest.${OBJEXT-o} sub/conftest.Po > /dev/null 2>&1 &&
       ${MAKE-make} -s -f confmf > /dev/null 2>&1; then
      # icc doesn't choke on unknown options, it will just issue warnings
      # (even with -Werror).  So we grep stderr for any message
      # that says an option was ignored.
      if grep 'ignoring option' conftest.err >/dev/null 2>&1; then :; else
        am_cv_$1_dependencies_compiler_type=$depmode
        break
      fi
    fi
  done

  cd ..
  rm -rf conftest.dir
else
  am_cv_$1_dependencies_compiler_type=none
fi
])
AC_SUBST([$1DEPMODE], [depmode=$am_cv_$1_dependencies_compiler_type])
AM_CONDITIONAL([am__fastdep$1], [
  test "x$enable_dependency_tracking" != xno \
  && test "$am_cv_$1_dependencies_compiler_type" = gcc3])
])


# AM_SET_DEPDIR
# -------------
# Choose a directory name for dependency files.
# This macro is AC_REQUIREd in _AM_DEPENDENCIES
AC_DEFUN([AM_SET_DEPDIR],
[AC_REQUIRE([AM_SET_LEADING_DOT])dnl
AC_SUBST([DEPDIR], ["${am__leading_dot}deps"])dnl
])


# AM_DEP_TRACK
# ------------
AC_DEFUN([AM_DEP_TRACK],
[AC_ARG_ENABLE(dependency-tracking,
[  --disable-dependency-tracking Speeds up one-time builds
  --enable-dependency-tracking  Do not reject slow dependency extractors])
if test "x$enable_dependency_tracking" != xno; then
  am_depcomp="$ac_aux_dir/depcomp"
  AMDEPBACKSLASH='\'
fi
AM_CONDITIONAL([AMDEP], [test "x$enable_dependency_tracking" != xno])
AC_SUBST([AMDEPBACKSLASH])
])

# Generate code to set up dependency tracking.   -*- Autoconf -*-

# Copyright 1999, 2000, 2001, 2002 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

#serial 2

# _AM_OUTPUT_DEPENDENCY_COMMANDS
# ------------------------------
AC_DEFUN([_AM_OUTPUT_DEPENDENCY_COMMANDS],
[for mf in $CONFIG_FILES; do
  # Strip MF so we end up with the name of the file.
  mf=`echo "$mf" | sed -e 's/:.*$//'`
  # Check whether this is an Automake generated Makefile or not.
  # We used to match only the files named `Makefile.in', but
  # some people rename them; so instead we look at the file content.
  # Grep'ing the first line is not enough: some people post-process
  # each Makefile.in and add a new line on top of each file to say so.
  # So let's grep whole file.
  if grep '^#.*generated by automake' $mf > /dev/null 2>&1; then
    dirpart=`AS_DIRNAME("$mf")`
  else
    continue
  fi
  grep '^DEP_FILES *= *[[^ @%:@]]' < "$mf" > /dev/null || continue
  # Extract the definition of DEP_FILES from the Makefile without
  # running `make'.
  DEPDIR=`sed -n -e '/^DEPDIR = / s///p' < "$mf"`
  test -z "$DEPDIR" && continue
  # When using ansi2knr, U may be empty or an underscore; expand it
  U=`sed -n -e '/^U = / s///p' < "$mf"`
  test -d "$dirpart/$DEPDIR" || mkdir "$dirpart/$DEPDIR"
  # We invoke sed twice because it is the simplest approach to
  # changing $(DEPDIR) to its actual value in the expansion.
  for file in `sed -n -e '
    /^DEP_FILES = .*\\\\$/ {
      s/^DEP_FILES = //
      :loop
	s/\\\\$//
	p
	n
	/\\\\$/ b loop
      p
    }
    /^DEP_FILES = / s/^DEP_FILES = //p' < "$mf" | \
       sed -e 's/\$(DEPDIR)/'"$DEPDIR"'/g' -e 's/\$U/'"$U"'/g'`; do
    # Make sure the directory exists.
    test -f "$dirpart/$file" && continue
    fdir=`AS_DIRNAME(["$file"])`
    AS_MKDIR_P([$dirpart/$fdir])
    # echo "creating $dirpart/$file"
    echo '# dummy' > "$dirpart/$file"
  done
done
])# _AM_OUTPUT_DEPENDENCY_COMMANDS


# AM_OUTPUT_DEPENDENCY_COMMANDS
# -----------------------------
# This macro should only be invoked once -- use via AC_REQUIRE.
#
# This code is only required when automatic dependency tracking
# is enabled.  FIXME.  This creates each `.P' file that we will
# need in order to bootstrap the dependency handling code.
AC_DEFUN([AM_OUTPUT_DEPENDENCY_COMMANDS],
[AC_CONFIG_COMMANDS([depfiles],
     [test x"$AMDEP_TRUE" != x"" || _AM_OUTPUT_DEPENDENCY_COMMANDS],
     [AMDEP_TRUE="$AMDEP_TRUE" ac_aux_dir="$ac_aux_dir"])
])

# Check to see how 'make' treats includes.	-*- Autoconf -*-

# Copyright (C) 2001, 2002, 2003 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

# serial 2

# AM_MAKE_INCLUDE()
# -----------------
# Check to see how make treats includes.
AC_DEFUN([AM_MAKE_INCLUDE],
[am_make=${MAKE-make}
cat > confinc << 'END'
am__doit:
	@echo done
.PHONY: am__doit
END
# If we don't find an include directive, just comment out the code.
AC_MSG_CHECKING([for style of include used by $am_make])
am__include="#"
am__quote=
_am_result=none
# First try GNU make style include.
echo "include confinc" > confmf
# We grep out `Entering directory' and `Leaving directory'
# messages which can occur if `w' ends up in MAKEFLAGS.
# In particular we don't look at `^make:' because GNU make might
# be invoked under some other name (usually "gmake"), in which
# case it prints its new name instead of `make'.
if test "`$am_make -s -f confmf 2> /dev/null | grep -v 'ing directory'`" = "done"; then
   am__include=include
   am__quote=
   _am_result=GNU
fi
# Now try BSD make style include.
if test "$am__include" = "#"; then
   echo '.include "confinc"' > confmf
   if test "`$am_make -s -f confmf 2> /dev/null`" = "done"; then
      am__include=.include
      am__quote="\""
      _am_result=BSD
   fi
fi
AC_SUBST([am__include])
AC_SUBST([am__quote])
AC_MSG_RESULT([$_am_result])
rm -f confinc confmf
])

# AM_CONDITIONAL                                              -*- Autoconf -*-

# Copyright 1997, 2000, 2001 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

# serial 5

AC_PREREQ(2.52)

# AM_CONDITIONAL(NAME, SHELL-CONDITION)
# -------------------------------------
# Define a conditional.
AC_DEFUN([AM_CONDITIONAL],
[ifelse([$1], [TRUE],  [AC_FATAL([$0: invalid condition: $1])],
        [$1], [FALSE], [AC_FATAL([$0: invalid condition: $1])])dnl
AC_SUBST([$1_TRUE])
AC_SUBST([$1_FALSE])
if $2; then
  $1_TRUE=
  $1_FALSE='#'
else
  $1_TRUE='#'
  $1_FALSE=
fi
AC_CONFIG_COMMANDS_PRE(
[if test -z "${$1_TRUE}" && test -z "${$1_FALSE}"; then
  AC_MSG_ERROR([conditional "$1" was never defined.
Usually this means the macro was only invoked conditionally.])
fi])])

# Copyright (C) 1995-2002 Free Software Foundation, Inc.
# Copyright (C) 2001-2003,2004 Red Hat, Inc.
#
# This file is free software, distributed under the terms of the GNU
# General Public License.  As a special exception to the GNU General
# Public License, this file may be distributed as part of a program
# that contains a configuration script generated by Autoconf, under
# the same distribution terms as the rest of that program.
#
# This file can be copied and used freely without restrictions.  It can
# be used in projects which are not available under the GNU Public License
# but which still want to provide support for the GNU gettext functionality.
#
# Macro to add for using GNU gettext.
# Ulrich Drepper <drepper@cygnus.com>, 1995, 1996
#
# Modified to never use included libintl. 
# Owen Taylor <otaylor@redhat.com>, 12/15/1998
#
# Major rework to remove unused code
# Owen Taylor <otaylor@redhat.com>, 12/11/2002
#
# Added better handling of ALL_LINGUAS from GNU gettext version 
# written by Bruno Haible, Owen Taylor <otaylor.redhat.com> 5/30/3002
#
# Modified to require ngettext
# Matthias Clasen <mclasen@redhat.com> 08/06/2004
#
# We need this here as well, since someone might use autoconf-2.5x
# to configure GLib then an older version to configure a package
# using AM_GLIB_GNU_GETTEXT
AC_PREREQ(2.53)

dnl
dnl We go to great lengths to make sure that aclocal won't 
dnl try to pull in the installed version of these macros
dnl when running aclocal in the glib directory.
dnl
m4_copy([AC_DEFUN],[glib_DEFUN])
m4_copy([AC_REQUIRE],[glib_REQUIRE])
dnl
dnl At the end, if we're not within glib, we'll define the public
dnl definitions in terms of our private definitions.
dnl

# GLIB_LC_MESSAGES
#--------------------
glib_DEFUN([GLIB_LC_MESSAGES],
  [AC_CHECK_HEADERS([locale.h])
    if test $ac_cv_header_locale_h = yes; then
    AC_CACHE_CHECK([for LC_MESSAGES], am_cv_val_LC_MESSAGES,
      [AC_TRY_LINK([#include <locale.h>], [return LC_MESSAGES],
       am_cv_val_LC_MESSAGES=yes, am_cv_val_LC_MESSAGES=no)])
    if test $am_cv_val_LC_MESSAGES = yes; then
      AC_DEFINE(HAVE_LC_MESSAGES, 1,
        [Define if your <locale.h> file defines LC_MESSAGES.])
    fi
  fi])

# GLIB_PATH_PROG_WITH_TEST
#----------------------------
dnl GLIB_PATH_PROG_WITH_TEST(VARIABLE, PROG-TO-CHECK-FOR,
dnl   TEST-PERFORMED-ON-FOUND_PROGRAM [, VALUE-IF-NOT-FOUND [, PATH]])
glib_DEFUN([GLIB_PATH_PROG_WITH_TEST],
[# Extract the first word of "$2", so it can be a program name with args.
set dummy $2; ac_word=[$]2
AC_MSG_CHECKING([for $ac_word])
AC_CACHE_VAL(ac_cv_path_$1,
[case "[$]$1" in
  /*)
  ac_cv_path_$1="[$]$1" # Let the user override the test with a path.
  ;;
  *)
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:"
  for ac_dir in ifelse([$5], , $PATH, [$5]); do
    test -z "$ac_dir" && ac_dir=.
    if test -f $ac_dir/$ac_word; then
      if [$3]; then
	ac_cv_path_$1="$ac_dir/$ac_word"
	break
      fi
    fi
  done
  IFS="$ac_save_ifs"
dnl If no 4th arg is given, leave the cache variable unset,
dnl so AC_PATH_PROGS will keep looking.
ifelse([$4], , , [  test -z "[$]ac_cv_path_$1" && ac_cv_path_$1="$4"
])dnl
  ;;
esac])dnl
$1="$ac_cv_path_$1"
if test ifelse([$4], , [-n "[$]$1"], ["[$]$1" != "$4"]); then
  AC_MSG_RESULT([$]$1)
else
  AC_MSG_RESULT(no)
fi
AC_SUBST($1)dnl
])

# GLIB_WITH_NLS
#-----------------
glib_DEFUN([GLIB_WITH_NLS],
  dnl NLS is obligatory
  [USE_NLS=yes
    AC_SUBST(USE_NLS)

    gt_cv_have_gettext=no

    CATOBJEXT=NONE
    XGETTEXT=:
    INTLLIBS=

    AC_CHECK_HEADER(libintl.h,
     [gt_cv_func_dgettext_libintl="no"
      libintl_extra_libs=""

      #
      # First check in libc
      #
      AC_CACHE_CHECK([for ngettext in libc], gt_cv_func_ngettext_libc,
        [AC_TRY_LINK([
#include <libintl.h>
],
         [return !ngettext ("","", 1)],
	  gt_cv_func_ngettext_libc=yes,
          gt_cv_func_ngettext_libc=no)
        ])
  
      if test "$gt_cv_func_ngettext_libc" = "yes" ; then
	      AC_CACHE_CHECK([for dgettext in libc], gt_cv_func_dgettext_libc,
        	[AC_TRY_LINK([
#include <libintl.h>
],
	          [return !dgettext ("","")],
		  gt_cv_func_dgettext_libc=yes,
	          gt_cv_func_dgettext_libc=no)
        	])
      fi
  
      if test "$gt_cv_func_ngettext_libc" = "yes" ; then
        AC_CHECK_FUNCS(bind_textdomain_codeset)
      fi

      #
      # If we don't have everything we want, check in libintl
      #
      if test "$gt_cv_func_dgettext_libc" != "yes" \
	 || test "$gt_cv_func_ngettext_libc" != "yes" \
         || test "$ac_cv_func_bind_textdomain_codeset" != "yes" ; then
        
        AC_CHECK_LIB(intl, bindtextdomain,
	    [AC_CHECK_LIB(intl, ngettext,
		    [AC_CHECK_LIB(intl, dgettext,
			          gt_cv_func_dgettext_libintl=yes)])])

	if test "$gt_cv_func_dgettext_libintl" != "yes" ; then
	  AC_MSG_CHECKING([if -liconv is needed to use gettext])
	  AC_MSG_RESULT([])
  	  AC_CHECK_LIB(intl, ngettext,
          	[AC_CHECK_LIB(intl, dcgettext,
		       [gt_cv_func_dgettext_libintl=yes
			libintl_extra_libs=-liconv],
			:,-liconv)],
		:,-liconv)
        fi

        #
        # If we found libintl, then check in it for bind_textdomain_codeset();
        # we'll prefer libc if neither have bind_textdomain_codeset(),
        # and both have dgettext and ngettext
        #
        if test "$gt_cv_func_dgettext_libintl" = "yes" ; then
          glib_save_LIBS="$LIBS"
          LIBS="$LIBS -lintl $libintl_extra_libs"
          unset ac_cv_func_bind_textdomain_codeset
          AC_CHECK_FUNCS(bind_textdomain_codeset)
          LIBS="$glib_save_LIBS"

          if test "$ac_cv_func_bind_textdomain_codeset" = "yes" ; then
            gt_cv_func_dgettext_libc=no
          else
            if test "$gt_cv_func_dgettext_libc" = "yes" \
		&& test "$gt_cv_func_ngettext_libc" = "yes"; then
              gt_cv_func_dgettext_libintl=no
            fi
          fi
        fi
      fi

      if test "$gt_cv_func_dgettext_libc" = "yes" \
	|| test "$gt_cv_func_dgettext_libintl" = "yes"; then
        gt_cv_have_gettext=yes
      fi
  
      if test "$gt_cv_func_dgettext_libintl" = "yes"; then
        INTLLIBS="-lintl $libintl_extra_libs"
      fi
  
      if test "$gt_cv_have_gettext" = "yes"; then
	AC_DEFINE(HAVE_GETTEXT,1,
	  [Define if the GNU gettext() function is already present or preinstalled.])
	GLIB_PATH_PROG_WITH_TEST(MSGFMT, msgfmt,
	  [test -z "`$ac_dir/$ac_word -h 2>&1 | grep 'dv '`"], no)dnl
	if test "$MSGFMT" != "no"; then
          glib_save_LIBS="$LIBS"
          LIBS="$LIBS $INTLLIBS"
	  AC_CHECK_FUNCS(dcgettext)
	  AC_PATH_PROG(GMSGFMT, gmsgfmt, $MSGFMT)
	  GLIB_PATH_PROG_WITH_TEST(XGETTEXT, xgettext,
	    [test -z "`$ac_dir/$ac_word -h 2>&1 | grep '(HELP)'`"], :)
	  AC_TRY_LINK(, [extern int _nl_msg_cat_cntr;
			 return _nl_msg_cat_cntr],
	    [CATOBJEXT=.gmo 
             DATADIRNAME=share],
	    [case $host in
	    *-*-solaris*)
	    dnl On Solaris, if bind_textdomain_codeset is in libc,
	    dnl GNU format message catalog is always supported,
            dnl since both are added to the libc all together.
	    dnl Hence, we'd like to go with DATADIRNAME=share and
	    dnl and CATOBJEXT=.gmo in this case.
            AC_CHECK_FUNC(bind_textdomain_codeset,
	      [CATOBJEXT=.gmo 
               DATADIRNAME=share],
	      [CATOBJEXT=.mo
               DATADIRNAME=lib])
	    ;;
	    *)
	    CATOBJEXT=.mo
            DATADIRNAME=lib
	    ;;
	    esac])
          LIBS="$glib_save_LIBS"
	  INSTOBJEXT=.mo
	else
	  gt_cv_have_gettext=no
	fi
      fi
    ])

    if test "$gt_cv_have_gettext" = "yes" ; then
      AC_DEFINE(ENABLE_NLS, 1,
        [always defined to indicate that i18n is enabled])
    fi

    dnl Test whether we really found GNU xgettext.
    if test "$XGETTEXT" != ":"; then
      dnl If it is not GNU xgettext we define it as : so that the
      dnl Makefiles still can work.
      if $XGETTEXT --omit-header /dev/null 2> /dev/null; then
        : ;
      else
        AC_MSG_RESULT(
	  [found xgettext program is not GNU xgettext; ignore it])
        XGETTEXT=":"
      fi
    fi

    # We need to process the po/ directory.
    POSUB=po

    AC_OUTPUT_COMMANDS(
      [case "$CONFIG_FILES" in *po/Makefile.in*)
        sed -e "/POTFILES =/r po/POTFILES" po/Makefile.in > po/Makefile
      esac])

    dnl These rules are solely for the distribution goal.  While doing this
    dnl we only have to keep exactly one list of the available catalogs
    dnl in configure.in.
    for lang in $ALL_LINGUAS; do
      GMOFILES="$GMOFILES $lang.gmo"
      POFILES="$POFILES $lang.po"
    done

    dnl Make all variables we use known to autoconf.
    AC_SUBST(CATALOGS)
    AC_SUBST(CATOBJEXT)
    AC_SUBST(DATADIRNAME)
    AC_SUBST(GMOFILES)
    AC_SUBST(INSTOBJEXT)
    AC_SUBST(INTLLIBS)
    AC_SUBST(PO_IN_DATADIR_TRUE)
    AC_SUBST(PO_IN_DATADIR_FALSE)
    AC_SUBST(POFILES)
    AC_SUBST(POSUB)
  ])

# AM_GLIB_GNU_GETTEXT
# -------------------
# Do checks necessary for use of gettext. If a suitable implementation 
# of gettext is found in either in libintl or in the C library,
# it will set INTLLIBS to the libraries needed for use of gettext
# and AC_DEFINE() HAVE_GETTEXT and ENABLE_NLS. (The shell variable
# gt_cv_have_gettext will be set to "yes".) It will also call AC_SUBST()
# on various variables needed by the Makefile.in.in installed by 
# glib-gettextize.
dnl
glib_DEFUN([GLIB_GNU_GETTEXT],
  [AC_REQUIRE([AC_PROG_CC])dnl
   AC_REQUIRE([AC_HEADER_STDC])dnl
   
   GLIB_LC_MESSAGES
   GLIB_WITH_NLS

   if test "$gt_cv_have_gettext" = "yes"; then
     if test "x$ALL_LINGUAS" = "x"; then
       LINGUAS=
     else
       AC_MSG_CHECKING(for catalogs to be installed)
       NEW_LINGUAS=
       for presentlang in $ALL_LINGUAS; do
         useit=no
         if test "%UNSET%" != "${LINGUAS-%UNSET%}"; then
           desiredlanguages="$LINGUAS"
         else
           desiredlanguages="$ALL_LINGUAS"
         fi
         for desiredlang in $desiredlanguages; do
 	   # Use the presentlang catalog if desiredlang is
           #   a. equal to presentlang, or
           #   b. a variant of presentlang (because in this case,
           #      presentlang can be used as a fallback for messages
           #      which are not translated in the desiredlang catalog).
           case "$desiredlang" in
             "$presentlang"*) useit=yes;;
           esac
         done
         if test $useit = yes; then
           NEW_LINGUAS="$NEW_LINGUAS $presentlang"
         fi
       done
       LINGUAS=$NEW_LINGUAS
       AC_MSG_RESULT($LINGUAS)
     fi

     dnl Construct list of names of catalog files to be constructed.
     if test -n "$LINGUAS"; then
       for lang in $LINGUAS; do CATALOGS="$CATALOGS $lang$CATOBJEXT"; done
     fi
   fi

   dnl If the AC_CONFIG_AUX_DIR macro for autoconf is used we possibly
   dnl find the mkinstalldirs script in another subdir but ($top_srcdir).
   dnl Try to locate is.
   MKINSTALLDIRS=
   if test -n "$ac_aux_dir"; then
     MKINSTALLDIRS="$ac_aux_dir/mkinstalldirs"
   fi
   if test -z "$MKINSTALLDIRS"; then
     MKINSTALLDIRS="\$(top_srcdir)/mkinstalldirs"
   fi
   AC_SUBST(MKINSTALLDIRS)

   dnl Generate list of files to be processed by xgettext which will
   dnl be included in po/Makefile.
   test -d po || mkdir po
   if test "x$srcdir" != "x."; then
     if test "x`echo $srcdir | sed 's@/.*@@'`" = "x"; then
       posrcprefix="$srcdir/"
     else
       posrcprefix="../$srcdir/"
     fi
   else
     posrcprefix="../"
   fi
   rm -f po/POTFILES
   sed -e "/^#/d" -e "/^\$/d" -e "s,.*,	$posrcprefix& \\\\," -e "\$s/\(.*\) \\\\/\1/" \
	< $srcdir/po/POTFILES.in > po/POTFILES
  ])

# AM_GLIB_DEFINE_LOCALEDIR(VARIABLE)
# -------------------------------
# Define VARIABLE to the location where catalog files will
# be installed by po/Makefile.
glib_DEFUN([GLIB_DEFINE_LOCALEDIR],
[glib_REQUIRE([GLIB_GNU_GETTEXT])dnl
glib_save_prefix="$prefix"
glib_save_exec_prefix="$exec_prefix"
test "x$prefix" = xNONE && prefix=$ac_default_prefix
test "x$exec_prefix" = xNONE && exec_prefix=$prefix
if test "x$CATOBJEXT" = "x.mo" ; then
  localedir=`eval echo "${libdir}/locale"`
else
  localedir=`eval echo "${datadir}/locale"`
fi
prefix="$glib_save_prefix"
exec_prefix="$glib_save_exec_prefix"
AC_DEFINE_UNQUOTED($1, "$localedir",
  [Define the location where the catalogs will be installed])
])

dnl
dnl Now the definitions that aclocal will find
dnl
ifdef(glib_configure_in,[],[
AC_DEFUN([AM_GLIB_GNU_GETTEXT],[GLIB_GNU_GETTEXT($@)])
AC_DEFUN([AM_GLIB_DEFINE_LOCALEDIR],[GLIB_DEFINE_LOCALEDIR($@)])
])dnl

# Configure paths for GLIB
# Owen Taylor     1997-2001

dnl AM_PATH_GLIB_2_0([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND [, MODULES]]]])
dnl Test for GLIB, and define GLIB_CFLAGS and GLIB_LIBS, if gmodule, gobject or 
dnl gthread is specified in MODULES, pass to pkg-config
dnl
AC_DEFUN([AM_PATH_GLIB_2_0],
[dnl 
dnl Get the cflags and libraries from pkg-config
dnl
AC_ARG_ENABLE(glibtest, [  --disable-glibtest      do not try to compile and run a test GLIB program],
		    , enable_glibtest=yes)

  pkg_config_args=glib-2.0
  for module in . $4
  do
      case "$module" in
         gmodule) 
             pkg_config_args="$pkg_config_args gmodule-2.0"
         ;;
         gmodule-no-export) 
             pkg_config_args="$pkg_config_args gmodule-no-export-2.0"
         ;;
         gobject) 
             pkg_config_args="$pkg_config_args gobject-2.0"
         ;;
         gthread) 
             pkg_config_args="$pkg_config_args gthread-2.0"
         ;;
      esac
  done

  AC_PATH_PROG(PKG_CONFIG, pkg-config, no)

  no_glib=""

  if test x$PKG_CONFIG != xno ; then
    if $PKG_CONFIG --atleast-pkgconfig-version 0.7 ; then
      :
    else
      echo *** pkg-config too old; version 0.7 or better required.
      no_glib=yes
      PKG_CONFIG=no
    fi
  else
    no_glib=yes
  fi

  min_glib_version=ifelse([$1], ,2.0.0,$1)
  AC_MSG_CHECKING(for GLIB - version >= $min_glib_version)

  if test x$PKG_CONFIG != xno ; then
    ## don't try to run the test against uninstalled libtool libs
    if $PKG_CONFIG --uninstalled $pkg_config_args; then
	  echo "Will use uninstalled version of GLib found in PKG_CONFIG_PATH"
	  enable_glibtest=no
    fi

    if $PKG_CONFIG --atleast-version $min_glib_version $pkg_config_args; then
	  :
    else
	  no_glib=yes
    fi
  fi

  if test x"$no_glib" = x ; then
    GLIB_GENMARSHAL=`$PKG_CONFIG --variable=glib_genmarshal glib-2.0`
    GOBJECT_QUERY=`$PKG_CONFIG --variable=gobject_query glib-2.0`
    GLIB_MKENUMS=`$PKG_CONFIG --variable=glib_mkenums glib-2.0`

    GLIB_CFLAGS=`$PKG_CONFIG --cflags $pkg_config_args`
    GLIB_LIBS=`$PKG_CONFIG --libs $pkg_config_args`
    glib_config_major_version=`$PKG_CONFIG --modversion glib-2.0 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
    glib_config_minor_version=`$PKG_CONFIG --modversion glib-2.0 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
    glib_config_micro_version=`$PKG_CONFIG --modversion glib-2.0 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
    if test "x$enable_glibtest" = "xyes" ; then
      ac_save_CFLAGS="$CFLAGS"
      ac_save_LIBS="$LIBS"
      CFLAGS="$CFLAGS $GLIB_CFLAGS"
      LIBS="$GLIB_LIBS $LIBS"
dnl
dnl Now check if the installed GLIB is sufficiently new. (Also sanity
dnl checks the results of pkg-config to some extent)
dnl
      rm -f conf.glibtest
      AC_TRY_RUN([
#include <glib.h>
#include <stdio.h>
#include <stdlib.h>

int 
main ()
{
  int major, minor, micro;
  char *tmp_version;

  system ("touch conf.glibtest");

  /* HP/UX 9 (%@#!) writes to sscanf strings */
  tmp_version = g_strdup("$min_glib_version");
  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
     printf("%s, bad version string\n", "$min_glib_version");
     exit(1);
   }

  if ((glib_major_version != $glib_config_major_version) ||
      (glib_minor_version != $glib_config_minor_version) ||
      (glib_micro_version != $glib_config_micro_version))
    {
      printf("\n*** 'pkg-config --modversion glib-2.0' returned %d.%d.%d, but GLIB (%d.%d.%d)\n", 
             $glib_config_major_version, $glib_config_minor_version, $glib_config_micro_version,
             glib_major_version, glib_minor_version, glib_micro_version);
      printf ("*** was found! If pkg-config was correct, then it is best\n");
      printf ("*** to remove the old version of GLib. You may also be able to fix the error\n");
      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
      printf("*** required on your system.\n");
      printf("*** If pkg-config was wrong, set the environment variable PKG_CONFIG_PATH\n");
      printf("*** to point to the correct configuration files\n");
    } 
  else if ((glib_major_version != GLIB_MAJOR_VERSION) ||
	   (glib_minor_version != GLIB_MINOR_VERSION) ||
           (glib_micro_version != GLIB_MICRO_VERSION))
    {
      printf("*** GLIB header files (version %d.%d.%d) do not match\n",
	     GLIB_MAJOR_VERSION, GLIB_MINOR_VERSION, GLIB_MICRO_VERSION);
      printf("*** library (version %d.%d.%d)\n",
	     glib_major_version, glib_minor_version, glib_micro_version);
    }
  else
    {
      if ((glib_major_version > major) ||
        ((glib_major_version == major) && (glib_minor_version > minor)) ||
        ((glib_major_version == major) && (glib_minor_version == minor) && (glib_micro_version >= micro)))
      {
        return 0;
       }
     else
      {
        printf("\n*** An old version of GLIB (%d.%d.%d) was found.\n",
               glib_major_version, glib_minor_version, glib_micro_version);
        printf("*** You need a version of GLIB newer than %d.%d.%d. The latest version of\n",
	       major, minor, micro);
        printf("*** GLIB is always available from ftp://ftp.gtk.org.\n");
        printf("***\n");
        printf("*** If you have already installed a sufficiently new version, this error\n");
        printf("*** probably means that the wrong copy of the pkg-config shell script is\n");
        printf("*** being found. The easiest way to fix this is to remove the old version\n");
        printf("*** of GLIB, but you can also set the PKG_CONFIG environment to point to the\n");
        printf("*** correct copy of pkg-config. (In this case, you will have to\n");
        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
        printf("*** so that the correct libraries are found at run-time))\n");
      }
    }
  return 1;
}
],, no_glib=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
       CFLAGS="$ac_save_CFLAGS"
       LIBS="$ac_save_LIBS"
     fi
  fi
  if test "x$no_glib" = x ; then
     AC_MSG_RESULT(yes (version $glib_config_major_version.$glib_config_minor_version.$glib_config_micro_version))
     ifelse([$2], , :, [$2])     
  else
     AC_MSG_RESULT(no)
     if test "$PKG_CONFIG" = "no" ; then
       echo "*** A new enough version of pkg-config was not found."
       echo "*** See http://www.freedesktop.org/software/pkgconfig/"
     else
       if test -f conf.glibtest ; then
        :
       else
          echo "*** Could not run GLIB test program, checking why..."
          ac_save_CFLAGS="$CFLAGS"
          ac_save_LIBS="$LIBS"
          CFLAGS="$CFLAGS $GLIB_CFLAGS"
          LIBS="$LIBS $GLIB_LIBS"
          AC_TRY_LINK([
#include <glib.h>
#include <stdio.h>
],      [ return ((glib_major_version) || (glib_minor_version) || (glib_micro_version)); ],
        [ echo "*** The test program compiled, but did not run. This usually means"
          echo "*** that the run-time linker is not finding GLIB or finding the wrong"
          echo "*** version of GLIB. If it is not finding GLIB, you'll need to set your"
          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
          echo "*** is required on your system"
	  echo "***"
          echo "*** If you have an old version installed, it is best to remove it, although"
          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH" ],
        [ echo "*** The test program failed to compile or link. See the file config.log for the"
          echo "*** exact error that occured. This usually means GLIB is incorrectly installed."])
          CFLAGS="$ac_save_CFLAGS"
          LIBS="$ac_save_LIBS"
       fi
     fi
     GLIB_CFLAGS=""
     GLIB_LIBS=""
     GLIB_GENMARSHAL=""
     GOBJECT_QUERY=""
     GLIB_MKENUMS=""
     ifelse([$3], , :, [$3])
  fi
  AC_SUBST(GLIB_CFLAGS)
  AC_SUBST(GLIB_LIBS)
  AC_SUBST(GLIB_GENMARSHAL)
  AC_SUBST(GOBJECT_QUERY)
  AC_SUBST(GLIB_MKENUMS)
  rm -f conf.glibtest
])

# Configure paths for GTK+
# Owen Taylor     1997-2001

dnl AM_PATH_GTK_2_0([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND [, MODULES]]]])
dnl Test for GTK+, and define GTK_CFLAGS and GTK_LIBS, if gthread is specified in MODULES, 
dnl pass to pkg-config
dnl
AC_DEFUN([AM_PATH_GTK_2_0],
[dnl 
dnl Get the cflags and libraries from pkg-config
dnl
AC_ARG_ENABLE(gtktest, [  --disable-gtktest       do not try to compile and run a test GTK+ program],
		    , enable_gtktest=yes)

  pkg_config_args=gtk+-2.0
  for module in . $4
  do
      case "$module" in
         gthread) 
             pkg_config_args="$pkg_config_args gthread-2.0"
         ;;
      esac
  done

  no_gtk=""

  AC_PATH_PROG(PKG_CONFIG, pkg-config, no)

  if test x$PKG_CONFIG != xno ; then
    if pkg-config --atleast-pkgconfig-version 0.7 ; then
      :
    else
      echo "*** pkg-config too old; version 0.7 or better required."
      no_gtk=yes
      PKG_CONFIG=no
    fi
  else
    no_gtk=yes
  fi

  min_gtk_version=ifelse([$1], ,2.0.0,$1)
  AC_MSG_CHECKING(for GTK+ - version >= $min_gtk_version)

  if test x$PKG_CONFIG != xno ; then
    ## don't try to run the test against uninstalled libtool libs
    if $PKG_CONFIG --uninstalled $pkg_config_args; then
	  echo "Will use uninstalled version of GTK+ found in PKG_CONFIG_PATH"
	  enable_gtktest=no
    fi

    if $PKG_CONFIG --atleast-version $min_gtk_version $pkg_config_args; then
	  :
    else
	  no_gtk=yes
    fi
  fi

  if test x"$no_gtk" = x ; then
    GTK_CFLAGS=`$PKG_CONFIG $pkg_config_args --cflags`
    GTK_LIBS=`$PKG_CONFIG $pkg_config_args --libs`
    gtk_config_major_version=`$PKG_CONFIG --modversion gtk+-2.0 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
    gtk_config_minor_version=`$PKG_CONFIG --modversion gtk+-2.0 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
    gtk_config_micro_version=`$PKG_CONFIG --modversion gtk+-2.0 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
    if test "x$enable_gtktest" = "xyes" ; then
      ac_save_CFLAGS="$CFLAGS"
      ac_save_LIBS="$LIBS"
      CFLAGS="$CFLAGS $GTK_CFLAGS"
      LIBS="$GTK_LIBS $LIBS"
dnl
dnl Now check if the installed GTK+ is sufficiently new. (Also sanity
dnl checks the results of pkg-config to some extent)
dnl
      rm -f conf.gtktest
      AC_TRY_RUN([
#include <gtk/gtk.h>
#include <stdio.h>
#include <stdlib.h>

int 
main ()
{
  int major, minor, micro;
  char *tmp_version;

  system ("touch conf.gtktest");

  /* HP/UX 9 (%@#!) writes to sscanf strings */
  tmp_version = g_strdup("$min_gtk_version");
  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
     printf("%s, bad version string\n", "$min_gtk_version");
     exit(1);
   }

  if ((gtk_major_version != $gtk_config_major_version) ||
      (gtk_minor_version != $gtk_config_minor_version) ||
      (gtk_micro_version != $gtk_config_micro_version))
    {
      printf("\n*** 'pkg-config --modversion gtk+-2.0' returned %d.%d.%d, but GTK+ (%d.%d.%d)\n", 
             $gtk_config_major_version, $gtk_config_minor_version, $gtk_config_micro_version,
             gtk_major_version, gtk_minor_version, gtk_micro_version);
      printf ("*** was found! If pkg-config was correct, then it is best\n");
      printf ("*** to remove the old version of GTK+. You may also be able to fix the error\n");
      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
      printf("*** required on your system.\n");
      printf("*** If pkg-config was wrong, set the environment variable PKG_CONFIG_PATH\n");
      printf("*** to point to the correct configuration files\n");
    } 
  else if ((gtk_major_version != GTK_MAJOR_VERSION) ||
	   (gtk_minor_version != GTK_MINOR_VERSION) ||
           (gtk_micro_version != GTK_MICRO_VERSION))
    {
      printf("*** GTK+ header files (version %d.%d.%d) do not match\n",
	     GTK_MAJOR_VERSION, GTK_MINOR_VERSION, GTK_MICRO_VERSION);
      printf("*** library (version %d.%d.%d)\n",
	     gtk_major_version, gtk_minor_version, gtk_micro_version);
    }
  else
    {
      if ((gtk_major_version > major) ||
        ((gtk_major_version == major) && (gtk_minor_version > minor)) ||
        ((gtk_major_version == major) && (gtk_minor_version == minor) && (gtk_micro_version >= micro)))
      {
        return 0;
       }
     else
      {
        printf("\n*** An old version of GTK+ (%d.%d.%d) was found.\n",
               gtk_major_version, gtk_minor_version, gtk_micro_version);
        printf("*** You need a version of GTK+ newer than %d.%d.%d. The latest version of\n",
	       major, minor, micro);
        printf("*** GTK+ is always available from ftp://ftp.gtk.org.\n");
        printf("***\n");
        printf("*** If you have already installed a sufficiently new version, this error\n");
        printf("*** probably means that the wrong copy of the pkg-config shell script is\n");
        printf("*** being found. The easiest way to fix this is to remove the old version\n");
        printf("*** of GTK+, but you can also set the PKG_CONFIG environment to point to the\n");
        printf("*** correct copy of pkg-config. (In this case, you will have to\n");
        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
        printf("*** so that the correct libraries are found at run-time))\n");
      }
    }
  return 1;
}
],, no_gtk=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
       CFLAGS="$ac_save_CFLAGS"
       LIBS="$ac_save_LIBS"
     fi
  fi
  if test "x$no_gtk" = x ; then
     AC_MSG_RESULT(yes (version $gtk_config_major_version.$gtk_config_minor_version.$gtk_config_micro_version))
     ifelse([$2], , :, [$2])     
  else
     AC_MSG_RESULT(no)
     if test "$PKG_CONFIG" = "no" ; then
       echo "*** A new enough version of pkg-config was not found."
       echo "*** See http://pkgconfig.sourceforge.net"
     else
       if test -f conf.gtktest ; then
        :
       else
          echo "*** Could not run GTK+ test program, checking why..."
	  ac_save_CFLAGS="$CFLAGS"
	  ac_save_LIBS="$LIBS"
          CFLAGS="$CFLAGS $GTK_CFLAGS"
          LIBS="$LIBS $GTK_LIBS"
          AC_TRY_LINK([
#include <gtk/gtk.h>
#include <stdio.h>
],      [ return ((gtk_major_version) || (gtk_minor_version) || (gtk_micro_version)); ],
        [ echo "*** The test program compiled, but did not run. This usually means"
          echo "*** that the run-time linker is not finding GTK+ or finding the wrong"
          echo "*** version of GTK+. If it is not finding GTK+, you'll need to set your"
          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
          echo "*** is required on your system"
	  echo "***"
          echo "*** If you have an old version installed, it is best to remove it, although"
          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH" ],
        [ echo "*** The test program failed to compile or link. See the file config.log for the"
          echo "*** exact error that occured. This usually means GTK+ is incorrectly installed."])
          CFLAGS="$ac_save_CFLAGS"
          LIBS="$ac_save_LIBS"
       fi
     fi
     GTK_CFLAGS=""
     GTK_LIBS=""
     ifelse([$3], , :, [$3])
  fi
  AC_SUBST(GTK_CFLAGS)
  AC_SUBST(GTK_LIBS)
  rm -f conf.gtktest
])

# pkg.m4 - Macros to locate and utilise pkg-config.            -*- Autoconf -*-
# 
# Copyright © 2004 Scott James Remnant <scott@netsplit.com>.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
# As a special exception to the GNU General Public License, if you
# distribute this file as part of a program that contains a
# configuration script generated by Autoconf, you may include it under
# the same distribution terms that you use for the rest of that program.

# PKG_PROG_PKG_CONFIG([MIN-VERSION])
# ----------------------------------
AC_DEFUN([PKG_PROG_PKG_CONFIG],
[m4_pattern_forbid([^_?PKG_[A-Z_]+$])
m4_pattern_allow([^PKG_CONFIG(_PATH)?$])
AC_ARG_VAR([PKG_CONFIG], [path to pkg-config utility])dnl
if test "x$ac_cv_env_PKG_CONFIG_set" != "xset"; then
	AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
fi
if test -n "$PKG_CONFIG"; then
	_pkg_min_version=m4_ifval([$1], [$1], [0.9.0])
	AC_MSG_CHECKING([pkg-config is at least version $_pkg_min_version])
	if $PKG_CONFIG --atleast-pkgconfig-version $_pkg_min_version; then
		AC_MSG_RESULT([yes])
	else
		AC_MSG_RESULT([no])
		PKG_CONFIG=""
	fi
		
fi[]dnl
])# PKG_PROG_PKG_CONFIG

# PKG_CHECK_EXISTS(MODULES, [ACTION-IF-FOUND], [ACTION-IF-NOT-FOUND])
#
# Check to see whether a particular set of modules exists.  Similar
# to PKG_CHECK_MODULES(), but does not set variables or print errors.
#
#
# Similar to PKG_CHECK_MODULES, make sure that the first instance of
# this or PKG_CHECK_MODULES is called, or make sure to call
# PKG_CHECK_EXISTS manually
# --------------------------------------------------------------
AC_DEFUN([PKG_CHECK_EXISTS],
[AC_REQUIRE([PKG_PROG_PKG_CONFIG])dnl
if test -n "$PKG_CONFIG" && \
    AC_RUN_LOG([$PKG_CONFIG --exists --print-errors "$1"]); then
  m4_ifval([$2], [$2], [:])
m4_ifvaln([$3], [else
  $3])dnl
fi])


# _PKG_CONFIG([VARIABLE], [COMMAND], [MODULES])
# ---------------------------------------------
m4_define([_PKG_CONFIG],
[if test -n "$PKG_CONFIG"; then
        PKG_CHECK_EXISTS([$3],
                         [pkg_cv_[]$1=`$PKG_CONFIG --[]$2 "$3" 2>/dev/null`],
			 [pkg_failed=yes])
else
	pkg_failed=untried
fi[]dnl
])# _PKG_CONFIG

# PKG_CHECK_MODULES(VARIABLE-PREFIX, MODULES, [ACTION-IF-FOUND],
# [ACTION-IF-NOT-FOUND])
#
#
# Note that if there is a possibility the first call to
# PKG_CHECK_MODULES might not happen, you should be sure to include an
# explicit call to PKG_PROG_PKG_CONFIG in your configure.ac
#
#
# --------------------------------------------------------------
AC_DEFUN([PKG_CHECK_MODULES],
[AC_REQUIRE([PKG_PROG_PKG_CONFIG])dnl
AC_ARG_VAR([$1][_CFLAGS], [C compiler flags for $1, overriding pkg-config])dnl
AC_ARG_VAR([$1][_LIBS], [linker flags for $1, overriding pkg-config])dnl

pkg_failed=no
AC_MSG_CHECKING([for $1])

_PKG_CONFIG([$1][_CFLAGS], [cflags], [$2])
_PKG_CONFIG([$1][_LIBS], [libs], [$2])

if test $pkg_failed = yes; then
	$1[]_PKG_ERRORS=`$PKG_CONFIG --errors-to-stdout --print-errors "$2"`
	# Put the nasty error message in config.log where it belongs
	echo "$$1[]_PKG_ERRORS" 1>&AS_MESSAGE_LOG_FD

	ifelse([$4], , [AC_MSG_ERROR(dnl
[Package requirements ($2) were not met.
Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively you may set the $1_CFLAGS and $1_LIBS environment variables
to avoid the need to call pkg-config.  See the pkg-config man page for
more details.])],
		[$4])
elif test $pkg_failed = untried; then
	ifelse([$4], , [AC_MSG_FAILURE(dnl
[The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Alternatively you may set the $1_CFLAGS and $1_LIBS environment variables
to avoid the need to call pkg-config.  See the pkg-config man page for
more details.

To get pkg-config, see <http://www.freedesktop.org/software/pkgconfig>.])],
		[$4])
else
	$1[]_CFLAGS=$pkg_cv_[]$1[]_CFLAGS
	$1[]_LIBS=$pkg_cv_[]$1[]_LIBS
        AC_MSG_RESULT([yes])
	ifelse([$3], , :, [$3])
fi[]dnl
])# PKG_CHECK_MODULES

# Configure paths for GtkGLExt
# Naofumi Yasufuku
#
# Shamelessly stolen from gtk-2.0.m4
# Configure paths for GTK+
# Owen Taylor     1997-2001

dnl AM_PATH_GTKGLEXT_1_0([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
dnl Test for GtkGLExt, and define GTKGLEXT_CFLAGS and GTKGLEXT_LIBS.
dnl
AC_DEFUN([AM_PATH_GTKGLEXT_1_0],
[ no_gtkglext=""
  GTKGLEXT_CFLAGS=""
  GTKGLEXT_LIBS=""

  # GtkGLExt pkg-config module
  gtkglext_module=gtkglext-1.0

  # minimum GtkGLExt version
  gtkglext_min_version=ifelse([$1], ,1.0.0,$1)

  # minimum pkg-config version
  pkgconfig_min_version=0.7

AC_ARG_ENABLE(gtkglext-test,
[  --disable-gtkglext-test do not try to compile and run a test GtkGLExt program],
, enable_gtkglext_test=yes)

dnl 
dnl Get the cflags and libraries from pkg-config
dnl
  pkg_config_modules=$gtkglext_module

  AC_PATH_PROG(PKG_CONFIG, pkg-config, no)

  if test x$PKG_CONFIG != xno ; then
    if pkg-config --atleast-pkgconfig-version $pkgconfig_min_version ; then
      :
    else
      echo ""
      echo "*** pkg-config too old; version $pkgconfig_min_version or better required."
      no_gtkglext=yes
      PKG_CONFIG=no
    fi
  else
    no_gtkglext=yes
  fi

  AC_MSG_CHECKING(for GtkGLExt - version >= $gtkglext_min_version)

  if test x$PKG_CONFIG != xno ; then
    ## don't try to run the test against uninstalled libtool libs
    if $PKG_CONFIG --uninstalled $pkg_config_modules; then
      echo ""
      echo "Will use uninstalled version of GtkGLExt found in PKG_CONFIG_PATH"
      enable_gtkglext_test=no
    fi

    if $PKG_CONFIG --atleast-version $gtkglext_min_version $pkg_config_modules; then
      :
    else
      echo ""
      echo "*** pkg-config cannot find $gtkglext_module >= $gtkglext_min_version"
      echo "*** Set the environment variable PKG_CONFIG_PATH to point to the correct"
      echo "*** configuration files."
      no_gtkglext=yes
      enable_gtkglext_test=no
    fi
  fi

  if test x"$no_gtkglext" = x ; then
    GTKGLEXT_CFLAGS=`$PKG_CONFIG --cflags $pkg_config_modules`
    GTKGLEXT_LIBS=`$PKG_CONFIG --libs $pkg_config_modules`
    gtkglext_config_major_version=`$PKG_CONFIG --modversion $gtkglext_module | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
    gtkglext_config_minor_version=`$PKG_CONFIG --modversion $gtkglext_module | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
    gtkglext_config_micro_version=`$PKG_CONFIG --modversion $gtkglext_module | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
    if test "x$enable_gtkglext_test" = "xyes" ; then
      ac_save_CFLAGS="$CFLAGS"
      ac_save_LIBS="$LIBS"
      CFLAGS="$CFLAGS $GTKGLEXT_CFLAGS"
      LIBS="$GTKGLEXT_LIBS $LIBS"
dnl
dnl Now check if the installed GtkGLExt is sufficiently new. (Also sanity
dnl checks the results of pkg-config to some extent)
dnl
      rm -f conf.gtkgltest
      AC_TRY_RUN([
#include <gtk/gtk.h>
#include <gtk/gtkgl.h>
#include <stdio.h>
#include <stdlib.h>

int 
main ()
{
  int major, minor, micro;
  char *tmp_version;

  system ("touch conf.gtkgltest");

  /* HP/UX 9 (%@#!) writes to sscanf strings */
  tmp_version = g_strdup ("$gtkglext_min_version");
  if (sscanf (tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3)
    {
      printf ("%s, bad version string\n", "$gtkglext_min_version");
      exit (1);
    }

  if ((gtkglext_major_version != $gtkglext_config_major_version) ||
      (gtkglext_minor_version != $gtkglext_config_minor_version) ||
      (gtkglext_micro_version != $gtkglext_config_micro_version))
    {
      printf ("\n*** 'pkg-config --modversion $gtkglext_module' returned %d.%d.%d, but GtkGLExt\n",
              $gtkglext_config_major_version, $gtkglext_config_minor_version, $gtkglext_config_micro_version);
      printf ("*** library %d.%d.%d was found!\n",
              gtkglext_major_version, gtkglext_minor_version, gtkglext_micro_version);
      printf ("***\n");
      printf ("*** If pkg-config was correct, then it is best to remove the old version\n");
      printf ("*** of GtkGLExt. You may also be able to fix the error by modifying your\n");
      printf ("*** LD_LIBRARY_PATH enviroment variable, or by editing /etc/ld.so.conf.\n");
      printf ("*** Make sure you have run ldconfig if that is required on your system.\n");
      printf ("***\n");
      printf ("*** If pkg-config was wrong, set the environment variable PKG_CONFIG_PATH\n");
      printf ("*** to point to the correct configuration files.\n");
    } 
  else if ((gtkglext_major_version != GTKGLEXT_MAJOR_VERSION) ||
	   (gtkglext_minor_version != GTKGLEXT_MINOR_VERSION) ||
           (gtkglext_micro_version != GTKGLEXT_MICRO_VERSION))
    {
      printf ("\n*** GtkGLExt header files (version %d.%d.%d) do not match library (version %d.%d.%d).\n",
              GTKGLEXT_MAJOR_VERSION, GTKGLEXT_MINOR_VERSION, GTKGLEXT_MICRO_VERSION,
              gtkglext_major_version, gtkglext_minor_version, gtkglext_micro_version);
    }
  else
    {
      if ((gtkglext_major_version > major) ||
          ((gtkglext_major_version == major) && (gtkglext_minor_version > minor)) ||
          ((gtkglext_major_version == major) && (gtkglext_minor_version == minor) && (gtkglext_micro_version >= micro)))
        {
          return 0;
        }
      else
        {
          printf ("\n*** An old version of GtkGLExt library (%d.%d.%d) was found.\n",
                  gtkglext_major_version, gtkglext_minor_version, gtkglext_micro_version);
          printf ("*** You need a version of GtkGLExt newer than %d.%d.%d. The latest version of\n",
                  major, minor, micro);
          printf ("*** GtkGLExt is always available from http://gtkglext.sourceforge.net/.\n");
          printf ("***\n");
          printf ("*** If you have already installed a sufficiently new version, this error\n");
          printf ("*** probably means that the wrong copy of the pkg-config shell script is\n");
          printf ("*** being found. The easiest way to fix this is to remove the old version\n");
          printf ("*** of GtkGLExt, but you can also set the PKG_CONFIG environment to point\n");
          printf ("*** to the correct copy of pkg-config. (In this case, you will have to\n");
          printf ("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
          printf ("*** so that the correct libraries are found at run-time)\n");
        }
    }
  return 1;
}
],, no_gtkglext=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
       CFLAGS="$ac_save_CFLAGS"
       LIBS="$ac_save_LIBS"
     fi
  fi
  if test "x$no_gtkglext" = x ; then
     AC_MSG_RESULT(yes (version $gtkglext_config_major_version.$gtkglext_config_minor_version.$gtkglext_config_micro_version))
     ifelse([$2], , :, [$2])
  else
     AC_MSG_RESULT(no)
     if test "$PKG_CONFIG" = "no" ; then
       echo "*** A new enough version of pkg-config was not found."
       echo "*** See http://www.freedesktop.org/software/pkgconfig/."
     elif test "x$enable_gtkglext_test" = "xyes" ; then
       if test -f conf.gtkgltest ; then
        :
       else
          echo "*** Could not run GtkGLExt test program, checking why..."
	  ac_save_CFLAGS="$CFLAGS"
	  ac_save_LIBS="$LIBS"
          CFLAGS="$CFLAGS $GTKGLEXT_CFLAGS"
          LIBS="$LIBS $GTKGLEXT_LIBS"
          AC_TRY_LINK([
#include <gtk/gtk.h>
#include <gtk/gtkgl.h>
#include <stdio.h>
],      [ return ((gtkglext_major_version) || (gtkglext_minor_version) || (gtkglext_micro_version)); ],
        [ echo "*** The test program compiled, but did not run. This usually means"
          echo "*** that the run-time linker is not finding GtkGLExt or finding the wrong"
          echo "*** version of GtkGLExt. If it is not finding GtkGLExt, you'll need to set your"
          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
          echo "*** is required on your system"
	  echo "***"
          echo "*** If you have an old version installed, it is best to remove it, although"
          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH" ],
        [ echo "*** The test program failed to compile or link. See the file config.log for the"
          echo "*** exact error that occured. This usually means GtkGLExt is incorrectly installed."])
          CFLAGS="$ac_save_CFLAGS"
          LIBS="$ac_save_LIBS"
       fi
     fi
     GTKGLEXT_CFLAGS=""
     GTKGLEXT_LIBS=""
     ifelse([$3], , :, [$3])
  fi
  AC_SUBST(GTKGLEXT_CFLAGS)
  AC_SUBST(GTKGLEXT_LIBS)
  rm -f conf.gtkgltest
])

dnl AC_GTKGLEXT_SUPPORTS_MULTIHEAD([ACTION-IF-SUPPORTED [, ACTION-IF-NOT-SUPPORTED]])
dnl Checks whether GtkGLExt supports multihead.
dnl
AC_DEFUN([AC_GTKGLEXT_SUPPORTS_MULTIHEAD],
[ AC_CACHE_CHECK([whether GtkGLExt supports multihead],
                 [ac_cv_gtkglext_supports_multihead],
                 [AC_TRY_LINK([#include <gdk/gdkglquery.h>], 
                              [gdk_gl_query_extension_for_display(gdk_display_get_default());],
                              [ac_cv_gtkglext_supports_multihead=yes],
                              [ac_cv_gtkglext_supports_multihead=no])])
  if test "x$ac_cv_gtkglext_supports_multihead" = "xyes" ; then
    ifelse([$1], , :, [$1])
  else
    ifelse([$2], , :, [$2])
  fi
])

dnl @synopsis AC_DEFINE_DIR(VARNAME, DIR [, DESCRIPTION])
dnl
dnl This macro _AC_DEFINEs VARNAME to the expansion of the DIR
dnl variable, taking care of fixing up ${prefix} and such.
dnl
dnl Note that the 3 argument form is only supported with autoconf 2.13 and
dnl later (i.e. only where _AC_DEFINE supports 3 arguments).
dnl
dnl Examples:
dnl
dnl    AC_DEFINE_DIR(DATADIR, datadir)
dnl    AC_DEFINE_DIR(PROG_PATH, bindir, [Location of installed binaries])
dnl
dnl @version $Id: acinclude.m4 25 2006-04-22 17:24:27Z mmmaddd $
dnl @author Guido Draheim <guidod@gmx.de>, original by Alexandre Oliva

AC_DEFUN([AC_DEFINE_DIR], [
  test "x$prefix" = xNONE && prefix="$ac_default_prefix"
  test "x$exec_prefix" = xNONE && exec_prefix='${prefix}'
  ac_define_dir=`eval echo [$]$2`
  ac_define_dir=`eval echo [$]ac_define_dir`
  ifelse($3, ,
    AC_DEFINE_UNQUOTED($1, "$ac_define_dir"),
    AC_DEFINE_UNQUOTED($1, "$ac_define_dir", $3))
])



