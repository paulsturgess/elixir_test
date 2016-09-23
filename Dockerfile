FROM ubuntu:16.04

ENV LANGUAGE=en_GB.UTF-8
ENV LANG=en_GB.UTF-8
ENV LC_ALL=en_GB.UTF-8
RUN locale-gen en_GB.UTF-8 \
  && dpkg-reconfigure -f noninteractive locales

RUN apt-get update
RUN apt-get install -y --no-install-recommends wget
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb --no-check-certificate
RUN dpkg -i erlang-solutions_1.0_all.deb

RUN apt-get update
RUN apt-get install -y --no-install-recommends esl-erlang
RUN apt-get install -y --no-install-recommends elixir
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
