FROM anapsix/alpine-java 
COPY ./target/spring-petclinic-2.5.0-SNAPSHOT.jar app.jar
CMD ["java","-jar","app.jar"]