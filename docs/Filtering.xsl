<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
    <xsl:output method="xml"  omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
    <xsl:template match="Data">
        <Data>
            <xsl:apply-templates select="*"/>
        </Data>
    </xsl:template>
    
    <xsl:template match="line">
        <xsl:choose>
            <xsl:when test="contains(Message,'Feature:')">
                <Feature>
                    <xsl:copy-of select="."/>
                </Feature>
            </xsl:when>
            <xsl:when test="contains(Message,'Bug:')">
            <Bug>
                <xsl:copy-of select="."/>
            </Bug>
            </xsl:when>
            <xsl:when test="contains(Message,'Issue:')">
            <Issue>
                <xsl:copy-of select="."/>
            </Issue>
            </xsl:when>
            <xsl:otherwise>
            <devops>
                <xsl:copy-of select="."/>
            </devops>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
    <xsl:template match="*"/>
    
</xsl:transform>

