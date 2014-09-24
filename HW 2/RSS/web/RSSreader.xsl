<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                        xmlns:p="http://www.w3.org/2005/Atom"
                        xmlns="http://www.w3.org/1999/xhtml"
                        version="2.0">
<xsl:output method="xml" 
                        omit-xml-declaration="yes"
                        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>                         

<xsl:variable name="items" select="//rss/channel/item"/>
<xsl:template match="rss">
  <html>
              <body>  
                        
                  <ul>        
                             <xsl:for-each select="$items">
                              
                              <li>
                            
                             <xsl:variable name="linkalias" select="link"/>
                             <a href="{$linkalias}">
                                <xsl:value-of select="title"/>
                             </a>   

                              </li>

                            </xsl:for-each>  
                    </ul> 
              </body>
       </html>
</xsl:template>



</xsl:stylesheet>