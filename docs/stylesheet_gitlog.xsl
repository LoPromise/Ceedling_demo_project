<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
    <xsl:template match="*">
      <hmtl>
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
            <h1>GitLog</h1>
            <h2>Feature</h2>
            <table>
            <tr>
            	<th>commitNumber</th>
        		<th>UserName</th>
    	    	<th>timestamp</th>
	    	    <th>Message</th>
	        </tr>
            <xsl:apply-templates select="Feature"/>
            </table>
            <h2>Bug</h2>
            <table>
            <tr>
                <th>commitNumber</th>
        		<th>UserName</th>
    	    	<th>timestamp</th>
	    	    <th>Message</th>
	        </tr>
            <xsl:apply-templates select="Bug"/>
            </table>
            <h2>Issue</h2>
            <table>
            <tr>
                <th>commitNumber</th>
        		<th>UserName</th>
    	    	<th>timestamp</th>
	    	    <th>Message</th>
	        </tr>
            <xsl:apply-templates select="Issue"/>
            </table>
            <h2>devops</h2>
            <table>
            <tr>
                <th>commitNumber</th>
        		<th>UserName</th>
    	    	<th>timestamp</th>
	    	    <th>Message</th>
	        </tr>
            <xsl:apply-templates select="devops"/>
            </table>
            </center>
        </body>
      </hmtl>
    </xsl:template>
    
    <xsl:template match="Feature">
    <tr>
	    <td><xsl:value-of select="line/commit" /></td>
   		<td><xsl:value-of select="line/UserName" /></td>
	   	<td><xsl:value-of select="line/timestamp" /></td>
	   	<td><xsl:value-of select="line/Message" /></td>
   	</tr>
    </xsl:template>
    
    <xsl:template match="Bug">
    <tr>
        <td><xsl:value-of select="line/commit" /></td>
   		<td><xsl:value-of select="line/UserName" /></td>
	   	<td><xsl:value-of select="line/timestamp" /></td>
	   	<td><xsl:value-of select="line/Message" /></td>
   	</tr>
    </xsl:template>
    
    <xsl:template match="Issue">
    <tr>
        <td><xsl:value-of select="line/commit" /></td>
       	<td><xsl:value-of select="line/UserName" /></td>
	   	<td><xsl:value-of select="line/timestamp" /></td>
	   	<td><xsl:value-of select="line/Message" /></td>
   	</tr>
    </xsl:template>
    
    <xsl:template match="devops">
    <tr>
        <td><xsl:value-of select="line/commit" /></td>
       	<td><xsl:value-of select="line/UserName" /></td>
	   	<td><xsl:value-of select="line/timestamp" /></td>
	   	<td><xsl:value-of select="line/Message" /></td>
   	</tr>
    </xsl:template>
    
</xsl:transform>

