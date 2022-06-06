<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat"/>
<xsl:template match="/">
    <html>
        <head>
            <title>Listado de canciones de Columbia Records</title>
        </head>
        <body>
            <h1>Listado de canciones de Columbia Records</h1>
            <table>
                <thead>
                    <tr>
                        <th>Duracion</th>
                        <th>Titulo</th>
                        <th>Album</th>
                        <th>Artista</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-template select="cds/cs[hours-from-time(@duracion)*3600+minutes-from-time(@duracion)*60+seconds-from-time(@duracion) &lt; 240]/@nombre"/> 
                </tbody>
            </table>
        </body>
    </html>
</xsl:template>
    <xsl:template match="cancion">
        <tr>
            <td>
                <xsl:value-of select="@duracion" />
            </td>
            <td>
                <xsl:value-of select="@nombre" />
            </td>
            <td>
                <xsl:value-of select="../titulo" />
            </td>
            <td>
                <xsl:value-of select="../artista" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>