<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/badges">
        <html>
            <head>
                <title>Activity Badges</title>
            </head>
            <body>
                <h1>Activity Badges</h1>

                <xsl:apply-templates select="badge[@type='activity']">
                    <xsl:sort select="name" order="ascending"/>
                </xsl:apply-templates>

                <p><i>&#xA9; College Productions Ltd</i></p>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="badge">
        <div style="margin-bottom:20px;">
            <h2>
                <xsl:value-of select="name"/>
            </h2>

            <p>
                <xsl:value-of select="description"/>
            </p>

            <xsl:apply-templates select="levels/availability"/>
        </div>
    </xsl:template>

    <xsl:template match="availability">
        <p>
            <xsl:choose>
                <xsl:when test="@level='beaver'">
                    Beaver:
                </xsl:when>
                <xsl:when test="@level='cub'">
                    Cub:
                </xsl:when>
                <xsl:when test="@level='scout'">
                    Scout:
                </xsl:when>
            </xsl:choose>
            <xsl:text> </xsl:text>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>

</xsl:stylesheet>