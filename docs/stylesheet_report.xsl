<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" >
  <html>
  <head>
  <style>
  table {
   font-family: arial, sans-serif;
   border-collapse: collapse;
   width: 100%;
  }

  td, th {
   border: 1px solid #dddddd;
   text-align: left;
   padding: 8px;
  }

  tr:nth-child(even) {
   background-color: #dddddd;
  }
  </style>
  </head>
  <body>
    <center>
    <h1>TestReports</h1>
    <table>
    	<tr>
	    	<th>Tests</th>
    		<th>Ignores</th>
	    	<th>FailuresTotal</th>
	    	<th>Errors</th>
	    	<th>Failures</th>
	</tr>
    	<tr>
	    	<td><xsl:value-of select="TestRun/Statistics/Tests" /></td>
   		<td><xsl:value-of select="TestRun/Statistics/Ignores" /></td>
	   	<td><xsl:value-of select="TestRun/Statistics/FailuresTotal" /></td>
	   	<td><xsl:value-of select="TestRun/Statistics/Errors" /></td>
   		<td><xsl:value-of select="TestRun/Statistics/Failures" /></td>
   	</tr>
    </table>
    <table style="color:green">
      <tr>
        <th>Sucessful Tests</th>
      </tr>
      <xsl:for-each select="TestRun/SuccessfulTests/Test">
      <tr>
        <td><xsl:value-of select="Name"/></td>
      </tr>
      </xsl:for-each>
    </table>
    <table style="color:red">
      <tr>
        <th>Failed Tests</th>
      </tr>
      <xsl:for-each select="TestRun/FailedTests/Test">
      <tr>
        <td><xsl:value-of select="Name"/></td>
      </tr>
      </xsl:for-each>
    </table>
    <table style="color:darkkhaki">
      <tr>
        <th>Ignored Tests</th>
      </tr>
      <xsl:for-each select="TestRun/IgnoredTests/Test">
      <tr>
        <td><xsl:value-of select="Name"/></td>
      </tr>
      </xsl:for-each>
    </table>
    </center>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
