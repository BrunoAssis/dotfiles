if [[ "$PLATFORM" == "Darwin" ]]
then
  export M2_HOME="/usr/local/Cellar/maven/3.3.3/libexec"
  export M2="$M2_HOME/bin"
  export PATH="$PATH:$M2"
  export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
else
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
fi

export PATH="$PATH:$JAVA_HOME/bin"
