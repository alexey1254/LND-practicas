<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="yes" method="html" doctype-system="about:legacy-compat" />
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8" />
                <title>Titulo de la pagina</title>
                <link href="" type="text/css" rel="stylesheet" />
            </head>
            <body>
                <h1>De que trata la pagina</h1>
                <table>
                    <thead>

                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="text()"/>
</xsl:stylesheet>