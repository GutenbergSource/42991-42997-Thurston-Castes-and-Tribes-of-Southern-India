<!DOCTYPE xsl:stylesheet [

    <!ENTITY mdash "&#x2014;">
    <!ENTITY ndash "&#x2013;">

]>
<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

<xsl:variable name="volume1" select="document('Volume 1/Processed/CastesAndTribes1.xml')"/>
<xsl:variable name="volume2" select="document('Volume 2/Processed/CastesAndTribes2.xml')"/>
<xsl:variable name="volume3" select="document('Volume 3/Processed/CastesAndTribes3.xml')"/>
<xsl:variable name="volume4" select="document('Volume 4/Processed/CastesAndTribes4.xml')"/>
<xsl:variable name="volume5" select="document('Volume 5/Processed/CastesAndTribes5.xml')"/>
<xsl:variable name="volume6" select="document('Volume 6/Processed/CastesAndTribes6.xml')"/>
<xsl:variable name="volume7" select="document('Volume 7/Processed/CastesAndTribes7.xml')"/>

<xsl:template match="/">
    <TEI.2 lang="en">
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title>Castes and Tribes of Southern India</title>
                <author key="Thurston, Edgar" ref="https://viaf.org/viaf/32085401/">Edgar Thurston (1855&ndash;1935)</author>
                <author key="Rangachari, Kadambi" ref="https://viaf.org/viaf/72806761/">Kadambi Rangachari (1868&ndash;1934)</author>
                <respStmt><resp>Transcription</resp> <name>Jeroen Hellingman</name></respStmt>
            </titleStmt>
            <publicationStmt>
                <publisher>Project Gutenberg</publisher>
                <pubPlace>Urbana, Illinois, USA.</pubPlace>
                <idno type="LCCN">10014128</idno>
                <idno type="OLN">OL7024564M</idno>
                <idno type="OLW">OL1106958W</idno>
                <idno type="OCLC">1967849</idno>
                <idno type="epub-id">urn:uuid:28d8174c-d400-4d19-befb-2fdb3f77a82a</idno>
                <idno type="PGnum">#####</idno>
                <date>#####</date>

                <xsl:apply-templates select="$volume1//teiHeader/publicationStmt/availability"/>

            </publicationStmt>
            <sourceDesc>
                <bibl>
                <author>Edgar Thurston</author>
                <title>Castes and Tribes of Southern India</title>
                <date>1909</date>
                </bibl>
            </sourceDesc>
        </fileDesc>

        <xsl:apply-templates select="$volume1//teiHeader/encodingDesc"/>
        <xsl:apply-templates select="$volume1//teiHeader/profileDesc"/>

        <revisionDesc>
            <list type="simple">
                <item>2011-03-19 started.</item>
            </list>
        </revisionDesc>
    </teiHeader>
    <text rend="stylesheet(style/classic.css)">
        <front id="frontmatter">
            <xsl:apply-templates select="$volume1//front/*[not(@id='loi')]"/>
        </front>
        <body>
            <xsl:apply-templates select="$volume1//body/*"/>
            <xsl:apply-templates select="$volume2//body/*"/>
            <xsl:apply-templates select="$volume3//body/*"/>
            <xsl:apply-templates select="$volume4//body/*"/>
            <xsl:apply-templates select="$volume5//body/*"/>
            <xsl:apply-templates select="$volume6//body/*"/>
            <xsl:apply-templates select="$volume7//body/*"/>
        </body>
        <back id="backmatter">
            <divGen type="toc" id="toc"/>
            <divGen type="Colophon"/>
        </back>
    </text>
    </TEI.2>
</xsl:template>


<xsl:template match="node()|@*">
    <xsl:copy>
        <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
</xsl:template>


</xsl:transform>
