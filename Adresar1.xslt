<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:i="http://viser.edu.rs/borivojenrt416 Adresar.xsd" exclude-result-prefixes="i"
>
  <xsl:template match="/">
    <xsl:apply-templates select="i:Adresar"/> 
  </xsl:template>
  
  <xsl:template match="i:Adresar">
    <html>
      <body>
        <p>Osobe</p>
        <table border="1px">
          <tr>
            <td>Ime</td>
            <td>Srednje ime</td>
            <td>Prezime</td>
            <td>Dan rođenja</td>
            <td>Mesec rođenja</td>
            <td>Godina rođenja</td>
            <td>Ulica stanovanja</td>
            <td>Broj stanovanja</td>
            <td>Grad stanovanja</td>
            <td>Država stanovanja</td>
            <td>Broj telefona</td>
            <td>Email adresa</td>
          </tr>
          <xsl:apply-templates select="i:Osoba"/>
        </table>
        <p>Kompanije</p>
        <table border="1px">
          <tr>
            <td>Naziv kompanije</td>
            <td>Ulica</td>
            <td>Broj</td>
            <td>Grad</td>
            <td>Država</td>
            <td>Broj telefona</td>
            <td>Email adresa</td>
          </tr>
          <xsl:apply-templates select="i:Kompanija"/>
        </table>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="i:Osoba">
     
    <xsl:if test="count(i:Email)>2">
    <tr>
      <xsl:apply-templates select="i:PunoIme"/>
      <xsl:apply-templates select="i:DatumRođenja"/>
      <xsl:apply-templates select="i:Adresa"/>
      <td>
        <xsl:value-of select="i:Telefon"/>
      </td>
      <td>
        <xsl:for-each select="i:Email">
            <xsl:value-of select="."/>
          <br/>
        </xsl:for-each>
      
      </td>
    </tr>
    </xsl:if>
  </xsl:template>

  <xsl:template match="i:Kompanija">
    <xsl:if test="count(i:Email)>2">
      <tr>
        <td>
          <xsl:value-of select="i:Naziv"/>
        </td>
        <xsl:apply-templates select="i:Adresa"/>
        <td>
          <xsl:value-of select="i:Telefon"/>
        </td>
        <td>
          <xsl:for-each select="i:Email">
              <xsl:value-of select="."/>
            <br/>
          </xsl:for-each>

        </td>
      </tr>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="i:PunoIme">
    <td>
      <xsl:value-of select="i:Ime"/>
    </td>
    <td>
      <xsl:value-of select="i:SrednjeIme"/>
    </td>
    <td>
      <xsl:value-of select="i:Prezime"/>
    </td>
  </xsl:template>

  <xsl:template match="i:DatumRođenja">
    <td>
      <xsl:value-of select="i:Dan"/>
    </td>
    <td>
      <xsl:value-of select="i:Mesec"/>
    </td>
    <td>
      <xsl:value-of select="i:Godina"/>
    </td>
  </xsl:template>

  <xsl:template match="i:Adresa">
    <td>
      <xsl:value-of select="i:Ulica"/>
    </td>
    <td>
      <xsl:value-of select="i:Broj"/>
    </td>
    <td>
      <xsl:value-of select="i:Grad"/>
    </td>
    <td>
      <xsl:value-of select="i:Država"/>
    </td>
  </xsl:template>
  
</xsl:stylesheet>
