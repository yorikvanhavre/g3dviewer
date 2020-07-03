/* $Id: gui_glade.h 47 2006-05-22 17:53:38Z mmmaddd $ */

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

#ifndef _GUI_GLADE_H
#define _GUI_GLADE_H

#include "main.h"

gboolean gui_glade_init(G3DViewer *viewer);
gboolean gui_glade_load(G3DViewer *viewer);
gboolean gui_glade_open_dialog(G3DViewer *viewer);
gboolean gui_glade_status(G3DViewer *viewer, const gchar *text);

/* callbacks */
gboolean gui_glade_set_bgcolor_cb(
	gfloat r, gfloat g, gfloat b, gfloat a,
	gpointer user_data);
gboolean gui_glade_update_interface_cb(gpointer user_data);
gboolean gui_glade_update_progress_bar_cb(gfloat percentage,
	gboolean show, gpointer user_data);

#endif /* _GUI_GLADE_H */
