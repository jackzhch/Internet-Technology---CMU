/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
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
public class Schedule {

    /**
     * @param args the command line arguments
     */
    public Schedule(URL inputURL) throws XMLStreamException, MalformedURLException, IOException {

        List<openSlot> slotList = null;
        openSlot slot = null;
        //URL currURL = null;
        String tagContent = null;
        String response = "";

        HttpURLConnection connection = (HttpURLConnection) inputURL.openConnection();
        XMLInputFactory factory = XMLInputFactory.newInstance();
        XMLStreamReader reader
                = factory.createXMLStreamReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));

        while (reader.hasNext()) {
            int event = reader.next();

            switch (event) {
                case XMLStreamConstants.START_ELEMENT:
                    switch (reader.getLocalName()) {
                        case "Monday":
                            slot = new openSlot();
                            System.out.println("Monday");
                            break;
                        case "Tuesday":
                            slot = new openSlot();
                            System.out.println("Tuesday");
                            break;
                        case "Wednesday":
                            slot = new openSlot();
                            System.out.println("Wednesday");
                            break;
                        case "Thursday":
                            slot = new openSlot();
                            System.out.println("Thursday");
                            break;
                        case "Friday":
                            slot = new openSlot();
                            System.out.println("Friday");
                            break;
                        case "Saturday":
                            slot = new openSlot();
                            System.out.println("Saturday");
                            break;
                        case "Sunday":
                            slot = new openSlot();
                            System.out.println("Sunday");
                            break;

                        case "schedule":
                            slotList = new ArrayList();
                            break;

                    }
                    break;

                case XMLStreamConstants.CHARACTERS:
                    tagContent = reader.getText().trim();
                    break;

                case XMLStreamConstants.END_ELEMENT:
                    switch (reader.getLocalName()) {
                        case "start":
                            slot.open = tagContent;
                            break;
                        case "end":
                            slot.close = tagContent;
                            break;
                        case "openSlot":
                            slotList.add(slot);
                        case "Monday":
                            for (openSlot s : slotList) {
                                System.out.println(s);
                            }
                            slotList = new ArrayList();
                            break;
                        case "Tuesday":
                            for (openSlot s : slotList) {
                                System.out.println(s);
                            }
                            slotList = new ArrayList();
                            break;
                        case "Wednesday":
                            for (openSlot s : slotList) {
                                System.out.println(s);
                            }
                            slotList = new ArrayList();
                            break;
                        case "Thursday":
                            for (openSlot s : slotList) {
                                System.out.println(s);
                            }
                            slotList = new ArrayList();
                            break;
                        case "Friday":
                            for (openSlot s : slotList) {
                                System.out.println(s);
                            }
                            slotList = new ArrayList();
                            break;
                        case "Saturday":
                            for (openSlot s : slotList) {
                                System.out.println(s);
                            }
                            slotList = new ArrayList();
                            break;
                        case "Sunday":
                            for (openSlot s : slotList) {
                                System.out.println(s);
                            }
                            slotList = new ArrayList();
                            break;
                    }
                    break;

                case XMLStreamConstants.START_DOCUMENT:
                    slotList = new ArrayList<>();
                    break;
            }

        }

    }

}

class openSlot {

    String open;
    String close;

    public String toString() {
        return open + " - " + close;
    }
}
