<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="../../roster.css"/>
                <link rel="icon" href="logo.svg" sizes="any" type="image/svg+xml"/>
                <title><xsl:apply-templates select="descendant::organization/@team"/> |
                    Roster</title>
            </head>
            <body>
                <xsl:comment> SSI line below </xsl:comment>
                <xsl:comment>#include virtual="../../roster_ssi.html" </xsl:comment>
                <xsl:comment> SSI line below </xsl:comment>
                <xsl:comment>#include virtual="top_ssi.html" </xsl:comment>
                <div class="body-container">
                    <div class="position-bar">
                        <p>
                            <a href="#1forwards">Forwards</a> | <a href="#1defense">Defense</a> | <a
                                href="#1goalies">Goalies</a>
                        </p>
                    </div>
                    <div class="team-name">
                        <h1>
                            <xsl:apply-templates select="upper-case(descendant::organization/@team)"
                            />
                        </h1>
                    </div>
                    <div class="table-container">
                        <div class="forwards">
                            <div id="1forwards">
                                <div class="forwards-header">
                                    <h2>Forwards</h2>
                                </div>
                                <div class="forwards-table">
                                    <table>
                                        <tr>
                                            <th>Photo</th>
                                            <th>Name</th>
                                            <th>Number</th>
                                            <th>Position</th>
                                            <th>Shot</th>
                                            <th>Height</th>
                                            <th>Weight</th>
                                            <th>Birthday</th>
                                            <th>Hometown</th>
                                        </tr>
                                        <xsl:apply-templates select="descendant::forwards"/>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="defense">
                            <div id="1defense">
                                <div class="defense-header">
                                    <h2>Defense</h2>
                                </div>
                                <div class="defense-table">
                                    <table>
                                        <tr>
                                            <th>Photo</th>
                                            <th>Name</th>
                                            <th>Number</th>
                                            <th>Shot</th>
                                            <th>Height</th>
                                            <th>Weight</th>
                                            <th>Birthday</th>
                                            <th>Hometown</th>
                                        </tr>
                                        <xsl:apply-templates select="descendant::defense"/>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="goalies">
                            <div id="1goalies">
                                <div class="goalies-header">
                                    <h2>Goalies</h2>
                                </div>
                                <div class="goalies-table">
                                    <table>
                                        <tr>
                                            <th>Photo</th>
                                            <th>Name</th>
                                            <th>Number</th>
                                            <th>Height</th>
                                            <th>Weight</th>
                                            <th>Birthday</th>
                                            <th>Hometown</th>
                                        </tr>
                                        <xsl:apply-templates select="descendant::goalies"/>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="forwards/p">
        <tr>
            <td>
                <img
                    src="Players_Photos/{descendant::organization/@team}/{lower-case(tokenize(name, ' ')[last()])}.jpg"
                    width="100" height="100"/>
            </td>
            <td>
                <xsl:apply-templates select="name"/>
                <xsl:if test="@type = 'captain'">
                    <strong>
                        <xsl:text> C</xsl:text>
                    </strong>
                </xsl:if>
                <xsl:if test="@type = 'assistant'">
                    <strong>
                        <xsl:text> A</xsl:text>
                    </strong>
                </xsl:if>
            </td>
            <td>
                <xsl:apply-templates select="num"/>
            </td>
            <td>
                <xsl:apply-templates select="pos"/>
            </td>
            <td>
                <xsl:apply-templates select="shot"/>
            </td>
            <td>
                <xsl:apply-templates select="h"/>
            </td>
            <td>
                <xsl:apply-templates select="w"/>
            </td>
            <td>
                <xsl:apply-templates select="bd"/>
            </td>
            <td>
                <xsl:apply-templates select="bp"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="defense/p">
        <tr>
            <td>
                <img src="Players_Photos/{lower-case(tokenize(name, ' ')[last()])}.jpg" width="100"
                    height="100"/>
            </td>
            <td>
                <xsl:apply-templates select="name"/>
            </td>
            <td>
                <xsl:apply-templates select="num"/>
            </td>
            <td>
                <xsl:apply-templates select="shot"/>
            </td>
            <td>
                <xsl:apply-templates select="h"/>
            </td>
            <td>
                <xsl:apply-templates select="w"/>
            </td>
            <td>
                <xsl:apply-templates select="bd"/>
            </td>
            <td>
                <xsl:apply-templates select="bp"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="goalies/p">
        <tr>
            <td>
                <img src="Players_Photos/{lower-case(tokenize(name, ' ')[last()])}.jpg" width="100"
                    height="100"/>
            </td>
            <td>
                <xsl:apply-templates select="name"/>
            </td>
            <td>
                <xsl:apply-templates select="num"/>
            </td>
            <td>
                <xsl:apply-templates select="h"/>
            </td>
            <td>
                <xsl:apply-templates select="w"/>
            </td>
            <td>
                <xsl:apply-templates select="bd"/>
            </td>
            <td>
                <xsl:apply-templates select="bp"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
