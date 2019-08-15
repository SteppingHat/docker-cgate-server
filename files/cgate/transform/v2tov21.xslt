<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:cis="http://www.clipsal.com/cis/schema/2001/cbus.xsd" > 

  <!-- identity transform : the low-priority default behaviour is to copy each node exactly -->

  <xsl:template match="@*|*|processing-instruction()|comment()" priority="-2">
	<xsl:copy>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </xsl:copy>
  </xsl:template>

  <!-- change DBVersion to 2.1 --> 

  <xsl:template match="DBVersion"> 
    <xsl:element name="DBVersion">2.1</xsl:element>
  </xsl:template> 

  <!-- delete new wireless parameters if they exist -->
  <xsl:template match="PP[@Name = 'KeyMaskAllowed']">
  </xsl:template> 
  <xsl:template match="PP[@Name = 'KeyMaskSave']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyCurrentMask']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyEnableMask1']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyEnableMask2']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyEnableMask3']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyEnableMask4']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyMaskNetworkVariable']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyMaskNetworkVariableLevels']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyOffsetAllowed']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyOffsetSave']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyCurrentOffset']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyOffsets']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyOffsetNetworkVariable']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'KeyOffsetNetworkVariableLevels']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'FeatureSet']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key9CommandLookup']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key10CommandLookup']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key11CommandLookup']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key12CommandLookup']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key13CommandLookup']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key14CommandLookup']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key15CommandLookup']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key16CommandLookup']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key9Parameter1']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key10Parameter1']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key11Parameter1']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key12Parameter1']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key13Parameter1']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key14Parameter1']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key15Parameter1']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key16Parameter1']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key9Parameter2']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key10Parameter2']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key11Parameter2']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key12Parameter2']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key13Parameter2']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key14Parameter2']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key15Parameter2']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key16Parameter2']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key9BlockMap']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key10BlockMap']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key11BlockMap']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key12BlockMap']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key13BlockMap']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key14BlockMap']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key15BlockMap']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Key16BlockMap']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Remote1Identity']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Remote2Identity']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Remote1KeyMap']">
  </xsl:template>
  <xsl:template match="PP[@Name = 'Remote2KeyMap']">
  </xsl:template>

  <!-- Add Wireless Key Mask and Key Enable params --> 
  <xsl:template match="PP[@Name = 'KeyExtraLongPressDuration']">
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyExtraLongPressDuration</xsl:attribute>
      <xsl:attribute name="Value"><xsl:value-of select="@Value"/></xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyMaskAllowed</xsl:attribute>
      <xsl:attribute name="Value">0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyMaskSave</xsl:attribute>
      <xsl:attribute name="Value">0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyCurrentMask</xsl:attribute>
      <xsl:attribute name="Value">0xffff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyEnableMask1</xsl:attribute>
      <xsl:attribute name="Value">0xffff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyEnableMask2</xsl:attribute>
      <xsl:attribute name="Value">0xffff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyEnableMask3</xsl:attribute>
      <xsl:attribute name="Value">0xffff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyEnableMask4</xsl:attribute>
      <xsl:attribute name="Value">0xffff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyMaskNetworkVariable</xsl:attribute>
      <xsl:attribute name="Value">0xff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyMaskNetworkVariableLevels</xsl:attribute>
      <xsl:attribute name="Value">0xff 0xff 0xff 0xff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyOffsetAllowed</xsl:attribute>
      <xsl:attribute name="Value">0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyOffsetSave</xsl:attribute>
      <xsl:attribute name="Value">0x1</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyCurrentOffset</xsl:attribute>
      <xsl:attribute name="Value">0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyOffsets</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyOffsetNetworkVariable</xsl:attribute>
      <xsl:attribute name="Value">0xff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">KeyOffsetNetworkVariableLevels</xsl:attribute>
      <xsl:attribute name="Value">0xff 0xff 0xff 0xff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">FeatureSet</xsl:attribute>
      <xsl:attribute name="Value">0x0</xsl:attribute>
    </xsl:element>

    <!-- Add Wireless KeyXCommandLookup params to support 16 blocks/keys --> 

    <xsl:element name="PP">
      <xsl:attribute name="Name">Key9CommandLookup</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key10CommandLookup</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key11CommandLookup</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key12CommandLookup</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key13CommandLookup</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key14CommandLookup</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key15CommandLookup</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key16CommandLookup</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>

    <!-- Add Wireless KeyXParameter1 params to support 16 blocks/keys --> 

    <xsl:element name="PP">
      <xsl:attribute name="Name">Key9Parameter1</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key10Parameter1</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key11Parameter1</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key12Parameter1</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key13Parameter1</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key14Parameter1</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key15Parameter1</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key16Parameter1</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>

    <!-- Add Wireless KeyXParameter2 params to support 16 blocks/keys --> 

    <xsl:element name="PP">
      <xsl:attribute name="Name">Key9Parameter2</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key10Parameter2</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key11Parameter2</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key12Parameter2</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key13Parameter2</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key14Parameter2</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key15Parameter2</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key16Parameter2</xsl:attribute>
      <xsl:attribute name="Value">0x0 0x0 0x0 0x0 0x0 0x0</xsl:attribute>
    </xsl:element>

    <!-- Add Wireless KeyXBlockMap params to support 16 blocks/keys --> 

    <xsl:element name="PP">
      <xsl:attribute name="Name">Key9BlockMap</xsl:attribute>
      <xsl:attribute name="Value">0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key10BlockMap</xsl:attribute>
      <xsl:attribute name="Value">0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key11BlockMap</xsl:attribute>
      <xsl:attribute name="Value">0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key12BlockMap</xsl:attribute>
      <xsl:attribute name="Value">0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key13BlockMap</xsl:attribute>
      <xsl:attribute name="Value">0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key14BlockMap</xsl:attribute>
      <xsl:attribute name="Value">0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key15BlockMap</xsl:attribute>
      <xsl:attribute name="Value">0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Key16BlockMap</xsl:attribute>
      <xsl:attribute name="Value">0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1</xsl:attribute>
    </xsl:element>

    <!-- Add Wireless Remote Control params --> 

    <xsl:element name="PP">
      <xsl:attribute name="Name">Remote1Identity</xsl:attribute>
      <xsl:attribute name="Value">0xff 0xff 0xff 0xff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Remote2Identity</xsl:attribute>
      <xsl:attribute name="Value">0xff 0xff 0xff 0xff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Remote1KeyMap</xsl:attribute>
      <xsl:attribute name="Value">0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff</xsl:attribute>
    </xsl:element>
    <xsl:element name="PP">
      <xsl:attribute name="Name">Remote2KeyMap</xsl:attribute>
      <xsl:attribute name="Value">0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff</xsl:attribute>
    </xsl:element>
  </xsl:template> 

  <!-- Correct KEYA3 params -->
  <xsl:template match="PP[@Name = 'EnableNightlightPCx']"> 
    <xsl:element name="PP">
      <xsl:attribute name="Name">EnableNightlightOnPCx</xsl:attribute>
      <xsl:attribute name="Value"><xsl:value-of select="@Value"/></xsl:attribute>
    </xsl:element>
  </xsl:template> 

  <!-- template for Unit --> 
  <xsl:template match="cis:Unit">
    <xsl:copy>
   	  <xsl:apply-templates select="@*|node()"/>

      <!-- add bit params to Neo Pro units that were loaded with Neo specs --> 

  	  <xsl:if test="( 
	                  UnitType='KEYA1' or 
	                  UnitType='KEYAV2' or 
	                  UnitType='KEYA3' or 
	                  UnitType='KEYAV4' or 
	                  UnitType='KEYA6' or 
	                  UnitType='KEYA8' or 
	                  UnitType='KEYB2' or 
	                  UnitType='KEYB4' or 
	                  UnitType='KEYB6' or 
	                  UnitType='KEYM2' or 
	                  UnitType='KEYM4' or 
	                  UnitType='KEYM6' or 
	                  UnitType='KEYM8'		  
	                ) and (
					  starts-with( FirmwareVersion, '1.6' ) or
					  starts-with( FirmwareVersion, '1.7' ) or
					  starts-with( FirmwareVersion, '1.8' ) or
					  starts-with( FirmwareVersion, '1.9' ) or
					  starts-with( FirmwareVersion, '1.10' ) or
					  starts-with( FirmwareVersion, '1.11' ) or
					  starts-with( FirmwareVersion, '1.12' ) or
					  starts-with( FirmwareVersion, '2.' )

					)">
        <xsl:element name="PP">
          <xsl:attribute name="Name">KeyDisableGroupInvert</xsl:attribute>
          <xsl:attribute name="Value">1</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">CorridorLinkEnable</xsl:attribute>
          <xsl:attribute name="Value">0</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">NightlightColour</xsl:attribute>
          <xsl:attribute name="Value">0</xsl:attribute>
        </xsl:element>
        <xsl:element name="PP">
          <xsl:attribute name="Name">DisableIRNEC</xsl:attribute>
          <xsl:attribute name="Value">1</xsl:attribute>
        </xsl:element>
	  </xsl:if>

      <!-- add missing params to DLT units --> 

  	<xsl:if test="( 
	                UnitType='KEYBL5' or 
	                UnitType='KEYML5' 	  
	               ) ">
          <xsl:element name="PP">
            <xsl:attribute name="Name">CorridorLinkEnable</xsl:attribute>
            <xsl:attribute name="Value">0</xsl:attribute>
         </xsl:element>
       </xsl:if>
    </xsl:copy>
  </xsl:template>    
</xsl:stylesheet> 
