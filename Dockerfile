FROM python:3.10

RUN mkdir -p /app; python3 -m pip install -U -r ./requirements.txt

WORKDIR /app

COPY . .

CMD [ "python3", "bot.py" ]