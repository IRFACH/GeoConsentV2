#!/data/data/com.termux/files/usr/bin/bash

echo "🚀 Starting GeoConsent..."

cd backend || exit

echo "▶ Starting Flask server..."
python app.py &
FLASK_PID=$!

sleep 2

echo "🌍 Creating public Cloudflare tunnel..."
cloudflared tunnel --url http://localhost:5000

kill $FLASK_PID
