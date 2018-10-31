<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://www.tei-c.org/ns/1.0"  xmlns="http://www.w3.org/1999/xhtml"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
<xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

<xsl:template match="/">
    <html>
       <head><title>George Washington <xsl:apply-templates select="descendant::titleStmt/title"/></title>
       </head> 
        <body>
            <h1><xsl:apply-templates select="descendant::titleStmt/title"/></h1>
            <xsl:apply-templates select="descendant::body"/>
        </body>
    </html>
</xsl:template>

<xsl:template match="p">
    <p> <xsl:apply-templates/></p>
</xsl:template>

</xsl:stylesheet>