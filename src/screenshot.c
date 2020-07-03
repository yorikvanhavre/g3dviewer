/* $Id: screenshot.c 41 2006-05-22 12:23:29Z mmmaddd $ */

/*
	G3DViewer - 3D object viewer

	Copyright (C) 2005, 2006  Markus Dahms <mad@automagically.de>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#ifdef HAVE_CONFIG_H
#	include <config.h>
#endif

#include <gdk-pixbuf/gdk-pixbuf.h>
#include <GL/gl.h>

static guint8 *screenshot_get_pixels(guint32 width, guint32 height)
{
	guint8 *pixels;

	pixels = g_new(guint8, width * height * 4);

	glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, pixels);

	return pixels;
}

gboolean screenshot_save(const gchar *filename, guint32 width, guint32 height)
{
	guint8 *pixels;
	GdkPixbuf *pixbuf, *flipped;

	pixels = screenshot_get_pixels(width, height);

	if(pixels == NULL)
		return FALSE;

	pixbuf = gdk_pixbuf_new_from_data(pixels,
		GDK_COLORSPACE_RGB, TRUE,
		8, width, height, width * 4,
		NULL, NULL);

	if(pixbuf == NULL)
		return FALSE;

	/* GL returns pixels starting from lower left corner */
	flipped = gdk_pixbuf_flip(pixbuf, FALSE);

	if(flipped == NULL)
		return FALSE;

	gdk_pixbuf_save(flipped, filename, "png", NULL, NULL);

	g_free(pixels);

	gdk_pixbuf_unref(pixbuf);
	gdk_pixbuf_unref(flipped);

	return TRUE;
}
