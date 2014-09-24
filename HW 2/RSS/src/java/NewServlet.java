/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.Result;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;

/**
 *
 * @author macbookpro
 */
@WebServlet(urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
     PrintWriter out = response.getWriter();
            
    // get the xsl stored in this project 
    ServletContext context = getServletContext();                       
    InputStream xsl = (InputStream)
                        (context.getResourceAsStream("/RSSreader.xsl"));
                   
    // We need two source objects and one result
    // get an external xml document using a url in a 
    // string format
    String url ="";
    String topic = request.getParameter("topic");
    String source = request.getParameter("source");
    if ((topic.equals("Business")) && (source.equals("NYT")))
        url="http://rss.nytimes.com/services/xml/rss/nyt/Business.xml";
    else if (topic.equals("Business") & source.equals("BBC"))
        url="http://feeds.bbci.co.uk/news/business/rss.xml";
    else if (topic.equals("Business") & source.equals("SMH"))
        url="http://rss.feedsportal.com/c/34697/fe.ed/www.smh.com.au/rssheadlines/business.xml";
    else if (topic.equals("Technology") & source.equals("NYT"))
        url="http://rss.nytimes.com/services/xml/rss/nyt/Technology.xml";
    else if (topic.equals("Technology") & source.equals("BBC"))
        url="http://feeds.bbci.co.uk/technology/world/rss.xml";
    else if (topic.equals("Technology") & source.equals("SMH"))
        url="http://rss.feedsportal.com/c/34697/fe.ed/feeds.smh.com.au/rssheadlines/technology.xml";
    else if (topic.equals("World News") & source.equals("NYT"))
        url="http://rss.nytimes.com/services/xml/rss/nyt/World.xml";
    else if (topic.equals("World News") & source.equals("BBC"))
        url="http://feeds.bbci.co.uk/news/world/rss.xml";
    else if (topic.equals("World News") & source.equals("SMH"))
        url="http://rss.feedsportal.com/c/34697/fe.ed/feeds.smh.com.au/rssheadlines/world.xml";
            
    Source xmlDoc =  new StreamSource(url);
    Source xslDoc =  new StreamSource(xsl);
    Result result =  new StreamResult(out);         

    // Prepare to transform 
    TransformerFactory factory = TransformerFactory.newInstance();
    Transformer trans;
        try {
            trans = factory.newTransformer(xslDoc);
            trans.transform(xmlDoc,result); 
        } catch (TransformerConfigurationException ex) {
            Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerException ex) {
            Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
