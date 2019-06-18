package ${packageName};

import io.vertx.core.AbstractVerticle;
import io.vertx.core.${promiseType};

public class MainVerticle extends AbstractVerticle {

  @Override
  public void start(${promiseType}<Void> start${promiseType}) throws Exception {
    vertx.createHttpServer().requestHandler(req -> {
      req.response()
        .putHeader("content-type", "text/plain")
        .end("Hello from Vert.x!");
    }).listen(8888, http -> {
      if (http.succeeded()) {
        start${promiseType}.complete();
        System.out.println("HTTP server started on port 8888");
      } else {
        start${promiseType}.fail(http.cause());
      }
    });
  }
}
