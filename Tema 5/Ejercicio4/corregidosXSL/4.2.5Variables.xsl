<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat" />
    <xsl:variable name="maxDensidad" select="max(/countries/country/(@population div @area))"/>
    <xsl:variable name="minDensidad" select="min(/countries/country/(@population div @area))"/>
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
                <tr>
                    <td><xsl:value-of select="/countries/country[(@population div @area) = $maxDensidad]/@name"/></td>
                    <td><xsl:value-of select="format-number($maxDensidad,'0.00')"/></td>
                </tr>
                <tr>
                    <td><xsl:value-of select="/countries/country[(@population div @area) = $minDensidad]/@name"/></td>
                    <td><xsl:value-of select="format-number($minDensidad,'0.00')"/></td>
                </tr>
            </tbody>
            </table>
        </body>
    </html>
</xsl:template>

<xsl:template match="text()"/>
</xsl:stylesheet>
