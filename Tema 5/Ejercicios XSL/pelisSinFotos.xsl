<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat" />
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>Listado de Pelis con Fotos</title>
                <link href="videoclub.css" type="text/css" rel="stylesheet"/>
            </head>
            <body>
                <h1>Listado de Pelis con Fotos</h1>
                <table>
                    <thead>
                    <tr>
                        <th>Título</th>
                        <th>Nacionalidad</th>
                        <th>Prod.</th>
                        <th>Dir.</th>
                        <th>Año</th>
                        <th>Duración</th>
                        <th>Género</th>
                        <th>Sinopsis</th>
                        <th>URL</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="videoclub/pelicula">
                    <tr>
                        <td><xsl:value-of select="titulo"/></td>
                        <td><xsl:value-of select="nacionalidad"/></td>
                        <td><xsl:value-of select="productor"/></td>
                        <td><xsl:value-of select="director"/></td>
                        <td><xsl:value-of select="año"/></td>
                        <td><xsl:value-of select="concat(duracion,' min.'"/></td>
                        <td>
                            <xsl:for-each select="genero">
                            <xsl:value-of select="."/><br/>
                            </xsl:for-each>
                        </td>
                        <td><xsl:value-of select="sinopsis"/></td>
                        <td>
                            <a href="{url}"><xsl:value-of select="concat(titulo,'IMBD'"/></a>
                            </td>
                    </tr>
                </xsl:for-each>
                </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>