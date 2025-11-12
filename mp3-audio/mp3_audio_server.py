import requests
import requests_unixsocket
import os
import subprocess
import time
import signal
import random

requests_unixsocket.monkeypatch()

root_path_file     = "/tmp/mp3-audio.path"
current_track_file = "/tmp/mp3-audio.track"
control_file       = "/tmp/mp3-audio.ctl"

def get_tracks():
    try:
        r = requests.get("http+unix://%2Ftmp%2Fmp3-audio.sock")
        matches = r.json().get("matches")
        return [item["text"] for item in matches if item["text"].endswith("mp3")]
    finally:
        pass
    return []

def get_current_track():
    if os.path.exists(current_track_file):
        with open(current_track_file) as f:
            return f.read().strip() 
    else:
        return ""

def get_control_status():
    if os.path.exists(control_file):
        with open(control_file) as f:
            if f.read().strip() == "0":
                return False
            else:
                return True
    else:
        return True

def get_proc(file):
    path = "."
    with open(root_path_file) as f:
        path = f.read().strip()
    return subprocess.Popen(["ffplay", "-nodisp", "-autoexit", f"{path}/{file}"])

try:
    current = ""
    proc = None 
    if os.path.exists(current_track_file):
        os.remove(current_track_file)

    while True:
        if proc:
            proc.poll()
            if proc.returncode == 0:
                if len(all_tracks) > 0:
                    proc = get_proc(random.choice(all_tracks))
            if get_control_status():
                os.kill(proc.pid, signal.SIGCONT)
            else:
                os.kill(proc.pid, signal.SIGSTOP)
        new = get_current_track()
        if current != new:
            all_tracks = get_tracks()
            current = new
            if proc:
                proc.terminate()
            proc = get_proc(current)
            time.sleep(0.5)
finally:
    proc.terminate()
