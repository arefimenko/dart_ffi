dart run jnigen --config java_jnigen.yaml \
    && dart run jni:setup -p jni -s lib/java \
    && javac java/JavaExample.java