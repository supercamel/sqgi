#!/usr/bin/env python3
"""Create repeatable source/assets only; the GUI must author the manifest."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('destination', type=Path)
args = parser.parse_args()
root = args.destination.resolve()
if root.exists():
    raise SystemExit(f'Refusing to overwrite an existing study project: {root}')
shutil.copytree(Path(__file__).parent / 'fixtures/playground', root)
resources = root / 'resources'
for name in ['icons', 'images/café photo', 'locale', 'po']:
    (resources / name).mkdir(parents=True, exist_ok=True)
icon = resources / 'icons/playground.svg'
icon.write_text('''<svg xmlns="http://www.w3.org/2000/svg" width="128" height="128" viewBox="0 0 128 128">
<rect width="128" height="128" rx="28" fill="#234761"/>
<path d="M24 39 64 19 104 39 104 87 64 109 24 87Z" fill="#ffbf47"/>
<path d="M24 39 64 60 104 39M64 60V109" fill="none" stroke="#234761" stroke-width="7"/>
<path d="M45 29 84 50" stroke="#ffffff" stroke-width="8"/>
</svg>''')
subprocess.run(['convert', str(icon), str(icon.with_suffix('.png'))], check=True)
subprocess.run(['convert', str(icon), '-define', 'icon:auto-resize=64,48,32,16',
                str(icon.with_suffix('.ico'))], check=True)
checker = resources / 'images/checker.svg'
checker.write_text('''<svg xmlns="http://www.w3.org/2000/svg" width="192" height="128">
<rect width="192" height="128" fill="#e8f0f5"/>
<path d="M0 0H64V64H0ZM128 0H192V64H128ZM64 64H128V128H64Z" fill="#187c8f"/>
<circle cx="96" cy="64" r="25" fill="#ffbf47"/></svg>''')
subprocess.run(['convert', str(checker), str(checker.with_suffix('.png'))], check=True)
scene = resources / 'images/café photo/landscape.svg'
scene.write_text('''<svg xmlns="http://www.w3.org/2000/svg" width="320" height="180">
<rect width="320" height="180" fill="#97cbe5"/><circle cx="262" cy="38" r="22" fill="#fff0a1"/>
<path d="M0 145 87 48 160 136 226 67 320 151V180H0Z" fill="#366d61"/>
<path d="M0 158Q130 114 320 167V180H0Z" fill="#214659"/></svg>''')
subprocess.run(['convert', str(scene), '-quality', '92', str(scene.with_suffix('.jpg'))], check=True)
for language, text in [('fr', 'Bonjour du paquet'), ('de', 'Hallo aus dem Paket')]:
    po = resources / 'po' / f'{language}.po'
    po.write_text('msgid ""\nmsgstr ""\n"Content-Type: text/plain; charset=UTF-8\\n"\n'
                  f'"Language: {language}\\n"\n\nmsgid "Hello from the package"\nmsgstr "{text}"\n')
    mo = resources / 'locale' / language / 'LC_MESSAGES/playground.mo'
    mo.parent.mkdir(parents=True, exist_ok=True)
    subprocess.run(['msgfmt', '-o', str(mo), str(po)], check=True)
hashes = {str(p.relative_to(root)): hashlib.sha256(p.read_bytes()).hexdigest()
          for p in sorted(root.rglob('*')) if p.is_file()}
(root / 'fixture-sha256.json').write_text(json.dumps(hashes, indent=2) + '\n')
print(root)
