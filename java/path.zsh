if [[ "$PLATFORM" == "Darwin" ]]
then
  export JAVA_HOME="/usr"
else
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
fi

export PATH="$PATH:$JAVA_HOME/bin"
