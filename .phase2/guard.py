#!/usr/bin/env python3
import json, sys
from pathlib import Path
CFG=json.loads(Path(__file__).with_name('projects.json').read_text())

def check(project, provider=None, team_id=None, repo=None):
    p=CFG['projects'].get(project)
    if not p: return False, f'UNKNOWN_PROJECT:{project}'
    if project=='cognitive-ecology':
        if team_id in p['guards']['forbidden_team_ids']:
            return False, 'BLOCKED:Cognitive Ecology cannot deploy to Stratum team'
        expected=f"{p['source']['github']['owner']}/{p['source']['github']['repo']}"
        if repo and repo!=expected:
            return False, f'BLOCKED:repo mismatch expected={expected} actual={repo}'
    return True, 'TARGET_OK'

if __name__=='__main__':
    args=dict(x.split('=',1) for x in sys.argv[1:] if '=' in x)
    ok,msg=check(args.get('project',''),args.get('provider'),args.get('team_id'),args.get('repo'))
    print(msg)
    raise SystemExit(0 if ok else 2)
