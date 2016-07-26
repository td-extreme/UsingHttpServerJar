package com.td.UsingHttpServer;

import com.td.HttpServer.*;

public class CustomRouteHelloWorld implements IHandler {
  public HttpResponse generateResponse() {
    HttpResponse response = new HttpResponse();
    response.setBody("Hello_World", ContentType.text);
    return response;
  }
}
