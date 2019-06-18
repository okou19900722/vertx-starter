package ${packageName}

import io.vertx.core.AbstractVerticle
import io.vertx.core.${promiseType}

class MainVerticle : AbstractVerticle() {

  override fun start(start${promiseType}: ${promiseType}<Void>) {
    vertx
      .createHttpServer()
      .requestHandler { req ->
        req.response()
          .putHeader("content-type", "text/plain")
          .end("Hello from Vert.x!")
      }
      .listen(8888) { http ->
        if (http.succeeded()) {
          start${promiseType}.complete()
          println("HTTP server started on port 8888")
        } else {
          start${promiseType}.fail(http.cause());
        }
      }
  }
}
