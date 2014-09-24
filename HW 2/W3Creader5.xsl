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
                  <xsl:for-each select="p:entry">  	
                            <li>
                             <xsl:variable name="title" select="p:title"/>
                             <xsl:variable name="link" select="p:link/@href"/>
                             <a href="{$link}">
                                <xsl:value-of select="$title"/>
                             </a>   
                             </li>	
                  </xsl:for-each>
                    </ul>	
              </body>
       </html>
</xsl:template>


</xsl:stylesheet>