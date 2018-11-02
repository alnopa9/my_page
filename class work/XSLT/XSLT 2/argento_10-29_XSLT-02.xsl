<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Digital Mitford Project</title>
            </head>
            <body>
                <ol>
                    <xsl:apply-templates select="//div/listOrg"/>
                    <xsl:apply-templates select="//div/listBibl"/>
                    <xsl:apply-templates select="//div/listPerson"/>
                </ol>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="div/listOrg">
        <li>
            <xsl:apply-templates select="head"/>
            <ul>
                <xsl:apply-templates select="org"/>
            </ul>
        </li>
    </xsl:template>
    <xsl:template match="org">
        <li>
            <xsl:apply-templates select="orgName[1]"/>
        </li>
    </xsl:template>
    
    <xsl:template match="div/listBibl">
        <li>
            <xsl:apply-templates select="head"/>
            <ul>
                <xsl:apply-templates select="bibl"/>
            </ul>
        </li>
    </xsl:template>
    <xsl:template match="bibl">
        <li>
            <xsl:apply-templates select="title[1]"/>
        </li>
    </xsl:template>
    
    <xsl:template match="div/listPerson">
        <li>
            <xsl:apply-templates select="head"/>
            <ul>
                <xsl:apply-templates select="person"/>
            </ul>
        </li>
    </xsl:template>
    <xsl:template match="person">
        <li>
            <xsl:apply-templates select="persName"/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>