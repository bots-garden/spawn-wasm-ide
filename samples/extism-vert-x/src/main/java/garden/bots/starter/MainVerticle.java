package garden.bots.starter;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Promise;

import org.extism.sdk.Context;
import org.extism.sdk.manifest.Manifest;
import org.extism.sdk.wasm.WasmSourceResolver;

import java.nio.file.Path;

public class MainVerticle extends AbstractVerticle {

  @Override
  public void start(Promise<Void> startPromise) throws Exception {

    var resolver = new WasmSourceResolver();
    var manifest = new Manifest(resolver.resolve(Path.of("./hello-world/hello-world.wasm")));

    vertx.createHttpServer().requestHandler(req -> {

      try (var ctx = new Context(); var plugin = ctx.newPlugin(manifest, true))
      {
        var output = plugin.call("helloWorld", "Bob Morane");

        req.response()
        .putHeader("content-type", "text/plain; charset=utf-8")
        .end(output);

      }

    }).listen(8888, http -> {
      if (http.succeeded()) {
        startPromise.complete();
        System.out.println("HTTP server started on port 8888");
      } else {
        startPromise.fail(http.cause());
      }
    });


  }
}
