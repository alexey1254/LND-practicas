<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat" />
    <xsl:template match="/">
    <html>
        <head>
            <meta charset="utf-8"/>
            <title>Países de habla hispana, con sus ciudades y población de estas</title>
            <link href="countries.css" type="text/css" rel="stylesheet"/>
        </head>
        <body>
            <h1>Países de habla hispana, con sus ciudades y población de estas</h1>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Ciudades</th>
                    <th>Población</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="countries/country[language='Spanish']">
                <xsl:sort select="@population" data-type="number" order="descending"/> 
                <tr>
                    <td><xsl:value-of select="position()"/></td>
                    <td><xsl:value-of select="@name"/></td>
                    <xsl:for-each select="city">
                        <xsl:choose>
                            <xsl:when test="position() = 1">
                                <td><xsl:value-of select="name"/></td>
                                <td><xsl:value-of select="population"/></td>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <td> </td>
                                    <td> </td>
                                    <td><xsl:value-of select="name"/></td>
                                    <td><xsl:value-of select="population"/></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </tr>
                </xsl:for-each>
                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="2">Total Población Ciudades:</td>
                    <td><xsl:value-of select="sum(/countries/country[language='Spanish']/city/population)"/></td>
                </tr>
            </tbody>
            </table>
        </body>
    </html>
</xsl:template>
<xsl:template match="text()"/>
</xsl:stylesheet>
