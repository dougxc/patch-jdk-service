#!/bin/bash

rm -rf */bin

mkdir -p service/bin
mkdir -p processor/bin/META-INF/services
mkdir -p impl/bin

echo "processor.ServiceProviderProcessor" > processor/bin/META-INF/services/javax.annotation.processing.Processor

#set -x
$JAVA_HOME/bin/javac -d service/bin $(find service/src -name '*.java')
$JAVA_HOME/bin/javac -d processor/bin $(find processor/src -name '*.java')
$JAVA_HOME/bin/javac -d impl/bin -processorpath processor/bin --class-path service/bin --patch-module=jdk.internal.vm.compiler=service/bin:impl/src $(find impl/src -name '*.java')
