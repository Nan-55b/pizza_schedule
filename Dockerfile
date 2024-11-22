# ベースイメージを指定
FROM ruby:3.1.4

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client

# アプリケーションディレクトリを作成
WORKDIR /app

# Bundlerのインストール
RUN gem install bundler

# アプリケーションコードを追加する準備
COPY Gemfile* /app/

# Gemfileをインストール
RUN bundle install
