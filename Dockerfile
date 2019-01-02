FROM openjdk:8-jre-alpine

ENV VERSION 2.8.1

RUN mkdir /allure
RUN mkdir /allure-results
RUN mkdir /allure-report
RUN mkdir /allure-config

RUN wget http://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/$VERSION/allure-commandline-$VERSION.tgz
RUN tar -zxf allure-commandline-$VERSION.tgz
RUN mv ./allure-$VERSION/* /allure/
RUN rm allure-commandline-$VERSION.tgz
ENV PATH="/allure/bin:${PATH}"
ENV ALLURE_CONFIG="/allure-config/allure.properties"

ENTRYPOINT ["/allure/bin/allure"]

