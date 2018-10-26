<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">

    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="emph">
        <hi rend="italics">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>

    <xsl:template match="head/l">
        <xsl:apply-templates/><lb/>
    </xsl:template>
    
    <xsl:template match="div/div">
        <div type="book" n="{count(preceding::div[@type='book'])+1}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="div/div/div">
        <div type="chapter" n="{count(preceding::div[@type='chapter'])+1}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

</xsl:stylesheet>
