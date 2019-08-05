## Purpose
This contains a small example of an attempt to build sources for an existing
module in the JDK (`jdk.internal.vm.compiler`) where the [build process](run.sh) involves
running an [processor](processor/src/processor/ServiceProviderProcessor.java) for an
annotation (`org.graalvm.compiler.serviceprovider.ServiceProvider`)
that is defined both on the class path as well as in `jdk.internal.vm.compiler`.
I want only the class path instance to be found by the annotation processor.
Currently, it appears to find both copies:
```
> ./run.sh
TypeElement for org.graalvm.compiler.serviceprovider.ServiceProvider is null
Note: Multiple elements named 'org.graalvm.compiler.serviceprovider.ServiceProvider' in modules 'jdk.internal.vm.compiler, unnamed module' were found by javax.lang.model.util.Elements.getTypeElement.
```

My thought was that `--patch-module=jdk.internal.vm.compiler=service/bin:impl/src` would result in
`ServiceProvider.class` under `service/bin` overriding `ServiceProvider.class` from
`jdk.internal.vm.compiler`.

## Reproducing
```
export JAVA_HOME=/path/to/jdk11
git clone https://github.com/dougxc/patch-jdk-service.git
cd patch-jdk-service
./run.sh
```