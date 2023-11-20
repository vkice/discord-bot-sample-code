FROM python:3.11

RUN mkdir -p /app

WORKDIR /app

COPY . .

RUN  python3 -m venv env; ./env/bin/activate; python3 -m pip install -U -r /app/requirements.txt

CMD [ "python3", "bot.py" ]