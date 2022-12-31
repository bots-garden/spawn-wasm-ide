package example;

import org.extism.sdk.Context;
import org.extism.sdk.manifest.Manifest;
import org.extism.sdk.wasm.WasmSourceResolver;

import java.nio.file.Path;

public class ExtismExample {

    public static void main(String[] args) {

        var wasmPath = args.length > 0 ? args[0] : "src/main/resources/code.wasm";
        var functionName = args.length > 1 ? args[1] : "count_vowels";
        var input = args.length > 2 ? args[2] : "Hello World";

        var wasmSourceResolver = new WasmSourceResolver();
        var manifest = new Manifest(wasmSourceResolver.resolve(Path.of(wasmPath)));

        System.out.printf("Executing \"%s\" from \"%s\" with input \"%s\"%n", functionName, wasmPath, input);

        try (var ctx = new Context()) {
            try (var plugin = ctx.newPlugin(manifest, true)) {
                var output = plugin.call(functionName, input);
                System.out.println(output);
            }
        }
    }
}
