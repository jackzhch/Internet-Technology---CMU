/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.stream.*;

/**
 *
 * @author macbookpro
 */
public class URLList {

    List<URL> urlList = null;
        URL currURL = null;
        String tagContent = null;
    /**
     * @param args the command line arguments
     */
    public URLList() throws XMLStreamException, MalformedURLException {



        XMLInputFactory factory = XMLInputFactory.newInstance();
        XMLStreamReader reader
                = factory.createXMLStreamReader(
                        ClassLoader.getSystemResourceAsStream("urlList.xml"));

        while (reader.hasNext()) {
            int event = reader.next();

            switch (event) {
                case XMLStreamConstants.START_ELEMENT:
                    if ("URL".equals(reader.getLocalName())) {
                        // currURL = new URL("");
                    }
                    if ("URLList".equals(reader.getLocalName())) {
                        urlList = new ArrayList<>();
                    }
                    break;

                case XMLStreamConstants.CHARACTERS:
                    tagContent = reader.getText().trim();
                    break;

                case XMLStreamConstants.END_ELEMENT:
                    switch (reader.getLocalName()) {
                        case "URL":
                            currURL = new URL(tagContent);
                            urlList.add(currURL);
                            break;

                    }
                    break;

                case XMLStreamConstants.START_DOCUMENT:
                    urlList = new ArrayList<>();
                    break;
            }
        }

        for (URL url : urlList) {
            System.out.println(url);
        }
    }
    public List<URL> getURLList(){
        return urlList;
    }

}
