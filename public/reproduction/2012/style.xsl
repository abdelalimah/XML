<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
        <body>
            <articles>
                <xsl:for-each select="/catalogue/produit">
                <xsl:sort select="prixTTC" order="descending"></xsl:sort>
                    <article cat="{@catégorie}">
                        <reference>
                            <xsl:value-of select="@codeP"></xsl:value-of>
                        </reference>
                        <intitule>
                            <xsl:value-of select="intitule">
                            </xsl:value-of>
                        </intitule>
                        <prixTTC>
                            <xsl:value-of select="prixTTC">
                            </xsl:value-of>
                        </prixTTC>
                    </article>
                </xsl:for-each>
            </articles>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>