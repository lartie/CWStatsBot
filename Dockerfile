FROM elixir:1.5.0

ENV DEBIAN_FRONTEND=noninteractive

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mkdir /app
ADD . /app
WORKDIR /app

CMD ["iex", "-S", "mix"]