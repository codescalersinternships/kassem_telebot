FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Etc/UTC \
    API_KEY="5452844886:AAFRHqptu9BdrWAOfALg84FJhsMJffjAJFw"
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python3.10 python3-pip 

WORKDIR /kassem_telebot
COPY . .

RUN apt-get install -y  openssh-server
RUN pip install pytelegrambotapi

RUN chmod +x start.sh
CMD ["sh", "./start.sh"]