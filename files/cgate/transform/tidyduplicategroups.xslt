<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:cis="http://www.clipsal.com/cis/schema/2001/cbus.xsd"
    exclude-result-prefixes="cis">

  <!-- identity transform : the low-priority default behaviour is to copy each node exactly -->

  <xsl:template match="@*|*|processing-instruction()|comment()" priority="-2"  name="identity">
	<xsl:copy>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Remove duplicate groups under each application, keeping the first one -->

  <xsl:key
		name="keyApplicationGroupAddress" 
		match="Application/Group" 
		use="concat(generate-id(..),'+',Address)"/>
	
  <xsl:template match="Application/Group">
    <xsl:if test="generate-id() = generate-id(key('keyApplicationGroupAddress',concat(generate-id(..),'+',Address))[1])">
	  <xsl:copy>
	    <xsl:apply-templates select="node()"/>
	  </xsl:copy>
	</xsl:if>
  </xsl:template>
  
</xsl:stylesheet> 
