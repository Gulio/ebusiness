FROM ubuntu:20.04
WORKDIR /app
RUN apt-get -y update && apt-get -y install curl wget apt-transport-https gnupg
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb focal main" | tee /etc/apt/sources.list.d/adoptopenjdk.list && apt-get -y update && apt-get -y install adoptopenjdk-8-hotspot
RUN mkdir scala && cd scala && wget https://downloads.lightbend.com/scala/2.12.14/scala-2.12.14.deb && apt -y install ./scala-2.12.14.deb
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list && echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list && curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add && apt-get -y update && apt-get -y install sbt
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs
VOLUME [ "/data" ]
EXPOSE 80 3000 9000
