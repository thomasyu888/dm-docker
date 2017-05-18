FROM ubuntu

RUN apt-get update
RUN apt-get -y install r-base
RUN apt-get -y install aptitude libcurl4-openssl-dev  libxml2-dev libxml2-dev

COPY age_baseline_sc2.R /age_baseline_sc2.R
COPY sc2_infer.sh /sc2_infer.sh