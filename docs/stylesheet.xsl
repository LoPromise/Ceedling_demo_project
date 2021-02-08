<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" >
  <html>
  <body>
    <center>
    <table style="color:green">
      <tr>
        <th>Sucessful Tests</th>
      </tr>
      <xsl:for-each select="TestRun/SuccessfulTests">
      <tr>
        <td><xsl:value-of select="Test/Name"/></td>
      </tr>
      </xsl:for-each>
    </table>
    <table style="color:red">
      <tr>
        <th>Failed Tests</th>
      </tr>
      <xsl:for-each select="TestRun/FailedTests">
      <tr>
        <td><xsl:value-of select="Test/Name"/></td>
      </tr>
      </xsl:for-each>
    </table>
    <table style="color:darkkhaki">
      <tr>
        <th>Ignored Tests</th>
      </tr>
      <xsl:for-each select="TestRun/IgnoredTests">
      <tr>
        <td><xsl:value-of select="Test/Name"/></td>
      </tr>
      </xsl:for-each>
    </table>
    </center>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
