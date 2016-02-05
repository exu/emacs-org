FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install emacs

ADD /org /org


RUN mkdir -p /emacs-libs
ADD /ditaa.jar /emacs-libs/ditaa.jar
ADD /plantuml.jar /emacs-libs/plantuml.jar

RUN mkdir -p /root/.emacs.d
ADD /init.el /root/.emacs.d/init.el

WORKDIR /org

CMD emacs
