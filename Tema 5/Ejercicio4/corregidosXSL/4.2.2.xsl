<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat" />
    <xsl:template match="/">
    <html>
        <head>
            <meta charset="utf-8"/>
            <title>Países de habla alemana y alguna más</title>
            <link href="countries.css" type="text/css" rel="stylesheet"/>
        </head>
        <body>
            <h1>Países de habla alemana y alguna más</h1>
            <table>
                <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Num.Lenguas</th>
                    <th>Num.Hab</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="countries/country[language='German'][count(language) &gt; 1]">
                <tr>
                    <td><xsl:value-of select="@name"/></td>
                    <td><xsl:value-of select="count(language)"/></td>
                    <td><xsl:value-of select="@population"/></td>
                </tr>
            </xsl:for-each>
            </tbody>
            </table>
        </body>
    </html>
</xsl:template>
<xsl:template match="text()"/>
</xsl:stylesheet>
