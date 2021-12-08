# Rails.application.config.session_store :redis_store, expire_after: 90.minutes, servers: {
#   host: "rails-elasticache-cluster.l1kopu.0001.use1.cache.amazonaws.com",
#   port: 6379,
#   #password: 'password', 今回は使わない
#   db: 0,
#   namespace: "session",
#   signed: true, # 署名、暗号化されたcookieを使用する
#   # secure: true # HTTPS 接続でサーバーからクライアントにcookieが転送されるようにする
# }

SampleApp::Application.config.session_store :redis_store,
  servers: ["redis://rails-elasticache-cluster.l1kopu.0001.use1.cache.amazonaws.com:6379/0/session"],
  expire_after: 90.minutes,
  key: "_#{Rails.application.class.parent_name.downcase}_session",
  threadsafe: true,
  signed: true
  # secure: true