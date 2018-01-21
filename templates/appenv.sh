#!/bin/sh

# App Specific OPTS
export CATALINA_OPTS="$CATALINA_OPTS \
                  -Dfile.encoding=UTF-8 \
                  -Djava.awt.headless=true \
                  -server \
                  -Djava.endorsed.dirs={{ tomcat_catalina_base }}/lib \
                  -XX:+HeapDumpOnOutOfMemoryError \
                  -XX:HeapDumpPath={{ tomcat_path }}/memdump/dump_{{ proj_name }}.hprof"
