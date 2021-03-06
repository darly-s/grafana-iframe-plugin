FROM mysql:5.7

RUN apt-get update && apt-get install -y apt-utils wget lsb-release 
RUN wget https://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb
RUN dpkg -i percona-release_0.1-4.$(lsb_release -sc)_all.deb
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y percona-toolkit pmm-client sysbench
COPY ./entry.sh .

ENTRYPOINT ["./entry.sh"]
