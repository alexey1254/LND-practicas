<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat" />
    <xsl:template match="/">
        <xsl:text>Título;Nacionalidad;Productor;Director;Duración;Género;Sinopsis;Foto;URL&#13;&#10;</xsl:text>
    <xsl:for-each select="videoclub/pelicula">
        <xsl:value-of select="titulo"/><xsl:text>;</xsl:text>
        <xsl:value-of select="nacionalidad"/><xsl:text>;</xsl:text>
        <xsl:value-of select="productor"/><xsl:text>;</xsl:text>
        <xsl:value-of select="director"/><xsl:text>;</xsl:text>
        <xsl:value-of select="año"/><xsl:text>;</xsl:text>
        <xsl:value-of select="concat(duracion,' min.'"/>
        <xsl:for-each select="genero">
            <xsl:value-of select="."/><xsl:text>,</xsl:text>
        </xsl:for-each>
        <xsl:value-of select="sinopsis"/><xsl:text>;</xsl:text>
        <xsl:value-of select="foto"/><xsl:text>;</xsl:text>
        <xsl:value-of select="url"/>&#13;&#10;
    </xsl:for-each>
    </xsl:template>
    <xsl:template match="text()"/>
</xsl:stylesheet>