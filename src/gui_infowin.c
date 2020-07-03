/* $Id: gui_infowin.c 36 2006-05-08 20:10:44Z mmmaddd $ */

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

#include <stdlib.h>
#include <string.h>

#include <gtk/gtk.h>

#include "main.h"
#include "glarea.h"

enum _columns
{
	COL_TYPE,
	COL_TITLE,
	COL_ICON,
	COL_VALUE,
	COL_CHECK,
	COL_SHOWHIDE,
	COL_POINTER,
	N_COLUMNS
};

enum _types
{
	TYPE_OBJECT,
	TYPE_MATERIAL,
	TYPE_TEXTURE,
	TYPE_PROPERTY,
	TYPE_FOLDER,
	N_TYPES
};

enum _icons
{
	ICON_MODEL,
	ICON_OBJECT,
	ICON_MATERIAL,
	ICON_TEXTURE,
	ICON_PROPERTY,
	N_ICONS
};

static GtkTreeStore *gui_infowin_create_model(void);
static gboolean gui_infowin_clean(G3DViewer *viewer);
static gboolean gui_infowin_create_columns(GtkWidget *treeview,
	GtkTreeModel *model, G3DViewer *viewer);

gboolean gui_infowin_initialize(G3DViewer *viewer, GtkWidget *treeview)
{
	GtkTreeStore *treestore;
	GtkTreeSelection *select;
	GtkTreeIter iter;

	treestore = gui_infowin_create_model();
	gtk_tree_view_set_model(GTK_TREE_VIEW(treeview),
		GTK_TREE_MODEL(treestore));
	viewer->info.treestore = treestore;

	if(gui_infowin_create_columns(treeview, GTK_TREE_MODEL(treestore),
		viewer) == FALSE)
		return FALSE;

	/* selection */
	select = gtk_tree_view_get_selection(GTK_TREE_VIEW(treeview));
	gtk_tree_selection_set_mode(select, GTK_SELECTION_SINGLE);

	/* initial nodes */
	gtk_tree_store_append(treestore, &iter, NULL);

	/* load icons */
	viewer->interface.icons = g_new0(GdkPixbuf *, N_ICONS);
	viewer->interface.icons[ICON_MODEL] =
		gdk_pixbuf_new_from_file(
			DATA_DIR "/pixmaps/icon16_model.xpm", NULL);
	viewer->interface.icons[ICON_OBJECT] =
		gdk_pixbuf_new_from_file(
			DATA_DIR "/pixmaps/icon16_object.png", NULL);
	viewer->interface.icons[ICON_MATERIAL] =
		gdk_pixbuf_new_from_file(
			DATA_DIR "/pixmaps/icon16_material.xpm", NULL);
	viewer->interface.icons[ICON_TEXTURE] =
		gdk_pixbuf_new_from_file(
			DATA_DIR "/pixmaps/icon16_texture.xpm", NULL);
	viewer->interface.icons[ICON_PROPERTY] =
		gdk_pixbuf_new_from_file(
			DATA_DIR "/pixmaps/icon16_property.png", NULL);

	return TRUE;
}

void gui_infowin_cleanup(G3DViewer *viewer)
{
	gint32 i;

	gui_infowin_clean(NULL);

	/* cleanup icons */
	for(i = 0; i < N_ICONS; i ++)
		gdk_pixbuf_unref(viewer->interface.icons[i]);

	g_free(viewer->interface.icons);
}

/****************************************************************************/

static GtkTreeStore *gui_infowin_create_model(void)
{
	GtkTreeStore *treestore;

	treestore = gtk_tree_store_new(N_COLUMNS,
		G_TYPE_INT, /* type of node */
		G_TYPE_STRING, /* title */
		GDK_TYPE_PIXBUF, /* pixbuf pointer */
		G_TYPE_STRING, /* number */
		G_TYPE_BOOLEAN, /* show checkbox */
		G_TYPE_BOOLEAN, /* show/hide object */
		G_TYPE_POINTER /* custom pointer (object, etc.) */
		);

	return treestore;
}

static void gui_infowin_object_hide_cb(GtkCellRendererToggle *renderer,
	gchar *pathstr, gpointer data)
{
	GtkTreePath *path;
	GtkTreeIter iter;
	GtkTreeModel *model;
	gboolean toggle_item;
	G3DViewer *viewer;
	G3DObject *object;
	gpointer ptr;

	model = g_object_get_data(G_OBJECT(renderer), "model");
	viewer = g_object_get_data(G_OBJECT(renderer), "viewer");

	g_assert(model);
	g_assert(viewer);

	path = gtk_tree_path_new_from_string(pathstr);
	gtk_tree_model_get_iter(model, &iter, path);

	gtk_tree_model_get(model, &iter,
		COL_SHOWHIDE, &toggle_item,
		COL_POINTER, &ptr,
		-1);
	object = (G3DObject *)ptr;

#if DEBUG > 3
	g_printerr("D: gui_infowin_object_hide_cb: object=0x%p (%i)\n", object,
		toggle_item);
#endif

	gtk_tree_path_free(path);

	if(object == NULL) return;

	toggle_item ^= 1;
	object->hide = !toggle_item;

	gtk_tree_store_set(GTK_TREE_STORE(model), &iter, COL_SHOWHIDE,
		toggle_item, -1);

	glarea_update(viewer->interface.glarea);
}

static gboolean gui_infowin_create_columns(GtkWidget *treeview,
	GtkTreeModel *model, G3DViewer *viewer)
{
	GtkCellRenderer *renderer;
	GtkTreeViewColumn *column;

	/* visibility column */
	renderer = gtk_cell_renderer_toggle_new();
	g_object_set_data(G_OBJECT(renderer), "model", model);
	g_object_set_data(G_OBJECT(renderer), "viewer", viewer);
	g_signal_connect(G_OBJECT(renderer), "toggled",
		G_CALLBACK(gui_infowin_object_hide_cb), NULL);
	column = gtk_tree_view_column_new_with_attributes("Show",
		renderer,
		"active", COL_SHOWHIDE,
		"visible", COL_CHECK,
		"activatable", COL_CHECK,
		NULL);
	gtk_tree_view_append_column(GTK_TREE_VIEW(treeview), column);

	/* title column */
	column = gtk_tree_view_column_new();

	/* title column: icon */
	renderer = gtk_cell_renderer_pixbuf_new();
	gtk_tree_view_column_pack_start(column, renderer, FALSE);
	gtk_tree_view_column_set_attributes(column, renderer,
		"pixbuf", COL_ICON,
		NULL);

	/* title column: text */
	renderer = gtk_cell_renderer_text_new();
	gtk_tree_view_column_pack_start(column, renderer, TRUE);
	gtk_tree_view_column_set_attributes(column, renderer,
		"text", COL_TITLE,
		NULL);

	gtk_tree_view_append_column(GTK_TREE_VIEW(treeview), column);
	gtk_tree_view_set_expander_column(GTK_TREE_VIEW(treeview), column);

	/* value column */
	renderer = gtk_cell_renderer_text_new();
	column = gtk_tree_view_column_new_with_attributes("Value",
		renderer,
		"text", COL_VALUE,
		NULL);
	gtk_tree_view_append_column(GTK_TREE_VIEW(treeview), column);

	gtk_tree_view_set_headers_visible(GTK_TREE_VIEW(treeview), FALSE);

	return TRUE;
}


static gboolean gui_infowin_remove_children(GtkTreeStore *treestore,
	GtkTreeIter *iter_parent)
{
	GtkTreeIter iter_child;
	gint n, i;

	n = gtk_tree_model_iter_n_children(GTK_TREE_MODEL(treestore),
		iter_parent);
	gtk_tree_model_iter_children(GTK_TREE_MODEL(treestore),
		&iter_child, iter_parent);

	for(i = 0; i < n; i ++)
	{
		gui_infowin_remove_children(treestore, &iter_child);
		gtk_tree_store_remove(treestore, &iter_child);
	}

	return TRUE;
}

static gboolean gui_infowin_clean(G3DViewer *viewer)
{
	gui_infowin_remove_children(viewer->info.treestore, NULL);

	return TRUE;
}

static gboolean add_texture(G3DViewer *viewer, GtkTreeIter *parentiter,
	G3DImage *texture)
{
	GtkTreeIter iter;

	if(texture)
	{
		gtk_tree_store_append(viewer->info.treestore, &iter, parentiter);
		gtk_tree_store_set(viewer->info.treestore, &iter,
			COL_TYPE, TYPE_TEXTURE,
			COL_TITLE, texture->name,
			COL_VALUE, "",
			COL_CHECK, FALSE,
			COL_ICON, viewer->interface.icons[ICON_TEXTURE],
			-1);

		return TRUE;
	}

	return FALSE;
}

static gboolean add_materials(G3DViewer *viewer, GtkTreeIter *parentiter,
	GSList *materials)
{
	GSList *mlist;
	GtkTreeIter iter1, iter2;
	G3DMaterial *material;
	gchar *matname, *stmp;

	mlist = materials;
	while(mlist != NULL)
	{
		material = (G3DMaterial *)mlist->data;

		if(material->name && strlen(material->name))
			matname = material->name;
		else
			matname = _("(unnamed material)");

		gtk_tree_store_append(viewer->info.treestore, &iter1, parentiter);
		gtk_tree_store_set(viewer->info.treestore, &iter1,
			COL_TYPE, TYPE_MATERIAL,
			COL_TITLE, matname,
			COL_ICON, viewer->interface.icons[ICON_MATERIAL],
			COL_VALUE, "",
			COL_CHECK, FALSE,
			-1);

		add_texture(viewer, &iter1, material->tex_image);

		/* material properties */
		stmp = g_strdup_printf("#%02X%02X%02X",
			(gint)(material->r * 255),
			(gint)(material->g * 255),
			(gint)(material->b * 255));
		gtk_tree_store_append(viewer->info.treestore, &iter2, &iter1);
		gtk_tree_store_set(viewer->info.treestore, &iter2,
			COL_TYPE, TYPE_PROPERTY,
			COL_TITLE, _("color"),
			COL_VALUE, stmp,
			COL_CHECK, FALSE,
			COL_ICON, viewer->interface.icons[ICON_PROPERTY],
			-1);
		g_free(stmp);

		/* next material */
		mlist = mlist->next;
	}

	return TRUE;
}

static gboolean add_objects(G3DViewer *viewer, GtkTreeIter *parentiter,
	GSList *objects)
{
	GtkTreeIter iter, iter2;
	G3DObject *object;
	gchar *stmp;

	while(objects != NULL)
	{
		object = (G3DObject *)objects->data;

		/* object node */
		gtk_tree_store_append(viewer->info.treestore, &iter, parentiter);
		gtk_tree_store_set(viewer->info.treestore, &iter,
			COL_TYPE, TYPE_OBJECT,
			COL_TITLE, object->name,
			COL_ICON, viewer->interface.icons[ICON_OBJECT],
			COL_VALUE, "",
			COL_CHECK, TRUE,
			COL_SHOWHIDE, TRUE,
			COL_POINTER, object,
			-1);

		/* sub-objects */
		add_objects(viewer, &iter, object->objects);

		/* texture image */
		add_texture(viewer, &iter, object->tex_image);

		/* vertices */
		stmp = g_strdup_printf("%d", object->vertex_count);
		gtk_tree_store_append(viewer->info.treestore, &iter2, &iter);
		gtk_tree_store_set(viewer->info.treestore, &iter2,
			COL_TYPE, TYPE_PROPERTY,
			COL_TITLE, _("number of vertices"),
			COL_VALUE, stmp,
			COL_CHECK, FALSE,
			COL_ICON, viewer->interface.icons[ICON_PROPERTY],
			-1);
		g_free(stmp);

		/* faces */
		stmp = g_strdup_printf("%d", g_slist_length(object->faces));
		gtk_tree_store_append(viewer->info.treestore, &iter2, &iter);
		gtk_tree_store_set(viewer->info.treestore, &iter2,
			COL_TYPE, TYPE_PROPERTY,
			COL_TITLE, _("number of faces"),
			COL_VALUE, stmp,
			COL_CHECK, FALSE,
			COL_ICON, viewer->interface.icons[ICON_PROPERTY],
			-1);
		g_free(stmp);

		/* materials */
		stmp = g_strdup_printf("%d", g_slist_length(object->materials));
		gtk_tree_store_append(viewer->info.treestore, &iter2, &iter);
		gtk_tree_store_set(viewer->info.treestore, &iter2,
			COL_TYPE, TYPE_PROPERTY,
			COL_TITLE, _("number of materials"),
			COL_VALUE, stmp,
			COL_CHECK, FALSE,
			COL_ICON, viewer->interface.icons[ICON_PROPERTY],
			-1);
		g_free(stmp);

		/* add object-specific materials */
		add_materials(viewer, &iter, object->materials);

		objects = objects->next;
	}

	return TRUE;
}

gboolean gui_infowin_update(G3DViewer *viewer)
{
	GtkTreeIter rootiter;
	gchar *stmp, *basename;

	/* clear tree */
	gui_infowin_clean(viewer);

	if(viewer->model == NULL) return FALSE;

	basename = g_path_get_basename(viewer->model->filename);
	stmp = g_strdup_printf("%s: %s", _("model"), basename);
	gtk_tree_store_append(viewer->info.treestore, &rootiter, NULL);
	gtk_tree_store_set(viewer->info.treestore, &rootiter,
		COL_TYPE, TYPE_FOLDER,
		COL_TITLE, stmp,
		COL_VALUE, "",
		COL_CHECK, FALSE,
		COL_ICON, viewer->interface.icons[ICON_MODEL],
		-1);
	g_free(basename);
	g_free(stmp);

	if(viewer->model == NULL) return FALSE;

	/* append objects */
	add_objects(viewer, &rootiter, viewer->model->objects);

	/* add global materials */
	add_materials(viewer, &rootiter, viewer->model->materials);

	return TRUE;
}
