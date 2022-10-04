FROM python:3.10-slim-bullseye
WORKDIR /kassem_telebot
COPY . .
RUN apt-get update 
RUN apt-get install -y curl openssh-server
RUN chmod +x start.sh
RUN ["sh","./start.sh"]
# RUN curl -sSL https://install.python-poetry.org | python3 -
# ENV PATH="/root/.local/bin:$PATH"
# RUN poetry config virtualenvs.create false
# RUN poetry install --no-dev
RUN pip install -y 
ENV API_KEY="5452844886:AAFRHqptu9BdrWAOfALg84FJhsMJffjAJFw"
RUN chmod +x poetry.sh
CMD ["sh", "./poetry.sh"]