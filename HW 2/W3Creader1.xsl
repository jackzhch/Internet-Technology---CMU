<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                        xmlns:p="http://www.w3.org/2005/Atom"
                        xmlns="http://www.w3.org/1999/xhtml"
                        version="1.0">
<xsl:output method="xml" 
                        omit-xml-declaration="yes"
                        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>                         

<xsl:template match="p:feed">
	<html>
              <body>	
                        <h1>
                        	<xsl:value-of select="p:title"/>
                        </h1>
                 	<ul>      	
                             <xsl:apply-templates/>      	
                    </ul>	
              </body>
       </html>
</xsl:template>


<xsl:template match="*">
</xsl:template>

</xsl:stylesheet>