<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Skyrim</title>
            </head>
            <body>
            <h1><xsl:apply-templates select="descendant::cover/title"/></h1>
            <xsl:apply-templates select="descendant::body"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="QuestEvent">
        <span class="QuestEvent"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="QuestItem">
        <span class="QuestItem"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="character">
        <span class="{character/@ref}"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="epithet">
        <span class="{epithet/@ref}"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="faction">
        <span class="{faction/@id}"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="faction[@ref='MythicDawn']">
        <span class="{faction/@alignment}"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="faction[@ref='DarkBrotherhood']">
        <span class="{faction/@alignment}"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="faction[@ref='blades']">
        <span class="{faction/@alignment}"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="faction[@ref='daedra']">
        <span class="{faction/@alignment}"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="faction[@ref='empire']">
        <span class="{faction/@alignment}"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="location">
        <span class="location"><xsl:apply-templates/></span>
    </xsl:template>

</xsl:stylesheet>