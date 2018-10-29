<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Mitford People</title>
            </head>
            <body>
                <table border="1">
                    <tr>
                        <th>Group</th>
                        <th>Count</th>
                    </tr>
                    <xsl:apply-templates select="descendant::listPerson"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="listPerson">
        <tr>
            <td>
                <xsl:apply-templates select="@sortKey"/>
            </td>
            <td>
                <xsl:value-of select="count(descendant::person)"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>