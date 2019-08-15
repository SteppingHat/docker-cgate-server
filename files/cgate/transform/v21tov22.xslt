<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:cis="http://www.clipsal.com/cis/schema/2001/cbus.xsd" > 

  <!-- identity transform : the low-priority default behaviour is to copy each node exactly -->

  <xsl:template match="@*|*|processing-instruction()|comment()" priority="-2">
	<xsl:copy>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </xsl:copy>
  </xsl:template>

  <!-- change DBVersion to 2.2 --> 

  <xsl:template match="DBVersion"> 
    <xsl:element name="DBVersion">2.2</xsl:element>
  </xsl:template> 

  <!-- remove unwanted parameters on units that were mis-transformed in 2.1 --> 

  <xsl:template match="Unit[ ( UnitType='KEYBL5' or UnitType='KEYML5' ) and not( PP[@Name='Application'] ) ]/PP[@Name='CorridorLinkEnable']">
  </xsl:template>

  <xsl:template match="Unit[ ( 
                                   UnitType='KEYA1' or UnitType='KEYAV2' or UnitType='KEYA3' or
                                   UnitType='KEYAV4' or UnitType='KEYA6' or UnitType='KEYA8' or
                                   UnitType='KEYB2' or UnitType='KEYB4' or UnitType='KEYB6' or
                                   UnitType='KEYM2' or UnitType='KEYM4' or UnitType='KEYM6' or UnitType='KEYM8'
                                 ) and 
								 ( starts-with( FirmwareVersion, '1.6' ) ) and 
								 ( not( PP[@Name='Application'] ) ) 
							   ]/PP[ @Name='KeyDisableGroupInvert' or @Name='CorridorLinkEnable' or 
							         @Name='NightlightColour' or @Name='DisableIRNEC' ]">
  </xsl:template>


  <!-- delete new wireless parameters if they exist -->

  <xsl:template match="PP[@Name = 'Remote3Identity']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'Remote4Identity']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'Remote5Identity']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'Remote6Identity']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'Remote7Identity']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'Remote8Identity']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'Remote3KeyMap']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'Remote4KeyMap']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'Remote5KeyMap']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'Remote6KeyMap']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'Remote7KeyMap']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'Remote8KeyMap']">
  </xsl:template> 

  <xsl:template match="Unit">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>

      <!-- If there are any 2.0.0 wireless units added using Toolkit 1.5 and below, convert parameters to support 8 remotes -->
      <xsl:if test="( UnitType='WPA2D1' or 
	              UnitType='WPA2R1' or 
	              UnitType='WPAP2D1' or 
	              UnitType='WPAP2R1' or 
	              UnitType='WRB2D1' or 
	              UnitType='WRB2R1' or 
	              UnitType='WRB4D1' or 
	              UnitType='WRB4D2' or 
	              UnitType='WRB4R1' or 
	              UnitType='WRB4R2' or 
	              UnitType='WRB6D1' or 
	              UnitType='WRB6D2' or 
	              UnitType='WRB6R1' or 
	              UnitType='WRB6R2' or 
	              UnitType='WRM2D1' or 
	              UnitType='WRM2R1' or 
	              UnitType='WRM4D1' or 
	              UnitType='WRM4D2' or 
	              UnitType='WRM4R1' or 
	              UnitType='WRM4R2' or 
	              UnitType='WRM8D1' or 
	              UnitType='WRM8D2' or 
	              UnitType='WRM8R1' or 
	              UnitType='WRM8R2' or 
	              UnitType='WRP2D1' or 
	              UnitType='WRP2R1' or 
	              UnitType='WRP4D1' or 
	              UnitType='WRP4D2' or 
	              UnitType='WRP4R1' or 
	              UnitType='WRP4R2' or 
	              UnitType='WRP6D1' or 
	              UnitType='WRP6D2' or 
	              UnitType='WRP6R1' or 
	              UnitType='WRP6R2' ) and 
                    ( starts-with( FirmwareVersion, '2.0.0' ) ) and
                    ( PP[@Name='Application'] )">
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote3Identity</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote4Identity</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote5Identity</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote6Identity</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote7Identity</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote8Identity</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote3KeyMap</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote4KeyMap</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote5KeyMap</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote6KeyMap</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote7KeyMap</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">Remote8KeyMap</xsl:attribute>
          <xsl:attribute name="Value">0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff</xsl:attribute>
        </xsl:element>
      </xsl:if>
    </xsl:copy>
  </xsl:template>

  <!-- replace PC_CTA firmware 4.00 with 4.0.0 --> 
  <xsl:template match="Unit[ ( UnitType='PC_CTA' ) and ( starts-with( FirmwareVersion, '4.00' ) ) ]">
    <xsl:copy>
      <xsl:apply-templates select="node()[not(self::FirmwareVersion)]"/>
      <xsl:element name="FirmwareVersion">4.0.0</xsl:element>
    </xsl:copy>
  </xsl:template>

  <!-- replace 4.0.00 PCI units with firmware number 4.0.0 --> 
  <xsl:template match="Unit[ ( ( UnitType='PCINT4' ) or
                               ( UnitType='PCLOCAL4' ) or
                               ( UnitType='PC_CBTI' ) or
                               ( UnitType='PC_PGA' ) or
                               ( UnitType='PC_IRT2' ) or
                               ( UnitType='PC_WHAM' ) ) and
                               ( starts-with( FirmwareVersion, '4.0.00' ) ) ]">
    <xsl:copy>
      <xsl:apply-templates select="node()[not(self::FirmwareVersion)]"/>
      <xsl:element name="FirmwareVersion">4.0.0</xsl:element>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet> 
