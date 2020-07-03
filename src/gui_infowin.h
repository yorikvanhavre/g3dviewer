/* $Id: gui_infowin.h 25 2006-04-22 17:24:27Z mmmaddd $ */

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

#ifndef _GUI_INFOWIN_H
#define _GUI_INFOWIN_H

#include <gtk/gtk.h>
#include <g3d/g3d.h>

gboolean gui_infowin_initialize(G3DViewer *viewer, GtkWidget *treeview);
gboolean gui_infowin_clean(G3DViewer *viewer);
gboolean gui_infowin_update(G3DViewer *viewer);

#endif /* _GUI_INFOWIN_H */
