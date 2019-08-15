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

  <!-- Wrap with a header and footer if the file contains only "<Project>...</Project>" -->
  <!-- NB: The header '?xml version="1.0" encoding="utf-8"?' is automatically added -->
  <!-- NB: The use of exclude-result-prefixes prevents an xmlns entry -->
  
  <xsl:template match="/Project">
    <Installation><DBVersion>2.2</DBVersion><Version>1.0</Version><Modified>2010-01-01T13:01:46.657+10:30</Modified>
		<xsl:call-template name="identity"/>
    <InstallationDetail><SystemLocation>[unknown]</SystemLocation><HardwarePlatform>[unknown]</HardwarePlatform><Hostname></Hostname><OSName>Windows XP</OSName><OSVersion>5.1</OSVersion><HardwareLocation>[unknown]</HardwareLocation><MaintenanceEmail>[unknown]</MaintenanceEmail><Installer><Name>[unknown]</Name></Installer></InstallationDetail></Installation>
  </xsl:template>

  <!-- Strip out all <OID xmlns="">...</OID> and <OID>...</OID> nodes. --> 
  <xsl:template match="OID">
  </xsl:template> 

  <!-- Remove duplicate groups of address 255 under each application -->
  <!-- Correct Tagname of group of address 255 to "<Unused>" -->
  <xsl:key
		name="keyApplicationGroupAddress" 
		match="Application/Group" 
		use="concat(generate-id(..),'+',Address)"/>
	
  <xsl:template match="Application/Group[ ( Address='255' ) ]">
    <xsl:if test="generate-id() = generate-id(key('keyApplicationGroupAddress',concat(generate-id(..),'+',Address))[1])">
	  <xsl:copy>
	    <xsl:apply-templates select="node()[not(self::TagName)]"/>
		<xsl:element name="TagName">&lt;Unused&gt;</xsl:element>
	  </xsl:copy>
	</xsl:if>
  </xsl:template>

</xsl:stylesheet> 
