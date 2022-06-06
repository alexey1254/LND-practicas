<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet type="text/xsl" href=""?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="xml" doctype-system="about:legacy-compat" />
    <xsl:template match="/">
    <countries>
    <xsl:apply-templates select="countries/country" />
   </countries>
    </xsl:template>
    <xsl:template match="country">
        <country>
            <name><xsl:value-of select="@name"/></name>
            <population><xsl:value-of select="@population"/></population>
            <area><xsl:value-of select="@area"/></area>
            <xsl:apply-templates select="language" />
            <xsl:apply-templates select="city" />
        </country>
    </xsl:template>
        <xsl:template match="language">
        <language>
            <name><xsl:value-of select="."/></name>
            <percentage><xsl:value-of select="@percentage"/></percentage>
        </language>   
        </xsl:template>
        <xsl:template match="city">
        <city>
          <name><xsl:value-of select="name"/></name>
          <population><xsl:value-of select="population"/></population>
        </city>
        </xsl:template>
    
<xsl:template match="text()"/>
</xsl:stylesheet>
