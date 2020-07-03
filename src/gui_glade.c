/* $Id: gui_glade.c 58 2006-11-05 19:21:04Z mmmaddd $ */

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
#include <gtk/gtkgl.h>
#include <glade/glade-xml.h>

#include <g3d/plugins.h>

#include "main.h"
#include "model.h"
#include "glarea.h"

#include "gui_glade.h"
#include "gui_infowin.h"
#include "gui_log.h"

static void gui_glade_clone_menuitem(GtkWidget *menuitem, gpointer user_data);

/*
 * initializes libglade
 */

gboolean gui_glade_init(G3DViewer *viewer)
{
	return TRUE;
}

static void gui_glade_add_open_filters(G3DViewer *viewer)
{
	GtkWidget *opendialog;
	GtkFileFilter *filter;
	GSList *plugins;
	G3DPlugin *plugin;
	gchar *name, *exts, **ext, *glob, *tmp;

	opendialog = glade_xml_get_widget(viewer->interface.xml, "open_dialog");

	/* "all files" filter */
	filter = gtk_file_filter_new();
	gtk_file_filter_set_name(filter, _("all files"));
	gtk_file_filter_add_pattern(filter, "*");
	gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(opendialog), filter);

	/* FIXME: evil hack? */
	plugins = viewer->g3dcontext->plugins;
	while(plugins)
	{
		plugin = (G3DPlugin *)plugins->data;
		plugins = plugins->next;

		if(plugin->type != G3D_PLUGIN_IMPORT) continue;

		filter = gtk_file_filter_new();
		exts = g_strjoinv(", ", plugin->extensions);
		if(strlen(exts) > 30)
		{
			tmp = exts;
			exts = g_strdup_printf("%.*s...", 30, tmp);
			g_free(tmp);
		}
		name = g_strdup_printf("%s (%s)", plugin->name, exts);
		gtk_file_filter_set_name(filter, name);
		g_free(name);
		g_free(exts);

		ext = plugin->extensions;
		while(ext && *ext)
		{
			glob = g_strdup_printf("*.%s", *ext);
			gtk_file_filter_add_pattern(filter, glob);
			g_free(glob);

			ext ++;
		}

		gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(opendialog), filter);
	}
}

/*
 * loads interface from .glade file
 */

gboolean gui_glade_load(G3DViewer *viewer)
{
	GladeXML *xml;
	GtkWidget *window, *widget, *popupmenu, *glarea, *statusbar;
	gint i;
	static const gchar *viewer_widgets[] = {
		"main_window",
		"mi_file_open",
		"mi_properties",
		"mi_screenshot",
		"mi_show_menubar",
		"mi_show_toolbar",
		"mi_fullscreen",
		"mi_zoomfit",
		"mi_wireframe",
		"mi_specular",
		"mi_shininess",
		"mi_textures",
		"mi_twosided",
		"mi_bgcolor",
		"mi_info",
		"tb_file_open",
		"tb_properties",
		"tb_zoomfit",
		"tb_screenshot",
		"tb_log_clear",
		"tb_log_save",
		"cs_background",
		"gtkglext1",
		NULL };

	/* load main window from xml */
	xml = glade_xml_new(DATA_DIR "/glade/g3dviewer.glade",
		NULL, NULL);

	viewer->interface.xml = xml;

	glade_xml_signal_autoconnect(xml);
	window = glade_xml_get_widget(xml, "main_window");

	/* connect glarea (TODO: remove link) */
	glarea = glade_xml_get_widget(xml, "gtkglext1");
	viewer->interface.glarea = glarea;

	/* connect viewer pointer to objects */
	i = 0;
	while(viewer_widgets[i] != NULL)
	{
		widget = glade_xml_get_widget(xml, viewer_widgets[i]);
		if(widget)
		{
#if DEBUG > 1
			g_printerr("D: viewer_widgets[%d]: %s\n", i, viewer_widgets[i]);
#endif
			g_object_set_data(G_OBJECT(widget), "viewer", viewer);
		}
		i ++;
	}

	/* initialize infowin */
	gui_infowin_initialize(viewer, glade_xml_get_widget(xml, "proptree"));

	/* connect main menu to glarea */
	popupmenu = gtk_menu_new();
	gtk_container_foreach(
		GTK_CONTAINER(glade_xml_get_widget(xml, "menu_main")),
		gui_glade_clone_menuitem,
		popupmenu);
	g_object_set_data(G_OBJECT(viewer->interface.glarea), "menu",
		popupmenu);
	gtk_widget_show_all(popupmenu);

	/* get statusbar context id */
	statusbar = glade_xml_get_widget(viewer->interface.xml, "statusbar");
	viewer->interface.status_context_id = gtk_statusbar_get_context_id(
		GTK_STATUSBAR(statusbar), "default");

	/* update "open" dialog */
	gui_glade_add_open_filters(viewer);

	/* initialize log */
	gui_log_initialize(viewer, glade_xml_get_widget(xml, "logtree"));
	g_log_set_handler("LibG3D", G_LOG_LEVEL_MASK, gui_log_handler, viewer);

	/* show main window */
	viewer->interface.window = window;
	gtk_widget_show_all(window);

	/* hide progress bar */
	gui_glade_update_progress_bar_cb(0.0, FALSE, viewer);

	glarea_update(viewer->interface.glarea);

	return TRUE;
}

/*
 * custom log handler to suppress warning in gui_glade_clone_menuitem
 */
static void gui_glade_null_logger(const gchar *log_domain,
	GLogLevelFlags log_level,
	const gchar *message, gpointer unused_data)
{
	; /* do nothing */
}

/*
 * clones one main menu item and attaches it to a popup menu
 */
static void gui_glade_clone_menuitem(GtkWidget *menuitem, gpointer user_data)
{
	GtkWidget *menu, *newmi;
	GList *children;
	const gchar *label;

	menu = (GtkWidget *)user_data;

	children = gtk_container_get_children(GTK_CONTAINER(menuitem));
	if(children)
	{
		label = gtk_label_get_text(GTK_LABEL(g_list_nth_data(children, 0)));
	}
	else return;

#if DEBUG > 1
	g_printerr("D: label: %s\n", label);
#endif
	newmi = gtk_menu_item_new_with_label(label);
	gtk_menu_shell_append(GTK_MENU_SHELL(menu), newmi);

	/* disable warning */
	g_log_set_default_handler(gui_glade_null_logger, NULL);

	/* this normally generates a warning:
	 * gtk_menu_attach_to_widget(): menu already attached to GtkMenuItem
	 */
	gtk_menu_item_set_submenu(GTK_MENU_ITEM(newmi),
		gtk_menu_item_get_submenu(GTK_MENU_ITEM(menuitem)));

	/* reenable logging */
	g_log_set_default_handler(g_log_default_handler, NULL);
}

/*
 * show "open" dialog
 */
gboolean gui_glade_open_dialog(G3DViewer *viewer)
{
	GtkWidget *opendialog;
	gchar *filename;
	gint retval;

	opendialog = glade_xml_get_widget(viewer->interface.xml, "open_dialog");

	retval = gtk_dialog_run(GTK_DIALOG(opendialog));
	gtk_widget_hide(opendialog);
	if(retval == GTK_RESPONSE_OK)
	{
		filename = gtk_file_chooser_get_filename(GTK_FILE_CHOOSER(opendialog));

		if(viewer->filename)
			g_free(viewer->filename);
		viewer->filename = filename;

		retval = model_load(viewer);

		glarea_update(viewer->interface.glarea);

		return retval;
	}

	return FALSE;
}

/*
 * show text in status bar
 */

gboolean gui_glade_status(G3DViewer *viewer, const gchar *text)
{
	GtkWidget *statusbar;

	statusbar = glade_xml_get_widget(viewer->interface.xml, "statusbar");
	gtk_statusbar_push(GTK_STATUSBAR(statusbar),
		viewer->interface.status_context_id, text);

	return TRUE;
}

/*
 * create GL widget (called from libglade)
 */
GtkWidget *gui_glade_create_glwidget(void)
{
	GtkWidget *glarea;
	GdkGLConfig *glconfig;

	glconfig = gdk_gl_config_new_by_mode(
		GDK_GL_MODE_RGBA | GDK_GL_MODE_DEPTH | GDK_GL_MODE_DOUBLE);

	if(glconfig == NULL)
	{
		glconfig = gdk_gl_config_new_by_mode(
			GDK_GL_MODE_RGBA | GDK_GL_MODE_DEPTH |
			GDK_GL_MODE_ALPHA | GDK_GL_MODE_DOUBLE);
	}

	if(glconfig == NULL) return NULL;

	glarea = gtk_drawing_area_new();
	gtk_widget_set_gl_capability(glarea, glconfig, NULL, TRUE,
		GDK_GL_RGBA_TYPE);

	if(glarea == NULL) return NULL;

	gtk_widget_set_events(glarea,
		GDK_EXPOSURE_MASK |
		GDK_BUTTON_PRESS_MASK | GDK_BUTTON_RELEASE_MASK |
		GDK_SCROLL_MASK |
		GDK_POINTER_MOTION_MASK | GDK_POINTER_MOTION_HINT_MASK);

	g_signal_connect(G_OBJECT(glarea), "scroll_event",
		GTK_SIGNAL_FUNC(glarea_scroll), NULL);
	g_signal_connect(G_OBJECT(glarea), "expose_event",
		GTK_SIGNAL_FUNC(glarea_expose), NULL);
	g_signal_connect(G_OBJECT(glarea), "motion_notify_event",
		GTK_SIGNAL_FUNC(glarea_motion_notify), NULL);
	g_signal_connect(G_OBJECT(glarea), "button_press_event",
		GTK_SIGNAL_FUNC(glarea_button_pressed), NULL);
	g_signal_connect(G_OBJECT(glarea), "configure_event",
		GTK_SIGNAL_FUNC(glarea_configure), NULL);
	g_signal_connect(G_OBJECT(glarea), "destroy_event",
		GTK_SIGNAL_FUNC(glarea_destroy), NULL);

	return glarea;
}

/*
 * set background color callback (G3DSetBgColorFunc)
 */
gboolean gui_glade_set_bgcolor_cb(
	gfloat r, gfloat g, gfloat b, gfloat a,
	gpointer user_data)
{
	G3DViewer *viewer;

	viewer = (G3DViewer *)user_data;
	g_assert(viewer);

	return TRUE;
}

/*
 * update interface callback (G3DUpdateInterfaceFunc)
 */
gboolean gui_glade_update_interface_cb(gpointer user_data)
{
	while(gtk_events_pending())
		gtk_main_iteration();

	return TRUE;
}

/*
 * update progress bar callback (G3DUpdateProgressBarFunc)
 */
gboolean gui_glade_update_progress_bar_cb(gfloat percentage,
	gboolean show, gpointer user_data)
{
	G3DViewer *viewer;
	GtkWidget *pbar;
	gchar *text;

	viewer = (G3DViewer *)user_data;
	g_assert(viewer);

	pbar = glade_xml_get_widget(viewer->interface.xml, "main_progressbar");
	g_assert(pbar);

	gtk_progress_bar_set_fraction(GTK_PROGRESS_BAR(pbar), percentage);

	text = g_strdup_printf("%.1f%%", percentage * 100);
	gtk_progress_bar_set_text(GTK_PROGRESS_BAR(pbar), text);
	g_free(text);

	if(show)
		gtk_widget_show(pbar);
	else
		gtk_widget_hide(pbar);

	gui_glade_update_interface_cb(user_data);
	return TRUE;
}

