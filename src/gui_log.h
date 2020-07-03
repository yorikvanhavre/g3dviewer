/* $Id:$ */

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

#ifndef _GUI_LOG_H
#define _GUI_LOG_H

#include "main.h"

#include <gtk/gtk.h>

gboolean gui_log_initialize(G3DViewer *viewer, GtkWidget *treeview);
void gui_log_clean(G3DViewer *viewer);
void gui_log_cleanup(G3DViewer *viewer);
void gui_log_handler(const gchar *log_domain, GLogLevelFlags log_level,
	const gchar *message, gpointer user_data);

#endif /* _GUI_LOG_H */
