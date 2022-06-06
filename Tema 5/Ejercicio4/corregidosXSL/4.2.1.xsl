<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat" />
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8" />
                <title>Países de habla Española</title>
                <link href="countries.css" type="text/css" rel="stylesheet" />
            </head>
            <body>
                <h1>Países de habla Española</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Num.Lenguas</th>
                            <th>Num.Hab</th>
                            <th>Densidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="countries/country[language='Spanish']">
                            <xsl:sort select="@population" data-type="number" order="descending" />
                            <tr>
                                <td>
                                    <xsl:value-of select="@name" />
                                </td>
                                <td>
                                    <xsl:value-of select="count(language)" />
                                </td>
                                <td>
                                    <xsl:value-of select="@population * language[.='Spanish']/@percentage div 100" />
                                </td>
                                <td>
                                    <xsl:value-of select="@population div @area" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>