<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat" />
    <xsl:variable name="poblacionTierra" select="sum(//country/@population)"/>
    <xsl:variable name="max10">
        <xsl:for-each select="/countries/country">
        <xsl:sort select="@population" data-type="number" order="descending"/>
            <xsl:if test="position() = 10">
                <xsl:value-of select="@population"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    <xsl:template match="/">
    <html>
        <head>
            <meta charset="utf-8"/>
            <title>Paises más y menos poblados</title>
            <link href="countries.css" type="text/css" rel="stylesheet"/>
        </head>
        <body>
            <h1>10 paises mas poblados</h1>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Población</th>
                    <th>% Respecto Tierra</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="countries/country">
                <xsl:sort select="@population" data-type="number" order="descending"/>
                <xsl:if test="position() &lt;= 10">
                <tr>
                    <td><xsl:value-of select="position()"/></td>
                    <td><xsl:value-of select="@name"/></td>
                    <td><xsl:value-of select="@population"/></td>
                    <td><xsl:value-of select="@population*100 div $poblacionTierra"/></td>
                </tr>
                </xsl:if>
            </xsl:for-each>
            <tr>
                <td></td>
                <td>Suma:</td>
                <td></td>
            </tr>
            </tbody>
            </table>
            <h1>10 paises menos poblados</h1>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Población</th>
                    <th>% Respecto Tierra</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="countries/country">
                <xsl:sort select="@population" data-type="number" order="ascending"/>
                <xsl:if test="position() &lt;= 10">
                <tr>
                    <td><xsl:value-of select="position()"/></td>
                    <td><xsl:value-of select="@name"/></td>
                    <td><xsl:value-of select="@population"/></td>
                    <td><xsl:value-of select="@population*100 div $poblacionTierra"/></td>
                </tr>
                </xsl:if>
            </xsl:for-each>
            </tbody>
            </table>
        </body>
    </html>
</xsl:template>
<xsl:template match="text()"/>
</xsl:stylesheet>
