FROM python:3.12

RUN apt update && apt install -y curl nginx

# django
COPY ./django-server /app
COPY ./requirements.txt /app/requirements.txt
COPY ./run.sh /app/run.sh

# nginx
COPY ./nginx-server/default.conf /etc/nginx/conf.d/default.conf

WORKDIR /app
RUN pip install -r requirements.txt

RUN chmod +x run.sh
CMD [ "./run.sh" ]