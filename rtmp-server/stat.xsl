<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="/">
<html>
  <head>
    <title>RTMP Server Status</title>
    <style>
      body { font-family: Arial, sans-serif; background-color: #f9f9f9; margin: 20px; }
      table { border-collapse: collapse; width: 100%; }
      th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
      th { background-color: #4CAF50; color: white; }
    </style>
  </head>
  <body>
    <h1>📡 RTMP Server Live Status</h1>
    <h2>Applications</h2>
    <table>
      <tr><th>Application</th><th>Stream Name</th><th>Time (seconds)</th></tr>
      <xsl:for-each select="rtmp/server/application">
        <xsl:for-each select="live/stream">
          <tr>
            <td><xsl:value-of select="../../name"/></td>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="time"/></td>
          </tr>
        </xsl:for-each>
      </xsl:for-each>
    </table>
  </body>
</html>
</xsl:template>

</xsl:stylesheet>