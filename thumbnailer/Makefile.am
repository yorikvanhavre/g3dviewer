bin_PROGRAMS = g3d-thumbnailer

g3d_thumbnailer_SOURCES = \
	g3d-thumbnailer.c \
	../src/trackball.c \
	../src/gl.c \
	../src/texture.c \
	../src/screenshot.c

g3d_thumbnailer_CFLAGS = \
	-I$(top_srcdir) -I$(top_builddir) -I$(top_srcdir)/src \
	-Wall -ansi \
	@X_CFLAGS@ @LIBG3D_CFLAGS@ \
	@GTK_CFLAGS@ \
	-DDEBUG=@DEBUG@

g3d_thumbnailer_LDFLAGS = \
	@X_LIBS@ @GL_LIBS@ @GTK_LIBS@ @LIBG3D_LIBS@

mimelocaldir = ${HOME}/.local/share/mime
mimefiles = g3dviewer.xml

install-data-user: install-mime-user install-schema-user

install-mime-user: ${mimefiles}
	mkdir -p ${mimelocaldir}/packages
	mkdir -p ${mimelocaldir}/applications
	cp ${mimefiles} ${mimelocaldir}/packages
	update-mime-database ${mimelocaldir}

install-schema-user:
	./gen_schema.sh
	gconftool-2 --install-schema-file=g3d-thumbnailer.schema

EXTRA_DIST = \
	g3dviewer.xml \
	gen_schema.sh
