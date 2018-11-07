<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">

    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:variable name="dickinsonColl" select="collection('Dickinson/?select=*.xml')"/>

    <xsl:template match="/">
    <html>
        <head>
            <link rel="stylesheet" href="argento_11-07_XSLT-06.css" />
            <title>Emily Dickinson’s Fascicle 16</title>
        </head>
        <body>
            <div class="menu-bar">
                <p>
                    <a href="#p1601">Poem 1</a> | <a href="#p1602">Poem 2</a> | <a href="#p1603">Poem 3</a> | <a href="#p1604">Poem 4</a> | <a href="#p1605">Poem 5</a> | <a href="#p1606">Poem 6</a> | 
                    <a href="#p1607">Poem 7</a> | <a href="#p1608">Poem 8</a> | <a href="#p1609">Poem 9</a> | <a href="#p1610">Poem 10</a> | <a href="#p1611">Poem 11</a>
                </p>
            </div>
            <div class="body-container">
                <div class="header">
                    <h1>Emily Dickinson’s Fascicle 16</h1>
                </div>
                <div class="tocVar">
                    <div class="tocVar-header">
                        <h2>Contents: Poems Sorted by Numbers of Variants</h2>
                    </div>
                    <ul><xsl:apply-templates select="$dickinsonColl//body" mode="tocVar">
                        <xsl:sort select="count(descendant::rdg)" order="descending"/>
                    </xsl:apply-templates><a href="#{idno}"/></ul>
                    <hr/>
                </div>
                <div class="tocAlphabet">
                    <div class="tocAlphabet-header">
                        <h2>Contents: Poems Sorted Alphabetically by First Line</h2>
                    </div>
                    <ul>
                        <xsl:apply-templates select="$dickinsonColl//body" mode="tocAlphabet">
                            <xsl:sort select='translate(lg[1]/l[1], "&apos;", "")'/>
                        </xsl:apply-templates><a href="#{idno}"/>
                    </ul>
                    <hr/>
                </div>
                <div class="main">
                    <xsl:apply-templates select="$dickinsonColl//body">
                        <xsl:sort select="tokenize(base-uri(), '/')[last()]"/>
                    </xsl:apply-templates>
                </div>
            </div>
        </body>
    </html>
    </xsl:template>

    <xsl:template match="body" mode="tocVar">
        <li><a href="#p{//descendant::msIdentifier/idno}"><strong><xsl:apply-templates select="replace(descendant::title, '\.', '')"/></strong></a>
            <xsl:text>: </xsl:text><xsl:apply-templates select="lg[1]/l[1]"/>
            <xsl:text> [Variants: </xsl:text><xsl:value-of select="count(descendant::rdg)"/><xsl:text>]</xsl:text>
        </li>
    </xsl:template>

    <xsl:template match="body" mode="tocAlphabet">
        <li><a href="#p{//descendant::msIdentifier/idno}"><strong><xsl:apply-templates select="replace(descendant::title, '\.', '')"/></strong></a>
            <xsl:text>: </xsl:text><xsl:apply-templates select="lg[1]/l[1]"/>
            <xsl:text> [Variants: </xsl:text><xsl:value-of select="count(descendant::rdg)"/><xsl:text>]</xsl:text>
        </li>
    </xsl:template>

    <xsl:template match="body">
        <div class="p{//descendant::msIdentifier/idno}">
            <div id="p{//descendant::msIdentifier/idno}">
                <div class="poem-header">
                    <h2><xsl:apply-templates select="replace(descendant::title, '\.', '')"/></h2>
                </div>
                <xsl:apply-templates select="descendant::lg"/>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="lg">
        <span class="p"><xsl:apply-templates/></span><br/>
    </xsl:template>
    <xsl:template match="l">
        <xsl:value-of select="count(preceding::l)+1"/><xsl:text>: </xsl:text><xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="rdg">
        <span class="{@wit}"><xsl:apply-templates/></span>
    </xsl:template>

</xsl:stylesheet>
