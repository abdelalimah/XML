<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
        <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

        <population année="2013">
                    <xsl:for-each select="/Continents/Continent">
                        <xsl:variable name="continentName" select="nom" />
                        <xsl:for-each select="./pays[population/@année=2013]">
                            <pays Code="{@Code}">
                                <xsl:attribute name="continent">
                                    <xsl:value-of select="translate(substring($continentName,1,2),$lowercase,$uppercase)"></xsl:value-of>
                                </xsl:attribute>
                                <nom>
                                    <xsl:value-of select="nom"></xsl:value-of>
                                </nom>
                                <population>
                                    <xsl:if test="population/@unité='K'">
                                        <xsl:value-of select="population * 1000" />
                                    </xsl:if>
                                    
                                    <xsl:if test="population/@unité='M'">
                                        <xsl:value-of select="translate(population,',','.') * 1000000" />
                                    </xsl:if>
                                </population>
                            </pays>
                        </xsl:for-each>
                    </xsl:for-each>

        </population>

    </xsl:template>
</xsl:stylesheet>