<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat" />
    <xsl:template match="/">
        <html>
            <head>
                <title>Canciones de Pink</title>
            </head>
            <body>
                <h1>Canciones Pink Floyd</h1>
                <table border="0">
                    <tr bgcolor="lightgray">
                        <th>Duración</th>
                        <th>Título</th>
                        <th>Album</th>
                    </tr>
                    <xsl:for-each select="cds/cd[artista='Pink Floyd']">
                        <tr>
                            <td>
                                <xsl:apply-template match="cancion" />
                            </td>
                            <td>
                                <xsl:value-of select="titulo" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="cancion">
        <td>
            <xsl:value-of select="@duracion" />
            <xsl:text></xsl:text>
            <xsl:value-of select="@nombre" />
        </td>
    </xsl:template>
</xsl:stylesheet>