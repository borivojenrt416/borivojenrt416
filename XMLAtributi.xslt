<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:i="http://viser.edu.rs/borivojenrt416 Adresar.xsd" exclude-result-prefixes="i"
>
  <xsl:template match="/">
    <xsl:apply-templates select="i:Adresar"/>
  </xsl:template>

  <xsl:template match="i:Adresar">
   
      <Adresar>

  
      <xsl:apply-templates select="i:Osoba"/>
       
      <xsl:apply-templates select="i:Kompanija"/>
      </Adresar>

  </xsl:template>
  <xsl:template match="i:Osoba">
    <xsl:text>&#xa;</xsl:text>
    <xsl:element name="Osoba">
      <xsl:attribute name="šifra">
        <xsl:value-of select="@šifra"/>
      </xsl:attribute>

      <xsl:text>&#xa;</xsl:text>
      <xsl:apply-templates select="i:PunoIme"/>
      <xsl:apply-templates select="i:DatumRođenja"/>
      <xsl:apply-templates select="i:Adresa"/>
      <xsl:element name="Telefon">
        <xsl:attribute name="broj">
          <xsl:value-of select="i:Telefon/@broj"/>
        </xsl:attribute>
        <xsl:value-of select="i:Telefon"/>
      </xsl:element>
      <xsl:text>&#xa;</xsl:text>
      <xsl:for-each select="i:Email">
        <xsl:element name="Email">
          <xsl:attribute name="mail">
            <xsl:value-of select="./@mail"/>
          </xsl:attribute>
          <xsl:value-of select="."/>
        </xsl:element>
        <xsl:text>&#xa;</xsl:text>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <xsl:template match="i:Kompanija">
    <xsl:text>&#xa;</xsl:text>
    <xsl:element name="Kompanija">
      <xsl:attribute name="šifra">
        <xsl:value-of select="@šifra"/>
      </xsl:attribute>
      <xsl:text>&#xa;</xsl:text>
      <xsl:element name="Naziv">
        <xsl:value-of select="i:Naziv"/>
      </xsl:element>
      <xsl:text>&#xa;</xsl:text>
      
      <xsl:apply-templates select="i:Adresa"/>
      <xsl:element name="Telefon">
        <xsl:attribute name="broj">
          <xsl:value-of select="i:Telefon/@broj"/>
        </xsl:attribute>
        <xsl:value-of select="i:Telefon"/>
      </xsl:element>
      <xsl:text>&#xa;</xsl:text>
      <xsl:for-each select="i:Email">
        <xsl:element name="Email">
          <xsl:attribute name="mail">
            <xsl:value-of select="./@mail"/>
          </xsl:attribute>
          <xsl:value-of select="."/>
        </xsl:element>
        <xsl:text>&#xa;</xsl:text>
      </xsl:for-each>
    </xsl:element>
  
</xsl:template>
  
  <xsl:template match="i:PunoIme">
    <xsl:element name="PunoIme">
      <xsl:text>&#xa;</xsl:text>
   <xsl:element name="Ime">
     <xsl:value-of select="i:Ime"/>
   </xsl:element>
      <xsl:text>&#xa;</xsl:text>
   <xsl:element name="SrednjeIme">
     <xsl:value-of select="i:SrednjeIme"/>
   </xsl:element>
      <xsl:text>&#xa;</xsl:text>
   <xsl:element name="Prezime">
     <xsl:value-of select="i:Prezime"/>
   </xsl:element>
      <xsl:text>&#xa;</xsl:text>
    </xsl:element>
    <xsl:text>&#xa;</xsl:text>
    
  </xsl:template>
  <xsl:template match="i:DatumRođenja">
    <xsl:element name="DatumRođenja">
      <xsl:text>&#xa;</xsl:text>
      <xsl:element name="Dan">
        <xsl:value-of select="i:Dan"/>
      </xsl:element>
      <xsl:text>&#xa;</xsl:text>
      <xsl:element name="Mesec">
        <xsl:value-of select="i:Mesec"/>
      </xsl:element>
      <xsl:text>&#xa;</xsl:text>
      <xsl:element name="Godina">
        <xsl:value-of select="i:Godina"/>
      </xsl:element>
      <xsl:text>&#xa;</xsl:text>
    </xsl:element>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="i:Adresa">
    <xsl:element name="Adresa">
      <xsl:attribute name="tip">
        <xsl:value-of select="@tip"/>
      </xsl:attribute>
      <xsl:for-each select="*">
        
        <xsl:attribute name="{name()}">
          <xsl:value-of select="text()"/>
        </xsl:attribute>

    </xsl:for-each>
    </xsl:element>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
