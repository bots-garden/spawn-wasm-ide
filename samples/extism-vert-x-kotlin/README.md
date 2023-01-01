



```bash
curl -G https://start.vertx.io/starter.zip \
-d "groupId=garden.bots" \
-d "artifactId=starter" \
-d "vertxVersion=4.3.7" \
-d "vertxDependencies=vertx-web" \
-d "language=kotlin" \
-d "jdkVersion=17" \
-d "buildTool=maven" \
--output starter.zip

unzip starter.zip
```
