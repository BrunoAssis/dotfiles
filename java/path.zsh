if [[ "$PLATFORM" == "Darwin" ]]
then
  export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
else
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
fi

export PATH="$PATH:$JAVA_HOME/bin"
