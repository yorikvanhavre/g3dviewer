/* $Id: g3d-thumbnailer.c 61 2006-11-09 15:31:12Z mmmaddd $ */

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

#include <stdio.h>
#include <stdlib.h>

#include <X11/Xlib.h>
#include <GL/glx.h>

#include <gtk/gtk.h>
#include <glib.h>
#include <g3d/g3d.h>

#include "gl.h"
#include "trackball.h"
#include "screenshot.h"
#include "texture.h"

static gboolean setup_gl(guint32 width, guint32 height)
{
	Display *display;
	XVisualInfo *visinfo;
	Pixmap pixmap;
	GLXPixmap glxpixmap;
	GLXContext glxctx;
	char *dpyname;
	int attrlist_dbl[] = {
		GLX_RGBA,
		GLX_DOUBLEBUFFER,
		GLX_RED_SIZE, 1,
		GLX_GREEN_SIZE, 1,
		GLX_BLUE_SIZE, 1,
		None};
	int attrlist_sng[] = {
		GLX_RGBA,
		GLX_RED_SIZE, 1,
		GLX_GREEN_SIZE, 1,
		GLX_BLUE_SIZE, 1,
		None};

	dpyname = getenv("DISPLAY");

	display = XOpenDisplay(dpyname);
	if(display == NULL)
	{
		g_printerr("ERROR: could not open display '%s'\n",
			dpyname ? dpyname : "(null)");
		return FALSE;
	}

	visinfo = glXChooseVisual(display, DefaultScreen(display), attrlist_sng);
	if(visinfo == NULL)
	{
		/* try with double buffering */
		visinfo = glXChooseVisual(display, DefaultScreen(display),
			attrlist_dbl);
		if(visinfo == NULL)
		{
			g_printerr("ERROR: could not get a supported visual\n");
			return FALSE;
		}
	}

	glxctx = glXCreateContext(display, visinfo, 0, GL_FALSE);
	if(glxctx == NULL)
	{
		g_printerr("ERROR: could not create GLX context\n");
		return FALSE;
	}

	pixmap = XCreatePixmap(display, RootWindow(display, visinfo->screen),
		width, height, visinfo->depth);
	if(pixmap <= 0)
	{
		g_printerr("ERROR: could not create pixmap\n");
		return FALSE;
	}

	glxpixmap = glXCreateGLXPixmap(display, visinfo, pixmap);
	if(glxpixmap <= 0)
	{
		g_printerr("ERROR: could not create GLX pixmap\n");
		return FALSE;
	}

	glXMakeCurrent(display, glxpixmap, glxctx);

	return TRUE;
}

int main(int argc, char *argv[])
{
	G3DContext *context;
	G3DModel *model;
	gfloat bgcolor[4] = { 1.0, 1.0, 1.0, 0.0 };
	gfloat quat[4] = { 0.10, -0.31, -0.87, 0.38 };
	guint32 width = 128;
	guint32 height = 128;

	gtk_init(&argc, &argv);

	setup_gl(width, height);

	if(argc < 3)
	{
		g_print("usage: %s <input file: model> <output file: image> "
			"[<width in px>]\n",
			argv[0]);
		return EXIT_FAILURE;
	}

	if(argc > 3)
	{
		/* size */
		width = atoi(argv[3]);
		/* height = width / 4 * 3; */
		height = width;
	}

	context = g3d_context_new();
	model = g3d_model_load(context, argv[1]);

	if(model)
	{
		texture_load_all_textures(model);

		gl_draw(
			G3D_FLAG_GL_SHININESS | G3D_FLAG_GL_ALLTWOSIDE |
			G3D_FLAG_GL_TEXTURES,
			45 /* zoom */,
			(gfloat)width / (gfloat)height,
			bgcolor,
			quat,
			model);

		glXWaitGL();

		if(screenshot_save(argv[2], width, height))
		{
			return EXIT_SUCCESS;
		}
	}

	return EXIT_FAILURE;
}
