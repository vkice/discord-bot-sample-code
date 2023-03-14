FROM python:3.10

RUN mkdir -p /app; python3 -m pip install -U "py-cord[speed]" "python-dotenv"

WORKDIR /app

COPY . .

CMD [ "python3", "bot.py" ]