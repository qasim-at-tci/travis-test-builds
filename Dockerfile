FROM python:3.9
COPY ./requirements.txt .
# RUN pip3 install --upgrade pip
RUN pip3 install -r /app/requirements.txt
