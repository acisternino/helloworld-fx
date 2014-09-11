#!/bin/sh

groovy_jar=../../../hellofx-libs/groovy-all-2.3.6.jar

cd ./build/libs
java -cp hellofx-groovy-gradle.jar:${groovy_jar} helloworld.HelloWorldFx
