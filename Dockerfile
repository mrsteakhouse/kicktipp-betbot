FROM python:3.13-slim AS compiler
ENV PYTHONUNBUFFERED 1

WORKDIR /app/

RUN python -m venv /opt/venv
# Enable venv
ENV PATH="/opt/venv/bin:$PATH"

COPY ./requirements.txt /app/requirements.txt
RUN pip install -Ur requirements.txt

FROM python:3.13-slim AS runner
WORKDIR /app/
COPY --from=compiler /opt/venv /opt/venv

# Enable venv
ENV PATH="/opt/venv/bin:$PATH"
COPY . /app/

ENV BETBOT_LOGIN_TOKEN=""
ENV BETBOT_PREDICTOR="CalculationPredictor"
ENV BETBOT_COMMUNITY=""
ENV BETBOT_DRY_RUN=""
ENV BETBOT_OVERRIDE_BETS=""
ENV BETBOT_OPENAI_API_KEY=""

ENTRYPOINT [ "./entrypoint.sh" ]
