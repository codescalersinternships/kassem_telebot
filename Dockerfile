FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Etc/UTC \
    API_KEY="telegram api key"
RUN apt-get update -y

RUN apt-get install -y python3.10 python3-pip 

WORKDIR /kassem_telebot
COPY . /kassem_telebot

RUN apt-get install -y  openssh-server
RUN pip install pytelegrambotapi

RUN chmod +x /kassem_telebot/start.sh
CMD ["/kassem_telebot/start.sh"]
