FROM ubuntu:latest
#WORKDIR /app
RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip3 install apache-airflow
RUN airflow db init

RUN pip3 install pandas

ENV TZ Europe/Moscow

EXPOSE 8080

RUN airflow users create --username admin --firstname Peter --lastname Parker --role Admin --email spiderman@superhero.org --password admin

COPY dags /root/airflow/dags
CMD airflow standalone

