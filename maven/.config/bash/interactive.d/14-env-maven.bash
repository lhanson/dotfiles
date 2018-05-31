################################################################################
# env-maven.bash - settings for Maven
################################################################################

export M2_HOME=${XDG_CONFIG_HOME}/maven
alias mvn="mvn --settings ${M2_HOME}/settings.xml -Dsettings.security=${M2_HOME}/settings-security.xml"
