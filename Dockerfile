# Use latest jboss/base-jdk:8 image as the base
FROM ixtlanteam/wildfly-no-modules:8.2.1.Final
ARG ART_USER
ARG ART_PASSWORD

# Set the WILDFLY_VERSION env variable
ENV IX_WF_VERSION 8
ENV IXF_VERSION 1.3-SNAPSHOT
#ENV IXF_MODULES_SHA1 8a46e9523aea5cb27c176869e9d12df0d16ab176
ENV JBOSS_HOME /opt/jboss/wildfly

# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
# Make sure the distribution is available from a well-known place
RUN cd $HOME \
    && curl -O -u ${ART_USER}:${ART_PASSWORD} -k https://netom.ixtlan-team.si/artifactory/libs-snapshot-local/com/ixtlanteam/core/IxModules/$IXF_VERSION/IxModules-$IXF_VERSION-wildfly$IX_WF_VERSION.zip \  
#    && sha1sum IxModules-$IXF_VERSION-wildfly$IX_WF_VERSION.zip | grep $IXF_MODULES_SHA1 \
    && cd $JBOSS_HOME/modules/ \
    && unzip $HOME/IxModules-$IXF_VERSION-wildfly$IX_WF_VERSION.zip \
    && rm $HOME/IxModules-$IXF_VERSION-wildfly$IX_WF_VERSION.zip

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true

# Expose the ports we're interested in
EXPOSE 8080

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
