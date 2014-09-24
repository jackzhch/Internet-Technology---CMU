/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
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
public class Scheduler {


    public static void main(String[] args) throws MalformedURLException, XMLStreamException, IOException {
        URLList linkList = new URLList();
        List<URL> link = linkList.urlList;
        int i = 0;
        for (URL url : link) {
            i++;
            System.out.println("\n"+"Schedule" + i);
            Schedule schedule = new Schedule(url);
        }
    }

}
