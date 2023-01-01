package garden.bots.starter

import io.vertx.core.AbstractVerticle
import io.vertx.core.Promise

import org.extism.sdk.Context
import org.extism.sdk.manifest.Manifest
import org.extism.sdk.wasm.WasmSourceResolver
import java.nio.file.Path
import kotlin.system.exitProcess


class MainVerticle : AbstractVerticle() {

  
  override fun start(startPromise: Promise<Void>) {

    val getPlugin = {
      try {
        val resolver = WasmSourceResolver()
        val manifest = Manifest(resolver.resolve(Path.of("./hello-world/hello-world.wasm")))
        val ctx = Context() 
        ctx.newPlugin(manifest, true)
      } catch(e: Exception) {
        exitProcess(0)
      }
    }

    val plugin = getPlugin()

    vertx
      .createHttpServer()
      .requestHandler { req ->

        try {
          val output = plugin.call("helloWorld", "Bob Morane");
          req.response()
          .putHeader("content-type", "text/plain; charset=utf-8")
          .end(output)

        } catch(exception: Exception) {
          req.response()
          .putHeader("content-type", "text/plain; charset=utf-8")
          .end("Ouch 😡")
        }

      }
      .listen(8888) { http ->
        if (http.succeeded()) {
          startPromise.complete()
          println("HTTP server started on port 8888")
        } else {
          startPromise.fail(http.cause());
        }
      }
  }
}
