<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat" />
    <xsl:template match="/">
    <html>
        <head>
            <meta charset="utf-8"/>
            <title>Países</title>
            <link href="countries.css" type="text/css" rel="stylesheet"/>
        </head>
        <body>
            <h1>País con mayor y menor densidad de población</h1>
            <table>
                <thead>
                <tr>
                    <th>País</th>
                    <th>Densidad de Población</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="countries/country">
                <xsl:sort select="@population div @area" data-type="number" order="descending"/>
                <tr>
                    <xsl:if test="position()=1">
                    <td><xsl:value-of select="@name"/></td>
                    <td><xsl:value-of select="@population div @area"/></td>
                    </xsl:if>
                    <xsl:if test="position()=last()">
                    <td><xsl:value-of select="@name"/></td>
                    <td><xsl:value-of select="@population div @area"/></td>
                    </xsl:if>
                </tr>
            </xsl:for-each>
            </tbody>
            </table>
        </body>
    </html>
</xsl:template>

<xsl:template match="text()"/>
</xsl:stylesheet>
