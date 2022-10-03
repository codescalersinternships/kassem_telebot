FROM ubuntu:20.04
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python3 
RUN apt install -y python3-pip 
WORKDIR /kassem_telebot
COPY . .
RUN apt-get install -y curl openssh-server
RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev
ENV API_KEY="5452844886:AAFRHqptu9BdrWAOfALg84FJhsMJffjAJFw"
RUN chmod +x start.sh
CMD ["sh", "./start.sh"]