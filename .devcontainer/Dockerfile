# マルチステージビルドを使用して、ビルドステージと実行ステージを分けます
# ビルドステージ
FROM golang:1.17-alpine AS build

# 必要なツールのインストール
RUN apk add --no-cache git

# 作業ディレクトリを設定
WORKDIR /src

# ホストからソースコードをコピー
COPY . .

# 依存関係をダウンロードしてインストール
RUN go mod download

# アプリケーションをビルド
RUN CGO_ENABLED=0 go build -o /app .

# 実行ステージ
FROM alpine:latest

# ランタイム依存関係のインストール
RUN apk add --no-cache ca-certificates

# ビルドステージから実行ファイルをコピー
COPY --from=build /app /app

# アプリケーションを実行
CMD ["/app"]