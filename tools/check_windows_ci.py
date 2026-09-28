#!/usr/bin/env python3
"""Require native Windows CI for the exact commit before pushing master."""
import argparse
import json
import re
import subprocess
import sys
import urllib.parse
import urllib.request


def successful_run(data, sha):
    runs = [r for r in data['workflow_runs'] if r['head_sha'] == sha]
    if not runs:
        raise RuntimeError(f'No native Windows CI run for {sha[:12]}; push a candidate branch first')
    latest = max(runs, key=lambda r: (r['id'], r.get('run_attempt', 1)))
    if latest['status'] != 'completed' or latest['conclusion'] != 'success':
        raise RuntimeError(f"Windows CI is {latest['status']}/{latest['conclusion']}: {latest['html_url']}")
    return latest['html_url']


def check(repository, sha):
    if not re.fullmatch(r'[0-9a-f]{40}', sha):
        raise ValueError('Expected a full commit SHA')
    if not re.fullmatch(r'[\w.-]+/[\w.-]+', repository):
        raise ValueError('Expected GitHub owner/repository')
    query = urllib.parse.urlencode({'head_sha': sha, 'per_page': 100})
    url = (f'https://api.github.com/repos/{repository}/actions/workflows/'
           f'windows-packaging.yml/runs?{query}')
    request = urllib.request.Request(url, headers={'Accept': 'application/vnd.github+json',
                                                  'User-Agent': 'sqgi-windows-ci-guard'})
    with urllib.request.urlopen(request, timeout=20) as response:
        run = successful_run(json.load(response), sha)
    print(f'Native Windows CI passed for {sha[:12]}: {run}')


def pre_push(remote_url, lines):
    for line in lines:
        local_ref, sha, remote_ref, remote_sha = line.split()
        if remote_ref != 'refs/heads/master' or sha == '0' * 40:
            continue
        match = re.fullmatch(r'(?:git@github\.com:|https://github\.com/|ssh://git@github\.com/)([\w.-]+/[\w.-]+?)(?:\.git)?/?', remote_url)
        if not match:
            raise ValueError('Cannot verify native Windows CI for this master push destination')
        check(match[1], sha)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--pre-push', nargs=2, metavar=('REMOTE', 'URL'))
    parser.add_argument('--repository', default='supercamel/sqgi')
    parser.add_argument('commit', nargs='?', default='HEAD')
    args = parser.parse_args()
    try:
        if args.pre_push:
            pre_push(args.pre_push[1], sys.stdin)
        else:
            sha = subprocess.check_output(['git', 'rev-parse', '--verify', args.commit + '^{commit}'], text=True).strip()
            check(args.repository, sha)
    except Exception as error:
        print(f'Windows CI guard: {error}', file=sys.stderr)
        return 1
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
