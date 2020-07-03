/* $Id: gui_callbacks.c 58 2006-11-05 19:21:04Z mmmaddd $ */

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
#include "gl.h"
#include "glarea.h"
#include "gui_glade.h"
#include "trackball.h"
#include "screenshot.h"

/*
 * File->Open
 */

void gui_on_open_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");

	gui_glade_open_dialog(viewer);
}

/*
 * File->Properties
 */

void gui_on_properties_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;
	GtkWidget *propwin;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);

	propwin = glade_xml_get_widget(viewer->interface.xml, "properties_window");

	gtk_widget_show_all(propwin);
}

/*
 * View->Show Menubar
 */

void gui_on_show_menubar_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;
	GtkWidget *menubar;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);

	menubar = glade_xml_get_widget(viewer->interface.xml, "menu_main");
	g_assert(menubar);

	if(gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(widget)))
		gtk_widget_show(menubar);
	else
		gtk_widget_hide(menubar);
}

/*
 * View->Show Toolbar
 */

void gui_on_show_toolbar_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;
	GtkWidget *toolbar;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);

	toolbar = glade_xml_get_widget(viewer->interface.xml, "toolbar_main");
	g_assert(toolbar);

	if(gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(widget)))
		gtk_widget_show(toolbar);
	else
		gtk_widget_hide(toolbar);
}

/*
 * View->Fullscreen
 */
void gui_on_fullscreen_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);

	if(gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(widget)))
		gtk_window_fullscreen(GTK_WINDOW(viewer->interface.window));
	else
		gtk_window_unfullscreen(GTK_WINDOW(viewer->interface.window));
}

/*
 * Window state event
 */
void gui_on_window_state_event(GtkWidget *widget, GdkEventVisibility *event,
	gpointer user_data)
{
	G3DViewer *viewer;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);
}

/*
 * View->ZoomFit
 */
void gui_on_zoomfit_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);

	/* zoom */
	viewer->zoom = 45;

	/* reset trackball */
#if 1
	trackball(viewer->quat, 0.0, 0.0, 0.0, 0.0);
#endif

	glarea_update(viewer->interface.glarea);
}

/*
 * View->Shininess
 */

void gui_on_shininess_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);

	if(gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(widget)))
		viewer->glflags |= G3D_FLAG_GL_SHININESS;
	else
		viewer->glflags &= ~G3D_FLAG_GL_SHININESS;
}

/*
 * View->Two-sided Faces
 */

void gui_on_twosided_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);

	gl_set_twoside(
		gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(widget)));
}

/*
 * View->Textures
 */

void gui_on_textures_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);

	if(gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(widget)))
		viewer->glflags |= G3D_FLAG_GL_TEXTURES;
	else
		viewer->glflags &= ~G3D_FLAG_GL_TEXTURES;
}

/*
 * View->Specular Lighting
 */

void gui_on_specular_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);

	if(gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(widget)))
		viewer->glflags |= G3D_FLAG_GL_SPECULAR;
	else
		viewer->glflags &= ~G3D_FLAG_GL_SPECULAR;
}

/*
 * View->Wireframe
 */

void gui_on_wireframe_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);

	if(gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(widget)))
	{
		glPolygonMode(GL_FRONT, GL_LINE);
		glPolygonMode(GL_BACK, GL_LINE);
	}
	else
	{
		glPolygonMode(GL_FRONT, GL_FILL);
		glPolygonMode(GL_BACK, GL_FILL);
	}
}

/*
 * View->Background Color
 */

void gui_on_bgcolor_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;
	GtkWidget *colorsel, *colordialog;
	GdkColor color;
	gint retval;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer != NULL);

	colorsel = glade_xml_get_widget(viewer->interface.xml, "cs_background");
	colordialog = glade_xml_get_widget(viewer->interface.xml, "color_dialog");

	/* set active background color */
	color.red   = viewer->bgcolor[0] * 0xFFFF;
	color.green = viewer->bgcolor[1] * 0xFFFF;
	color.blue  = viewer->bgcolor[2] * 0xFFFF;
	gtk_color_selection_set_previous_color(GTK_COLOR_SELECTION(colorsel),
		&color);
	gtk_color_selection_set_current_color(GTK_COLOR_SELECTION(colorsel),
		&color);

	retval = gtk_dialog_run(GTK_DIALOG(colordialog));
	gtk_widget_hide(colordialog);
	if(retval == GTK_RESPONSE_CANCEL)
	{
		gtk_color_selection_get_previous_color(GTK_COLOR_SELECTION(colorsel),
			&color);
		viewer->bgcolor[0] = (gdouble)color.red   / 65536.0;
		viewer->bgcolor[1] = (gdouble)color.green / 65536.0;
		viewer->bgcolor[2] = (gdouble)color.blue  / 65536.0;

		glarea_update(viewer->interface.glarea);
	}
}

/*
 * Help->Info
 */

void gui_on_help_info_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;
	GtkWidget *info_dialog;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer != NULL);

	info_dialog = glade_xml_get_widget(viewer->interface.xml, "info_dialog");

	gtk_widget_show_all(info_dialog);
}

/*
 * ColorDialog: color changed
 */
void gui_color_changed_cb(GtkColorSelection *colorsel,
	gpointer user_data)
{
	G3DViewer *viewer;
	GdkColor color;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(colorsel), "viewer");
	g_assert(viewer != NULL);

	gtk_color_selection_get_current_color(colorsel, &color);
	viewer->bgcolor[0] = (gdouble)color.red   / 65536.0;
	viewer->bgcolor[1] = (gdouble)color.green / 65536.0;
	viewer->bgcolor[2] = (gdouble)color.blue  / 65536.0;

#if DEBUG > 4
	g_printerr("D: gui_color_changed_cb: color %.2f, %.2f, %.2f\n",
		viewer->bgcolor[0],
		viewer->bgcolor[1],
		viewer->bgcolor[2]);
#endif

	glarea_update(viewer->interface.glarea);
}

/*
 * Screenshot
 */
void gui_on_screenshot_cb(GtkWidget *widget, gpointer user_data)
{
	G3DViewer *viewer;
	gchar *filename, *basename;
	guint32 width, height;

	viewer = (G3DViewer *)g_object_get_data(G_OBJECT(widget), "viewer");
	g_assert(viewer);

	/* don't screenshot empty window */
	if(viewer->filename == NULL)
		return;

	width = viewer->interface.glarea->allocation.width;
	height = viewer->interface.glarea->allocation.height;

	basename = g_path_get_basename(viewer->filename);
	filename = g_strdup_printf("g3dviewer-screenshot-%s.png", basename);
	g_free(basename);



	if(screenshot_save(filename, width, height))
		g_print("screenshot \"%s\" saved.\n", filename);
	else
		g_printerr("failed saving screenshot \"%s\".\n", filename);

	g_free(filename);
}
