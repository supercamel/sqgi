from pathlib import Path
import shutil
P=Path('/tmp/sqgi-v29-tail-budget');P.mkdir(exist_ok=True)
shutil.copy2('/tmp/sqgi-v28-tail-budget/functions.nut',P/'functions.nut')
s=Path('/tmp/sqgi-v28-tail-budget/capture.gdb').read_text().replace('/tmp/sqgi-v28-tail-budget',str(P));(P/'capture.gdb').write_text(s)
s=Path('/tmp/sqgi-v28-verify-tail.py').read_text().replace('/tmp/sqgi-v28-tail-budget',str(P)).replace('n<=10','n<=14').replace("+40", "+24").replace("'<10I'", "'<6I'")
s=s.replace("assert words[0:2]==(0xa9bf7bfd,0x910003fd)\n assert words[-3:]==(0xd63f0200,0xa8c17bfd,0xd65f03c0)", "assert words[0]&0xffc003ff==0xf94003e0\n assert words[1:]==(0xaa1303e1,0xaa1503e2,0xaa1403e4,0xaa1603e5,0xd61f0200)")
s=s.replace('len(witnesses)==20','len(witnesses)==12').replace("budget_pad_10", "budget_pad_14").replace("budget_pad_11", "budget_pad_15").replace('20 tail-only','12 tail-only')
Path('/tmp/sqgi-v29-verify-tail.py').write_text(s)
print('Prepared exact 24-byte tail/8192-vs-8196 boundary probe; not executed during correctness gates')
