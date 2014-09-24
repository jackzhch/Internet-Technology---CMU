<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                        xmlns:p="http://www.w3.org/2005/Atom"
                        xmlns="http://www.w3.org/1999/xhtml"
                        version="1.0">
<xsl:output method="xml" 
                        omit-xml-declaration="yes"
                        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>                         

<xsl:variable name="entries" select="//p:feed/p:entry"/>
<xsl:template match="p:feed">
	<html>
              <body>	
                        <p>
                        	Counting Atom entry items:
                        </p>
                    
                              <p>
                                <xsl:value-of select="count($entries)"/>
                              </p>
                  
              </body>
       </html>

</xsl:template>



</xsl:stylesheet>