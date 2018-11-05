<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head><title>Hockey Team Roster</title></head>
            <body>
                <h1><xsl:apply-templates select="upper-case(descendant::organization/@team)"/></h1>
                <div class="table-container">
                    <h2>Forwards</h2>
                        <table border="1">
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
                    <h2>Defense</h2>
                    <table border="1">
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
                    <h2>Goalies</h2>
                    <table border="1">
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
            </body>
        </html>
    </xsl:template>

    <xsl:template match="forwards/p">
        <tr>
            <td><img src="players-photos/{lower-case(tokenize(name, ' ')[last()])}.jpg" width="100" height="100"/></td>
            <td><xsl:apply-templates select="name"/></td>
            <td><xsl:apply-templates select="num"/></td>
            <td><xsl:apply-templates select="pos"/></td>
            <td><xsl:apply-templates select="shot"/></td>
            <td><xsl:apply-templates select="h"/></td>
            <td><xsl:apply-templates select="w"/></td>
            <td><xsl:apply-templates select="bd"/></td>
            <td><xsl:apply-templates select="bp"/></td>
        </tr>
    </xsl:template>

    <xsl:template match="defense/p">
        <tr>
            <td><img src="players-photos/{lower-case(tokenize(name, ' ')[last()])}.jpg" width="100" height="100"/></td>
            <td><xsl:apply-templates select="name"/></td>
            <td><xsl:apply-templates select="num"/></td>
            <td><xsl:apply-templates select="shot"/></td>
            <td><xsl:apply-templates select="h"/></td>
            <td><xsl:apply-templates select="w"/></td>
            <td><xsl:apply-templates select="bd"/></td>
            <td><xsl:apply-templates select="bp"/></td>
        </tr>
    </xsl:template>

    <xsl:template match="goalies/p">
        <tr>
            <td><img src="players-photos/{lower-case(tokenize(name, ' ')[last()])}.jpg" width="100" height="100"/></td>
            <td><xsl:apply-templates select="name"/></td>
            <td><xsl:apply-templates select="num"/></td>
            <td><xsl:apply-templates select="h"/></td>
            <td><xsl:apply-templates select="w"/></td>
            <td><xsl:apply-templates select="bd"/></td>
            <td><xsl:apply-templates select="bp"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>