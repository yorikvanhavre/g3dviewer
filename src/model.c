/* $Id: model.c 54 2006-06-05 11:33:11Z mmmaddd $ */

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

#include <g3d/g3d.h>

#include "main.h"
#include "texture.h"
#include "gui_glade.h"
#include "gui_infowin.h"
#include "gui_log.h"

gboolean model_load(G3DViewer *viewer)
{
	G3DModel *model;
	gchar *title;
	gboolean retval = FALSE;

	/* free old model */
	model = viewer->model;
	viewer->model = NULL;
	if(model)
		g3d_model_free(model);

	/* clean log */
	gui_log_clean(viewer);

	model = g3d_model_load(viewer->g3dcontext, viewer->filename);
	if(model)
	{
		viewer->model = model;
		texture_load_all_textures(viewer->model);
		title = g_strdup_printf(_("%s successfully loaded."),
			viewer->filename ? viewer->filename : _("unnamed model"));
		gui_glade_status(viewer, title);
		g_free(title);
		retval = TRUE;
	}

#if DEBUG > 3
	g_printerr("[model] model pointer: %p\n", model);
#endif

	/* update model information */
	gui_infowin_update(viewer);

	/* update window title */
	title = g_strdup_printf("g3dviewer%s%s",
		viewer->model ? " - " : "",
		viewer->filename ? viewer->filename : "");
	gtk_window_set_title(GTK_WINDOW(viewer->interface.window), title);
	g_free(title);

	return retval;
}
