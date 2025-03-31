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

# アプリケーションコードを追加
COPY . /app

# 必要なポートを公開
EXPOSE 3000

# サーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
