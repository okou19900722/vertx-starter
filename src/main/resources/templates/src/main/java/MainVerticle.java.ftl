package ${packageName};

import io.vertx.core.AbstractVerticle;
import io.vertx.core.<#if vertxVersion=='4.0.0-SNAPSHOT'>Promise<#else>Future</#if>;

public class MainVerticle extends AbstractVerticle {

  @Override
  public void start(<#if vertxVersion=='4.0.0-SNAPSHOT'>Promise<#else>Future</#if><Void> start<#if vertxVersion=='4.0.0-SNAPSHOT'>Promise<#else>Future</#if>) throws Exception {
    vertx.createHttpServer().requestHandler(req -> {
      req.response()
        .putHeader("content-type", "text/plain")
        .end("Hello from Vert.x!");
    }).listen(8888, http -> {
      if (http.succeeded()) {
        start<#if vertxVersion=='4.0.0-SNAPSHOT'>Promise<#else>Future</#if>.complete();
        System.out.println("HTTP server started on port 8888");
      } else {
        start<#if vertxVersion=='4.0.0-SNAPSHOT'>Promise<#else>Future</#if>.fail(http.cause());
      }
    });
  }
}
