FROM node:22

ARG APP_PRIVATE_KEY
ARG DISCORD_BOT_TOKEN
ARG DISCORD_ID
ARG DISCORD_OAUTH2
ARG DISCORD_PUB_KEY
ARG GITHUB_ADMIN_TOKEN
ARG GITHUB_APP_CLIENT_ID
ARG GITHUB_APP_SECRET
ARG GITHUB_SPONSOR_WEBHOOK_SECRET
ARG GITHUB_TOKEN
ARG IS_TAMAGUI_DEV
ARG NEXT_PUBLIC_GITHUB_APP_ID
ARG NEXT_PUBLIC_GITHUB_AUTH_CLIENT_ID
ARG NEXT_PUBLIC_IS_TAMAGUI_DEV
ARG NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY
ARG NEXT_PUBLIC_SUPABASE_ANON_KEY
ARG NEXT_PUBLIC_SUPABASE_URL
ARG POSTMARK_SERVER_TOKEN
ARG STRIPE_SECRET_KEY
ARG STRIPE_SIGNING_SIGNATURE_SECRETa833
ARG STUDIO_JWT_SECRET
ARG SUPABASE_SERVICE_ROLE_KEY
ARG TAKEOUT_RENEWAL_COUPON_ID
ARG TRANSCRYPT_PASSWORD
ARG SHOULD_UNLOCK_GIT_CRYPT

# unlock
RUN apt-get update && apt-get install -y git bsdmainutils

WORKDIR /app
COPY . .

# init git
RUN git config --global user.email "you@example.com" && git init . && git add -A && git commit -m 'add'

# unlock
RUN ./scripts/transcrypt.sh -p "$TRANSCRYPT_PASSWORD"

RUN corepack enable
RUN corepack prepare yarn@4.1.0 --activate

RUN yarn install
RUN yarn build:js
RUN yarn x:build

EXPOSE 3000

CMD ["yarn", "x:serve"]
