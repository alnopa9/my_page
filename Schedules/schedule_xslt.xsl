<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Hockey Team Schedule</title>
            </head>
            <body>
                <ol>
                    <xsl:apply-templates select="month"/>
                    <table border="1">
                        <tr>
                            <th>Day</th>
                            <th>Date</th>
                            <th>Against</th>
                            <th>Destination</th>
                            <th>Time</th>
                        </tr>
                        <xsl:apply-templates select="descendant::organization"/>
                    </table>
                </ol>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>