<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:cis="http://www.clipsal.com/cis/schema/2001/cbus.xsd" > 

  <!-- identity transform : the low-priority default behaviour is to copy each node exactly -->

  <xsl:template match="@*|*|processing-instruction()|comment()" priority="-2">
	<xsl:copy>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </xsl:copy>
  </xsl:template>

  <!-- change DBVersion to 2.3 --> 

  <xsl:template match="DBVersion"> 
    <xsl:element name="DBVersion">2.3</xsl:element>
  </xsl:template> 

</xsl:stylesheet> 
