# Ixtlan Team WildFly Docker image

This is a Dockerfile with [WildFly application server](http://wildfly.org/) modified with Ixtlan Team modules. This docker then serves as a root for building app dockers by Ixtlan Team.

## Building

Build 
 
    docker build --tag=ixtlan-team/wildfly-ix:<TAG> --build-arg ART_USER=username --build-arg ART_PASSWORD=password .
where environment variables are:
    ART_USER - username of the Artifactory user downloading artifacts
    ART_PASSWORD - password of the Artifactory user downloading artifacts
    
Examples

    docker build --tag=ixtlanteam/wildfly-ix:8.2.1.Final-1.3-SNAPSHOT --build-arg ART_USER=miha --build-arg ART_PASSWORD=mihaPass .
    docker build --tag=ixtlanteam/wildfly-ix:10.0.0.Final-1.3-SNAPSHOT --build-arg ART_USER=miha --build-arg ART_PASSWORD=mihaPass .
    docker build --tag=ixtlanteam/wildfly-ix:10.1.0.Final-1.3-SNAPSHOT --build-arg ART_USER=miha --build-arg ART_PASSWORD=mihaPass .

## References

The dockers are published at https://hub.docker.com/u/ixtlanteam
