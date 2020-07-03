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

#ifdef HAVE_CONFIG_H
#	include <config.h>
#endif

#include <stdlib.h>
#include <string.h>

#include <gtk/gtk.h>

#include "main.h"

enum _columns
{
	COL_LOGLEVEL,
	COL_ICON,
	COL_MESSAGE,
	COL_SET_BG,
	COL_BGCOLOR,
	COL_SET_FAMILY,
	COL_FAMILY,
	N_COLUMNS
};

static GtkTreeStore *gui_log_create_model(void);
static gboolean gui_log_create_columns(GtkWidget *treeview,
	GtkTreeModel *model, G3DViewer *viewer);
static GtkTreeIter *gui_log_parent_iter_for_level(GtkTreeModel *model,
	gint32 level, GtkTreeIter *parentiter);
static gboolean gui_log_remove_children(GtkTreeStore *treestore,
	GtkTreeIter *iter_parent);

gboolean gui_log_initialize(G3DViewer *viewer, GtkWidget *treeview)
{
	GtkTreeStore *treestore;
	GtkTreeSelection *select;

	treestore = gui_log_create_model();
	gtk_tree_view_set_model(GTK_TREE_VIEW(treeview),
		GTK_TREE_MODEL(treestore));
	viewer->info.logtreestore = treestore;

	if(gui_log_create_columns(treeview, GTK_TREE_MODEL(treestore),
		viewer) == FALSE)
	{
		return FALSE;
	}

	select = gtk_tree_view_get_selection(GTK_TREE_VIEW(treeview));
	gtk_tree_selection_set_mode(select, GTK_SELECTION_SINGLE);

	return TRUE;
}

void gui_log_clean(G3DViewer *viewer)
{
	gui_log_remove_children(viewer->info.logtreestore, NULL);
}

void gui_log_cleanup(G3DViewer *viewer)
{
	gui_log_clean(viewer);
}

void gui_log_handler(const gchar *log_domain, GLogLevelFlags log_level,
	const gchar *message, gpointer user_data)
{
	G3DViewer *viewer;
	GtkTreeIter iter, *parentiter;
	gchar *stock_id, *stripped_msg;
	gint32 level;
	gchar *family = "Sans Serif";
	gchar *bgcolor = "#FFFFFF";

	viewer = (G3DViewer *)user_data;

	switch(log_level)
	{
		case G_LOG_LEVEL_DEBUG:
			stock_id = "gtk-dialog-question";
			family = "Monospace";
			break;
		case G_LOG_LEVEL_INFO:
			stock_id = "gtk-dialog-info";
			break;
		case G_LOG_LEVEL_MESSAGE:
			stock_id = "gtk-info";
			break;
		case G_LOG_LEVEL_WARNING:
			stock_id = "gtk-dialog-warning";
			bgcolor = "#FF8080";
			break;
		default:
			stock_id = "gtk-about";
			break;
	}

	stripped_msg = (gchar *)message;
	while(*stripped_msg == ' ') stripped_msg ++;

	level = stripped_msg - message;
	parentiter = gui_log_parent_iter_for_level(
		GTK_TREE_MODEL(viewer->info.logtreestore), level, NULL);

	gtk_tree_store_append(viewer->info.logtreestore, &iter, parentiter);
	gtk_tree_store_set(viewer->info.logtreestore, &iter,
		COL_LOGLEVEL, log_level,
		COL_ICON, stock_id,
		COL_MESSAGE, g_strdup(stripped_msg),
		COL_SET_FAMILY, TRUE,
		COL_FAMILY, family,
		COL_SET_BG, TRUE,
		COL_BGCOLOR, bgcolor,
		-1);

	if(parentiter) g_free(parentiter);

#if 0
	g_print("[%s] %s\n", log_domain, message);
#endif
}

/*
 * private stuff
 */

static GtkTreeStore *gui_log_create_model(void)
{
	GtkTreeStore *treestore;

	treestore = gtk_tree_store_new(N_COLUMNS,
		G_TYPE_INT, /* LOGLEVEL */
		G_TYPE_STRING, /* ICON */
		G_TYPE_STRING, /* MESSAGE */
		G_TYPE_BOOLEAN, /* SET BACKGROUND */
		G_TYPE_STRING, /* BACKGROUND COLOR */
		G_TYPE_BOOLEAN, /* SET FAMILY */
		G_TYPE_STRING /* FAMILY */
		);

	return treestore;
}

static gboolean gui_log_create_columns(GtkWidget *treeview,
	GtkTreeModel *model, G3DViewer *viewer)
{
	GtkCellRenderer *renderer;
	GtkTreeViewColumn *column;

	column = gtk_tree_view_column_new();

	/* icon */
	renderer = gtk_cell_renderer_pixbuf_new();
	gtk_tree_view_column_pack_start(column, renderer, FALSE);
	gtk_tree_view_column_set_attributes(column, renderer,
		"stock-id", COL_ICON,
		NULL);

	/* message */
	renderer = gtk_cell_renderer_text_new();
	gtk_tree_view_column_pack_start(column, renderer, TRUE);
	gtk_tree_view_column_set_attributes(column, renderer,
		"text", COL_MESSAGE,
		"background-set", COL_SET_BG,
		"background", COL_BGCOLOR,
		"family-set", COL_SET_FAMILY,
		"family", COL_FAMILY,
		NULL);

	gtk_tree_view_append_column(GTK_TREE_VIEW(treeview), column);
	gtk_tree_view_set_expander_column(GTK_TREE_VIEW(treeview), column);

	gtk_tree_view_set_headers_visible(GTK_TREE_VIEW(treeview), FALSE);

	return TRUE;
}

static GtkTreeIter *gui_log_parent_iter_for_level(GtkTreeModel *model,
	gint32 level, GtkTreeIter *parentiter)
{
	GtkTreeIter *iter, *iter2;

	if(level == 0) return NULL;

	if(gtk_tree_model_iter_n_children(model, parentiter) == 0)
		return NULL;

	iter = g_new0(GtkTreeIter, 1);

	if(gtk_tree_model_iter_nth_child(model, iter, parentiter,
		gtk_tree_model_iter_n_children(model, parentiter) - 1) == FALSE)
	{
		g_free(iter);
		return NULL;
	}

	if(level == 1)
	{
		return iter;
	}

	iter2 = gui_log_parent_iter_for_level(model, level - 1, iter);
	g_free(iter);

	return iter2;
}

static gboolean gui_log_remove_children(GtkTreeStore *treestore,
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
		gui_log_remove_children(treestore, &iter_child);
		gtk_tree_store_remove(treestore, &iter_child);
	}

	return TRUE;
}

