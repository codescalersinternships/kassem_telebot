FROM ubuntu:20.04
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC 
RUN apt-get update
RUN apt-get install -y python3.10

RUN pip3 install --upgrade requests
WORKDIR /kassem_telebot
COPY . . 
RUN apt-get install -y curl openssh-server
RUN pip3 install poetry
RUN poetry install 
ENV API_KEY="5452844886:AAFRHqptu9BdrWAOfALg84FJhsMJffjAJFw"
RUN chmod +x start.sh
CMD ["sh", "./start.sh"]