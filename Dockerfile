FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Etc/UTC \
    API_KEY="telegram api key"
RUN apt-get update -y
RUN apt-get install -y wget python3.10 python3-pip 
RUN wget https://github.com/threefoldtech/zinit/releases/download/v0.2.10/zinit -O /sbin/zinit &&\
	chmod +x /sbin/zinit


WORKDIR /kassem_telebot
COPY . /kassem_telebot
ADD rootfs /
RUN apt-get install -y  openssh-server
RUN pip install pytelegrambotapi


CMD ["/sbin/zinit", "init", "--container"]
