#! /bin/sh

export CATALINA_OPTS=""

export CATALINA_OPTS="$CATALINA_OPTS -Xms256m"
export CATALINA_OPTS="$CATALINA_OPTS -Xmx1024m"

umask 0022

# Check for application specific parameters at startup
if [ -r "$CATALINA_BASE/bin/appenv.sh" ]; then
  # shellcheck source=somewhere/appenv.sh
  . "$CATALINA_BASE/bin/appenv.sh"
fi

echo "Using CATALINA_OPTS:"
for arg in $CATALINA_OPTS
do
    echo ">> " $arg
done
echo ""

echo "Using JAVA_OPTS:"
for arg in $JAVA_OPTS
do
    echo ">> " $arg
done
echo "_______________________________________________"
echo ""
