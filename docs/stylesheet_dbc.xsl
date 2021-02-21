<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
    		<h1>Can Messages</h1>
    		<xsl:apply-templates select="candb/message"/>
	    	</center>
	    	</body>
  	    	</html>
    </xsl:template>
    <xsl:template match="message">
    <h2><xsl:value-of select="name" /></h2>    
    <table>
    <tr>
	<th>Name</th>
  	<th>id</th>
	<th>dlc</th>
    </tr>
    <tr>
	<td><xsl:value-of select="name" /></td>
   	<td><xsl:value-of select="id" /></td>
	<td><xsl:value-of select="dlc" /></td>
    </tr>
    </table>
    <h3>Contents</h3>
	<table>
    	<tr>
	  <th>Name</th>
	  <th>startbit</th>
	  <th>bitlength</th>
          <th>endianess</th>
          <th>scaling</th>
          <th>offset</th>
          <th>minimum</th>
          <th>maximum</th>
	  <th>signed</th>
          <th>floating</th>
          <th>units</th>
	</tr>
       <xsl:apply-templates select="signal"/>
    </table>
    </xsl:template>
    <xsl:template match="signal">
    	<tr>
		<td><xsl:value-of select="name" /></td>
   		<td><xsl:value-of select="startbit" /></td>   		   
   		<td><xsl:value-of select="bitlength" /></td>
	   	<td><xsl:value-of select="endianess" /></td>
	   	<td><xsl:value-of select="scaling" /></td>
	   	<td><xsl:value-of select="offset" /></td>
	   	<td><xsl:value-of select="minimum" /></td>
	   	<td><xsl:value-of select="maximum" /></td>
	   	<td><xsl:value-of select="signed" /></td>
	   	<td><xsl:value-of select="floating" /></td>
	   	<td><xsl:value-of select="units" /></td>
   	</tr>
    </xsl:template>
</xsl:transform>
