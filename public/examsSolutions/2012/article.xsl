<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE no-root [
<!ENTITY prixttc "translate(prixHT,$coma,$dot) * translate(TVA ,$coma,$dot) div 100 + 1">
]>

<xsl:stylesheet  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0"
encoding="UTF-8" indent="yes"/>
<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
<xsl:variable name="dot" select="'.'" />
<xsl:variable name="coma" select="','" />
    <xsl:template match="/">
        <articles>
            <xsl:for-each select="catalogue/produit">
            <xsl:sort select="&prixttc;" order="ascending"></xsl:sort>
                <xsl:if test="translate(prixHT,$coma,$dot) &gt; 0">
                    <article>
                        <référence>
                            <xsl:value-of select="@codeP"/>
                        </référence>
                        <intitulé>
                            <xsl:value-of select="translate(nom, $lowercase, $uppercase)"/>   
                        </intitulé>
                        <prixTTC>
                            <xsl:value-of select="&prixttc;"/>
                        </prixTTC>
                    </article>
                </xsl:if>
            </xsl:for-each>
        </articles>
    </xsl:template>
</xsl:stylesheet>