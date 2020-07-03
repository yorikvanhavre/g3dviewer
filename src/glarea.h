/* $Id: glarea.h 25 2006-04-22 17:24:27Z mmmaddd $ */

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

#ifndef _GLAREA_H
#define _GLAREA_H

#include <gtk/gtk.h>

void glarea_update(GtkWidget *glarea);

gint glarea_expose(GtkWidget *widget, GdkEventExpose *event);
gint glarea_configure(GtkWidget *widget, GdkEventConfigure *event);
gint glarea_destroy(GtkWidget *widget);
gint glarea_scroll(GtkWidget *widget, GdkEventScroll *event);
gint glarea_button_pressed(GtkWidget *widget, GdkEventButton *event);
gint glarea_motion_notify(GtkWidget *widget, GdkEventMotion *event);

#endif
