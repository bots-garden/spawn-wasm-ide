package garden.bots.starter

import io.vertx.core.AbstractVerticle
import io.vertx.core.Promise

import org.extism.sdk.Context
import org.extism.sdk.manifest.Manifest
import org.extism.sdk.wasm.WasmSourceResolver
import java.nio.file.Path
import kotlin.system.exitProcess
import kotlin.io.println


class MainVerticle : AbstractVerticle() {

  override fun start(startPromise: Promise<Void>) {

    val initializePlugIn = { path: String  ->
      runCatching { 
        val resolver = WasmSourceResolver()
        val manifest = Manifest(resolver.resolve(Path.of(path)))
        val ctx = Context() 
        ctx.newPlugin(manifest, true)
      }
    }

    initializePlugIn("./hello-world/hello-world.wasm")
      .onFailure { exitProcess(0) }
      .onSuccess {
        vertx
        .createHttpServer()
        .requestHandler { req -> 
          runCatching { 
            val output = it.call("helloWorld", "Bob Morane")
            req.response()
            .setStatusCode(200)
            .putHeader("content-type", "text/plain; charset=utf-8")
            .end(output)

          }.recoverCatching { 
            req.response()
            .setStatusCode(500)
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
}
