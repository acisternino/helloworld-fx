# helloworld-fx

This directory contains three very simple projects used to investigate a
class visibility problem when compiling JavaFX programs written in Groovy
using Gradle 2.1.

Each project contains either a Java or Groovy version of the official
[JavaFX Hello World][jfxhw] program.

All projects are meant to be used with the Oracle JVM 8.
Current OpenJDK 8 builds (e.g. on Linux) will **not** work because the JavaFX technology
is not distributed with current OpenJDK 8 builds.

## hellofx-groovy ##

This is a Groovy project configured to be built using Ant or eventually
directly from the command line using the `groovyc` compiler.

It shows that using the Groovy compiler either directly or from Ant, the JavaFX
classes are directly available on the compile and runtime classpaths.

To compile and run type:

    $ ant run

## hellofx-java-gradle ##

This is a very simple Gradle Java project.

Even in this case the JavaFX classes are directly available on the compile
and runtime classpaths.

To compile and run type:

    $ gradle build
    $ ./run.sh

## hellofx-groovy-gradle ##

This is the simplest Gradle-Groovy project I could write. It declares only an
explicit compile dependency on the Groovy jar.

I expected this project to compile without problems because it is functionally 100%
equivalent to the Java project above but it did't.

JavaFX classes are not available on the compile classpath and the build terminates with an error:

    :compileGroovy
    startup failed:
    /path/to/hellofx-groovy-gradle/src/main/groovy/helloworld/HelloWorldFx.groovy: 5: unable to resolve class javafx.scene.control.Button
     @ line 5, column 1.
       import javafx.scene.control.Button
       ^

To compile type:

    $ gradle build

## hellofx-libs ##

Libraries needed to run the examples.

[jfxhw]: http://docs.oracle.com/javase/8/javafx/get-started-tutorial/hello_world.htm
