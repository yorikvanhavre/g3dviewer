#!/bin/sh

# $Id: gen_schema.sh 59 2006-11-06 09:49:56Z mmmaddd $

#	G3DViewer - 3D object viewer
#
#	Copyright (C) 2005, 2006  Markus Dahms <mad@automagically.de>
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

schemafile=g3d-thumbnailer.schema

> $schemafile

add_schema () {
cat >> $schemafile <<EOD
<schema>
	<key>/schemas/desktop/gnome/thumbnailers/$1/enable</key>
	<applyto>/desktop/gnome/thumbnailers/$1/enable</applyto>
	<owner>g3dviewer</owner>
	<type>bool</type>
	<default>true</default>
	<locale name="C">
		<short>Enable thumbnailing of $2 models</short>
		<long>Boolean options available, true enables thumbnailing and false disables the creation of new thumbnails</long>
	</locale>
</schema>

<schema>
	<key>/schemas/desktop/gnome/thumbnailers/$1/command</key>
	<applyto>/desktop/gnome/thumbnailers/$1/command</applyto>
	<owner>g3dviewer</owner>
	<type>string</type>
	<default>g3d-thumbnailer %i %o %s</default>
	<locale name="C">
		<short>Thumbnail command for $2 models</short>
		<long>Valid command plus arguments for the $2 document thumbnailer.  See nautilus thumbnailer documentation for more information.</long>
	</locale>
</schema>

EOD
}

cat >> $schemafile <<EOD
<gconfschemafile>
	<schemalist>
EOD

add_schema "image@x-3dmf" "3DMF"
add_schema "image@x-3ds" "3DS"
add_schema "image@x-ac3d" "AC3D"
add_schema "image@x-cob" "COB"
add_schema "image@x-dxf" "DXF"
add_schema "image@x-iob" "IOB"
add_schema "image@x-vdrift" "VDrift"
add_schema "image@x-lcd" "LCD"
add_schema "image@x-lwo" "LWO"
#add_schema "image@x-lws" "LWS"
add_schema "image@x-md2" "MD2"
add_schema "image@x-md3" "MD3"
add_schema "image@x-nff" "NFF"
add_schema "image@x-obj" "OBJ"
add_schema "image@x-q3d" "Q3D"
add_schema "image@x-vrml" "VRML"

cat >> $schemafile <<EOD
	</schemalist>
</gconfschemafile>
EOD
