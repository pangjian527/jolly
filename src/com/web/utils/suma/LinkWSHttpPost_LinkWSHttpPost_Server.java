
package com.web.utils.suma;

import javax.xml.ws.Endpoint;

/**
 * This class was generated by Apache CXF 2.3.7
 * 2012-06-28T16:35:21.046+08:00
 * Generated source version: 2.3.7
 * 
 */
 
public class LinkWSHttpPost_LinkWSHttpPost_Server{

    protected LinkWSHttpPost_LinkWSHttpPost_Server() throws java.lang.Exception {
        System.out.println("Starting Server");
        Object implementor = new LinkWSHttpPostImpl();
        String address = "http://120.132.132.133/WS/LinkWS.asmx";
        Endpoint.publish(address, implementor);
    }
    
    public static void main(String args[]) throws java.lang.Exception { 
        new LinkWSHttpPost_LinkWSHttpPost_Server();
        System.out.println("Server ready..."); 
        
        Thread.sleep(5 * 60 * 1000); 
        System.out.println("Server exiting");
        System.exit(0);
    }
}