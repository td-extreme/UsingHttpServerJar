package com.td.UsingHttpServer;

import com.td.HttpServer.*;

public class UsingHttpServer {

  public UsingHttpServer() {
    HttpServer myServer = new HttpServer(8080, "./site");
    myServer.addRoute("GET", "/hello", new CustomRouteHelloWorld());
    myServer.run();
  }

  public static void main(String[] args) {
    UsingHttpServer usingHttpServer = new UsingHttpServer();
  }
}
