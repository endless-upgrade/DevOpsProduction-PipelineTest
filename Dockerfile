FROM centos:centos7.4.1708
USER root
WORKDIR /opt/
RUN ["yum", "update", "-y"]
RUN ["yum", "install", "wget", "-y"]
RUN ["yum", "install", "curl", "-y"]
RUN ["yum", "install", "java-1.8.0-openjdk", "-y"]
RUN ["wget", "http://dl.bintray.com/sbt/rpm/sbt-0.13.12.rpm"]
RUN ["yum", "install", "sbt-0.13.12.rpm", "-y"]
RUN ["yum", "install", "-y", "yum-utils", "device-mapper-persistent-data", "lvm2"]
RUN ["wget", "http://it.apache.contactlab.it/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz"]
RUN ["tar", "xvf", "spark-2.2.0-bin-hadoop2.7.tgz" ]
ENV SPARK_USER="root"
ENV SPARK_HOME="/opt/spark-2.2.0-bin-hadoop2.7"
ENV PATH="$PATH:$SPARK_HOME/bin"
WORKDIR /root
CMD ["/bin/bash"]
