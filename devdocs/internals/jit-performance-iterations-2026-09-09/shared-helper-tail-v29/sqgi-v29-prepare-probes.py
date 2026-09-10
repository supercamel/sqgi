from pathlib import Path
import shutil
for name in ['emission-tier-probe','budget-preservation']:
 P=Path('/tmp/sqgi-v29-'+name);P.mkdir(exist_ok=True)
 s=Path('/tmp/sqgi-v28-'+name+'/capture.gdb').read_text().replace('/tmp/sqgi-v28-'+name,str(P))
 if name=='budget-preservation':
  shutil.copy2('/tmp/sqgi-v27-budget-refined/functions.nut',P/'functions.nut')
  s=s.replace('/tmp/sqgi-v27-budget-refined/functions.nut',str(P/'functions.nut'))
 (P/'capture.gdb').write_text(s)
