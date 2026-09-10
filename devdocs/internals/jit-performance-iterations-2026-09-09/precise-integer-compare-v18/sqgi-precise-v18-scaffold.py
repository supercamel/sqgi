from pathlib import Path
import re
pairs={'precise-cache-proofs-v17':'precise-integer-compare-v18','precise-native-store-v16':'precise-cache-proofs-v17','/tmp/sqgi-precise-cache-proof-study':'/tmp/sqgi-precise-integer-compare-study','cache-proofs-delta.patch':'integer-compare-delta.patch','v17':'v18','v16':'v17','V17':'V18','V16':'V17'}
pattern=re.compile('|'.join(map(re.escape,sorted(pairs,key=len,reverse=True))))
for name in ['gates.sh','measure.sh','analyze.py','native-summary.py','exit-code.py','archive.py','verify.py']:
 s=Path('/tmp/sqgi-precise-v17-'+name).read_text();s=pattern.sub(lambda m:pairs[m[0]],s)
 Path('/tmp/sqgi-precise-v18-'+name).write_text(s)
s=pattern.sub(lambda m:pairs[m[0]],Path('/tmp/sqgi-freeze-v17.py').read_text());Path('/tmp/sqgi-freeze-v18.py').write_text(s)
p=Path('/tmp/sqgi-precise-v18-exit-code.py');s=p.read_text();needle="(D/'exit-code-verification.json').write_text";insert=''' # Every JCMP in these small functions receives its signed native CSET.
 expected_cmp=[c for c in code if c['op']==29]
 native_cmp=[w for w in words if w & 0xffff0fff == 0x9a9f07ec]
 assert len(native_cmp)==len(expected_cmp),(name,len(native_cmp),len(expected_cmp))
 result[name]['native_integer_comparisons']=len(native_cmp)
''';s=s.replace(needle,insert+needle);p.write_text(s)
p=Path('/tmp/sqgi-precise-v18-archive.py');s=p.read_text().replace("'sqgi-freeze-v18.py']","'sqgi-freeze-v18.py','sqgi-precise-v18-route.py','sqgi-precise-v18-scaffold.py']");p.write_text(s)
