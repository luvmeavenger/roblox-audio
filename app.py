from flask import Flask, jsonify, request
import yt_dlp, subprocess, base64

app = Flask(__name__)

@app.route('/process')
def process():
    url = request.args.get('url')
    if not url: return jsonify({'error': 'No URL'}), 400
    ydl_opts = {'format': 'bestaudio/fastest', 'quiet': True}
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        info = ydl.extract_info(url, download=False)
        cmd = ['ffmpeg', '-i', info['url'], '-f', 's16le', '-ac', '1', '-ar', '22050', '-loglevel', 'quiet', 'pipe:1']
        data = base64.b64encode(subprocess.check_output(cmd)).decode('utf-8')
        return jsonify({'data': data, 'title': info.get('title')})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
