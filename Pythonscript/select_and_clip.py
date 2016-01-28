# -*- coding: utf-8 -*-

import arcpy

# Define buildWhereClause. Copy-pasted function to overcome quotation problems.
def buildWhereClause(table, field, value):
    """Constructs a SQL WHERE clause to select rows having the specified value
    within a given field and table."""

    # Add DBMS-specific field delimiters
    fieldDelimited = arcpy.AddFieldDelimiters(table, field)

    # Determine field type
    fieldType = arcpy.ListFields(table, field)[0].type

    # Add single-quotes for string field values
    if str(fieldType) == 'String':
        value = "'%s'" % value

    # Format WHERE clause
    whereClause = "%s = %s" % (fieldDelimited, value)
    return whereClause

# Define Select and Clip function
def select_and_clip(OSMinshpNLmun, OSMinshpNLroads, SelectMun, OSMinshpNLmunroads, Municipality):
    if arcpy.Exists(SelectMun):
        arcpy.Delete_management(SelectMun)
    if arcpy.Exists(OSMinshpNLmunroads):
        arcpy.Delete_management(OSMinshpNLmunroads)
    # Process: Select
    fieldname = "NAME_2"
    fieldvalue = Municipality
    whereclause = buildWhereClause(OSMinshpNLmun, fieldname, fieldvalue)
    arcpy.Select_analysis(OSMinshpNLmun, SelectMun, whereclause)
    # arcpy.Select_analysis(OSMinshpNLmun, SelectMun, "\"NAME_2\" = " + "'%'"%Municipality)
    # Proces: Clip
    xy_tolerance = ""
    arcpy.Clip_analysis(OSMinshpNLroads, SelectMun, OSMinshpNLmunroads, xy_tolerance)