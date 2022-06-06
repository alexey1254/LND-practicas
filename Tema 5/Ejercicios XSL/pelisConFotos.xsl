<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat" />
    <xsl:template match="/">
        <html>
            <head>
                <title>Listado de Pelis con Fotos</title>
                <link href="videoclub.css" type="text/css" rel="stylesheet"/>
            </head>
            <body>
                <h1>Listado de Pelis con Fotos</h1>
                <table>
                    <thead>
                    <tr>
                        <th>Título</th>
                        <th>Director</th>
                        <th>Carátula</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="videoclub/pelicula">
                    <tr>
                        <td><xsl:value-of select="titulo"/></td>
                        <td><xsl:value-of select="director"/></td>
                        <td>
                            <a href="{url}"><img src="fotos/{foto}"/></a>
                            </td>
                    </tr>
                </xsl:for-each>
                </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>