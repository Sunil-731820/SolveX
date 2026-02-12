# syntax=docker/dockerfile:1
 
########## Stage 1 — Build the WAR with Maven + Java 17 ##########
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
 
# 1) Copy only build files first to leverage Docker layer caching
COPY pom.xml .
# If you use Maven Wrapper, uncomment the next two lines:
# COPY .mvn/ .mvn/
# COPY mvnw .
 
# Pre-fetch dependencies to speed up subsequent builds
RUN mvn -B -DskipTests dependency:go-offline
 
# 2) Copy sources and build the WAR
COPY src ./src
RUN mvn -B clean package -DskipTests
 
 
########## Stage 2 — Runtime: External Tomcat 10 + JDK 17 ##########
FROM tomcat:10.1-jdk17
 
# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*
 
# Copy the built WAR as ROOT.war so the app runs at '/'
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
 
# Expose Tomcat port (container port stays 8080)
EXPOSE 8081
 
# The base image already starts Tomcat via catalina.sh run
CMD ["catalina.sh", "run"]