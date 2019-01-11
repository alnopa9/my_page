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
                <title>Hockey Team Schedule</title>
            </head>
            <body>
                <h1><xsl:apply-templates select="descendant::organization/@team"/></h1>
                <div class="table-container">
                    <h2>October</h2>
                        <table border="1">
                            <tr>
                                <th>Day</th>
                                <th>Date</th>
                                <th>Place</th>
                                <th>Time</th>
                                <th>Against</th>
                            </tr>
                            <xsl:apply-templates select="descendant::months[@class='october']"/>
                        </table>
                    <h2>November</h2>
                    <table border="1">
                        <tr>
                            <th>Day</th>
                            <th>Date</th>
                            <th>Place</th>
                            <th>Time</th>
                            <th>Against</th>
                        </tr>
                        <xsl:apply-templates select="descendant::months[@class='november']"/>
                    </table>
                    <h2>Decemeber</h2>
                    <table border="1">
                        <tr>
                            <th>Day</th>
                            <th>Date</th>
                            <th>Place</th>
                            <th>Time</th>
                            <th>Against</th>
                        </tr>
                        <xsl:apply-templates select="descendant::months[@class='december']"/>
                    </table>
                    <h2>January</h2>
                    <table border="1">
                        <tr>
                            <th>Day</th>
                            <th>Date</th>
                            <th>Place</th>
                            <th>Time</th>
                            <th>Against</th>
                        </tr>
                        <xsl:apply-templates select="descendant::months[@class='january']"/>
                    </table>
                    <h2>February</h2>
                    <table border="1">
                        <tr>
                            <th>Day</th>
                            <th>Date</th>
                            <th>Place</th>
                            <th>Time</th>
                            <th>Against</th>
                        </tr>
                        <xsl:apply-templates select="descendant::months[@class='february']"/>
                    </table>
                    <h2>March</h2>
                    <table border="1">
                        <tr>
                            <th>Day</th>
                            <th>Date</th>
                            <th>Place</th>
                            <th>Time</th>
                            <th>Against</th>
                        </tr>
                        <xsl:apply-templates select="descendant::months[@class='march']"/>
                    </table>
                    <h2>April</h2>
                    <table border="1">
                        <tr>
                            <th>Day</th>
                            <th>Date</th>
                            <th>Place</th>
                            <th>Time</th>
                            <th>Against</th>
                        </tr>
                        <xsl:apply-templates select="descendant::months[@class='april']"/>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="months[@class]/game">
        <tr>
            <td><xsl:apply-templates select="day"/></td>
            <td><xsl:apply-templates select="@isoDate/format-date(xs:date(.), '[D]/[M]/[Y]')"/></td>
            <td><xsl:apply-templates select="destination"/></td>
            <td><xsl:apply-templates select="time"/></td>
            <td><xsl:apply-templates select="against"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>