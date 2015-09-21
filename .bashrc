#--------------------------------------------------------------------------------#
# .bashrc
#--------------------------------------------------------------------------------#
# @author  | Artem
# @email   | artem.teleshev@gmail.com
# @site    | http://phpsw.net
# @version | 1.0.0
#--------------------------------------------------------------------------------#

#===============================================================================================
DIR="$(dirname ${BASH_SOURCE[0]})"

# [U]ser [L]ocal [LIB]rary [HOME] directory
export UL_LIB_HOME="/usr/local/lib"

# [L]inker [D]ynamic (https://en.wikipedia.org/wiki/Environment_variable)
export LD_LIBRARY_PATH="${UL_LIB_HOME}:/usr/lib:/lib"

# Locales configuration
# > sudo dpkg-reconfigure locales
# ---
# Use "en_US.UTF-8" as default
# ---
# Generating locales (this might take a while)...
#  en_US.UTF-8... done
#  ru_RU.UTF-8... done
#  ru_UA.UTF-8... done
#  uk_UA.UTF-8... done
# Generation complete.

# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
# Language
export LANGUAGE="en_US:en"

# Default editor
export EDITOR=vim;
# Default pager
export PAGER=less;
# Title for terminal (Gnome3) 
export PROMPT_COMMAND='echo -ne "\033]0;$(hostname) | $(basename ${PWD})\007"' 

WORKSPACE_DIR="${HOME}"
WORKSPACE_NAME="workspace"

if [ $UID == 0 ] ; then # Root
  PATH="/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin"
  PS1="\[\033[01;44m\] \A \[\033[00m\] [\u@\h] \[\033[01;36m\]\w\[\033[00m\] # "
  MYSQL_PS1="[\R:\m] \d # "
  if [ "${SUDO_USER}" != "" ] ; then
    WORKSPACE_DIR="$(getent passwd ${SUDO_USER} | cut -d: -f6)"
  fi
else
  PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
  PS1="\[\033[01;44m\] \A \[\033[00m\] [\u@\h] \[\033[01;36m\]\W\[\033[00m\] > "
  MYSQL_PS1="[\R:\m] \d > "
fi

export WORKSPACE=$(realpath "${WORKSPACE_DIR}/${WORKSPACE_NAME}")

# PS1
# \w - full path to current directory
# \W - current directory
# \u - user name
# \h - host name
# \A - time in format H:i (23:59)
export PS1

# PS1 for console MySQL client
export MYSQL_PS1

#=== XDebug ============================================================================ {{{ ===

#export XDEBUG_CONFIG="idekey=xdebug"

#=== XDebug ============================================================================ }}} ===

#=== GOLang ============================================================================ {{{ ===

#export GOROOT=$UL_LIB_HOME/go
# set PATH so it includes GO bin if it exists
#if [ -d "$GOROOT/bin" ] ; then
#  PATH=$GOROOT/bin:$PATH
#fi

if [ -d "${WORKSPACE}/go" ] ; then
  export GOPATH="${WORKSPACE}/go"

  if [ -d "${GOPATH}/bin" ] ; then
    export GOBIN="${GOPATH}/bin"
    PATH="${GOBIN}:${PATH}"
  fi
fi
#=== GOLang ============================================================================ }}} ===

#=== Java ============================================================================== {{{ ===

# --- JVM (JDK/JRE) ---
JDK_HOME="${UL_LIB_HOME}/jdk"
JDK_CLASSPATH="${JDK_HOME}/lib"
JRE_HOME="${UL_LIB_HOME}/jre"
JRE_CLASSPATH="${JRE_HOME}/lib"
CLASSPATH="."

# --- set PATH so it includes [J]ava [R]untime [E]nvironment bin if it exists ---
if [ -d "${JRE_HOME}" ] ; then
  JAVA_HOME="${JRE_HOME}"
  PLUGINS_HOME="${JRE_HOME}/plugin"
  CLASSPATH="${JRE_CLASSPATH}:${CLASSPATH}"
fi

# --- set PATH so it includes [J]ava [D]evelopment [K]it bin if it exists ---
if [ -d "${JDK_HOME}" ] ; then
  JAVA_HOME="${JDK_HOME}"
  CLASSPATH="${JDK_CLASSPATH}:${CLASSPATH}"
fi

# --- set PATH so it includes [J]ava [V]irtual [M]ashine bin if it exists ---
if [ -d "${JAVA_HOME}/bin" ] ; then
  PATH="${JAVA_HOME}/bin:${PATH}"
fi

export JDK_HOME
export JDK_CLASSPATH
export JRE_HOME
export JRE_CLASSPATH
export CLASSPATH
#=== Java ============================================================================== }}} ===

#=== Flex ============================================================================== {{{ ===
export FLEX_HOME="${UL_LIB_HOME}/flex"

# set PATH so it includes Adobe FLEX bin if it exists
if [ -d "${FLEX_HOME}/bin" ] ; then
  PATH="${FLEX_HOME}/bin:${PATH}"
fi
#=== Flex ============================================================================== }}} ===

#=== Path ============================================================================== {{{ ===

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

#PATH="./bin:$PATH"

export PATH

#=== Path ============================================================================== }}} ===

#=== Bash Aliases ====================================================================== {{{ ===

# include .bash_aliases
if [ -f "${DIR}/.bash_aliases" ]; then
  . "${DIR}/.bash_aliases"
fi

#=== Bash Aliases ====================================================================== }}} ===

