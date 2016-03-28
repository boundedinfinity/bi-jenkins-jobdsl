FROM boundedinfinity/jenkins-cli:1.0.0
MAINTAINER brad.babb@boundedinfinity.com

RUN apt-get update
RUN apt-get install -y git

ENV GIT_DIR=/git
ENV SRC_DIR=/src
ENV GIT_BRANCH=job-dsl-1.44
ENV GIT_URL=https://github.com/jenkinsci/job-dsl-plugin.git
ENV DSL_JAR=$GIT_DIR/job-dsl-core/build/libs/job-dsl-core-1.44-standalone.jar

RUN mkdir -p $GIT_DIR $SRC_DIR
RUN git clone --branch $GIT_BRANCH $GIT_URL $GIT_DIR
RUN cd $GIT_DIR && ./gradlew :job-dsl-core:oneJar -x test

COPY . $SRC_DIR
COPY ./bin/* /usr/local/bin
WORKDIR $SRC_DIR
