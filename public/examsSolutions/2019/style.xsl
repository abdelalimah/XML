<?xml version="1.0" ?>
<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:template match="/">
    <html>
        <body>
            <table border="1" cellspacing="0" align="center">
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Taille</th>
                </tr>
                <xsl:for-each select="/racine//dossier">
                <xsl:sort name="$tl" data-type="text" order="ascending"></xsl:sort>
                <xsl:if test="@creation=2018">
                    <tr>
                        <td><xsl:value-of select="@id"></xsl:value-of></td>
                        <td><xsl:value-of select="@nom"></xsl:value-of></td>
                        <xsl:variable name="tl" select="sum(.//fichier/@taille)"/>
                        <td><xsl:value-of select="$tl"></xsl:value-of></td>
                    </tr>
                </xsl:if>
                    
                </xsl:for-each>
            </table>
        </body>
    </html>
    </xsl:template>
    </xsl:stylesheet>