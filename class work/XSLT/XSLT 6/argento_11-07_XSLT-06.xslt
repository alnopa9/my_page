<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    <!--2018-11-02 ebb: 
        * This XSLT is designed to run over a collection of XML files and output the contents of those files all together in a single composite HTML file. 
    (Can you write one XSLT over multiple XML files and output multiple HTML files? Yes, and if you want to do that in a project come talk to me and we'll work with xsl:result-document to do that.)
       * This XSLT will also be developed as a "modal" Stylesheet, using the @mode attribute, which allows the same element to be processed in multiple ways. We'll output the poems first, and then come back and apply an XSLT mode to output just the first line each poem in a table of contents for the file.  
    --> 
    
 <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
  
    <xsl:variable name="dickinsonColl" select="collection('Dickinson/?select=*.xml')"/>
 
    <xsl:template match="/">
      <html>
          <head><title>Emily Dickinson’s Fascicle 16</title></head>
          <body>
              <h1>Emily Dickinson’s Fascicle 16</h1>
          <div id="tocVar">
              <h2>Contents: Poems Sorted by Numbers of Variants</h2>
              <ul><xsl:apply-templates select="$dickinsonColl//body" mode="tocVar">
                  <xsl:sort select="count(descendant::rdg)" order="descending"/>
              </xsl:apply-templates><a href="#{idno}"/></ul>
              <hr/>
          </div>
          <div id="tocAlphabet">
              <h2>Contents: Poems Sorted Alphabetically by First Line</h2>
              <ul><xsl:apply-templates select="$dickinsonColl//body" mode="tocAlphabet">
                  <xsl:sort select='translate(lg[1]/l[1], "&apos;", "")'/>
              </xsl:apply-templates><a href="#{idno}"/></ul>
              <hr/>
          </div>
              <div id="main">
             <xsl:apply-templates select="$dickinsonColl//body">
                 <xsl:sort select="tokenize(base-uri(), '/')[last()]"/>
             </xsl:apply-templates>
          </div>
          </body>
      </html>
    </xsl:template>

    <xsl:template match="body" mode="tocVar">
        <li><a href="#p{//descendant::msIdentifier/idno}"><strong><xsl:apply-templates select="descendant::title"/></strong></a>
            <xsl:text>: </xsl:text><xsl:apply-templates select="lg[1]/l[1]"/>
            <xsl:text> [Variants: </xsl:text><xsl:value-of select="count(descendant::rdg)"/><xsl:text>]</xsl:text>
        </li>
    </xsl:template>

    <xsl:template match="body" mode="tocAlphabet">
        <li><a href="#p{//descendant::msIdentifier/idno}"><strong><xsl:apply-templates select="descendant::title"/></strong></a>
            <xsl:text>: </xsl:text><xsl:apply-templates select="lg[1]/l[1]"/>
            <xsl:text> [Variants: </xsl:text><xsl:value-of select="count(descendant::rdg)"/><xsl:text>]</xsl:text>
        </li>
    </xsl:template>

    <xsl:template match="body">
        <div id="p{//descendant::msIdentifier/idno}">
            <h2><xsl:apply-templates select="descendant::title"/></h2>
            <xsl:apply-templates select="descendant::lg"/>
        </div>
    </xsl:template>
    <xsl:template match="lg">
        <span class="p"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="l">
        <xsl:value-of select="count(preceding::l)+1"/><xsl:text>: </xsl:text><xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="rdg">
        <span class="{@wit}"><xsl:apply-templates/></span>
    </xsl:template>

</xsl:stylesheet>
