package garden.bots.starter;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Promise;
import io.vertx.core.http.HttpMethod;
import io.vertx.core.http.HttpServer;
import io.vertx.ext.web.Route;
import io.vertx.ext.web.Router;

import org.extism.sdk.Context;
import org.extism.sdk.manifest.Manifest;
import org.extism.sdk.wasm.WasmSourceResolver;

import java.nio.file.Path;

public class MainVerticle extends AbstractVerticle {

  @Override
  public void start(Promise<Void> startPromise) throws Exception {

    var resolver = new WasmSourceResolver();
    var wasmFilePath = System.getenv("WASM_FILE");
    var manifest = new Manifest(resolver.resolve(Path.of(wasmFilePath)));

    HttpServer server = vertx.createHttpServer();

    Router router = Router.router(vertx);
    Route route = router.route().method(HttpMethod.POST);

    route.handler(ctx -> {

      // This handler will be called for any POST request
      ctx.request().body().andThen(asyncRes -> {
        var name = asyncRes.result().toString();

        try (var extismCtx = new Context(); var plugin = extismCtx.newPlugin(manifest, true))
        {
          var output = plugin.call(System.getenv("FUNCTION_NAME"), name);
          
          ctx.response()
          .putHeader("content-type", "application/json; charset=utf-8")
          .end(output);
  
        }
        catch (Exception e) {
          ctx.response()
          .putHeader("content-type", "application/json; charset=utf-8")
          .end(e.getMessage());
        } 

      });

    });

    var httpPort = System.getenv("HTTP_PORT");

    server.requestHandler(router).listen(Integer.parseInt(httpPort), http -> {
      if (http.succeeded()) {
        startPromise.complete();
        System.out.println("HTTP server started on port " + httpPort);
      } else {
        startPromise.fail(http.cause());
      }
    });
    

    // curl -X POST -d 'Bob Morane' http://localhost:8888

  }
}
