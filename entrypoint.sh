#!/usr/bin/env sh

if [ "$BETBOT_LOGIN_TOKEN" = "" ]; then
  printf "BETBOT_LOGIN_TOKEN is not set.\nGet a login token by executing the image with docker run --rm -it image:tag python kicktippbb.py --get-login-token\n"
  exit 1
fi

if [ "$BETBOT_DRY_RUN" != "" ]; then
  BETBOT_DRY_RUN="--dry-run"
fi

if [ "$BETBOT_OVERRIDE_BETS" != "" ]; then
  BETBOT_OVERRIDE_BETS="--override-bets"
fi

if [ "$BETBOT_COMMUNITY" = "" ]; then
  printf "BETBOT_COMMUNITY is not set. No community given.\n"
fi

python kicktippbb.py --use-login-token "$BETBOT_LOGIN_TOKEN" "$BETBOT_DRY_RUN" "$BETBOT_OVERRIDE_BETS" --predictor "$BETBOT_PREDICTOR" "$BETBOT_COMMUNITY"