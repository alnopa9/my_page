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
          <div id="toc">
              <h2>Table of Contents</h2>
              <ul><xsl:apply-templates select="$dickinsonColl//body" mode="toc"/></ul>
              <hr/>
          </div>
              <div id="main">
             <xsl:apply-templates select="$dickinsonColl//body"/>
          </div>
          </body>
      </html>
    </xsl:template>

    <xsl:template match="body" mode="toc">
        <li><xsl:apply-templates select="descendant::title"/></li>
    </xsl:template>

    <xsl:template match="body">
        <h2><xsl:apply-templates select="descendant::title"/></h2>
        <xsl:apply-templates select="descendant::lg"/>
    </xsl:template>
    <xsl:template match="lg">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="l">
        <xsl:value-of select="count(preceding::l)+1"/>: <xsl:text/><xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="rdg">
        <span class="{@wit}"><xsl:apply-templates/></span><br/>
    </xsl:template>

</xsl:stylesheet>
