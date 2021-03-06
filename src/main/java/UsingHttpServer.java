package com.td.UsingHttpServer;

import com.td.HttpServer.*;

public class UsingHttpServer {

  public UsingHttpServer() {
    HttpServer myServer = new HttpServer(8080, "./site");
    myServer.addRoute("GET", "/hello", new CustomRouteHelloWorld());
    try {
    myServer.run();
    }
    catch(UnableToOpenPortException e) {
      System.out.println("Unable to start server port 8080 is already in use");
    }
  }

  public static void main(String[] args) {
    UsingHttpServer usingHttpServer = new UsingHttpServer();
  }
}
