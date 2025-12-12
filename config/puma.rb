# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Default is 5 threads for both.
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# In development, allow workers more time before timeout.
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Port Puma will listen on.
port ENV.fetch("PORT") { 3000 }

# ★★ Docker で Rails を外部公開するための必須設定！！ ★★
# これがないとホストPCから localhost:3000 にアクセスできず ERR_EMPTY_RESPONSE になる
bind "tcp://0.0.0.0:3000"

# Environment Puma should run in.
environment ENV.fetch("RAILS_ENV") { "development" }

# PID file location.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# (Optional) Worker processes for clustered mode.
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use preload_app! when using workers for Copy On Write memory savings.
# preload_app!

# Allow puma to be restarted by `bin/rails restart`.
plugin :tmp_restart
