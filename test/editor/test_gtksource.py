#!/usr/bin/env python3
"""Exercise the actual GtkSourceView language engine, not just XML parsing."""
from pathlib import Path
import gi

gi.require_version('GtkSource', '5')
from gi.repository import GtkSource

root = Path(__file__).resolve().parents[2]
manager = GtkSource.LanguageManager.new()
manager.set_search_path([str(root / 'editors/gtksourceview')] + list(manager.get_search_path()))
for kind, suffix in [('squirrel', 'nut'), ('kernel', 'sqk')]:
    language = manager.get_language('sqgi-' + kind)
    assert language is not None
    assert manager.guess_language('test.' + suffix, None).get_id() == 'sqgi-' + kind
    buffer = GtkSource.Buffer.new_with_language(language)
    source = 'async export f64 test() {\n// comment\nlocal s = @"first ""quote""\nsecond // literal\nend";\n/* block */ return sqrt(2.5);\n}\n'
    buffer.set_text(source)
    begin, end = buffer.get_bounds()
    buffer.ensure_highlight(begin, end)
    def classes_at(needle):
        return set(buffer.get_context_classes_at_iter(buffer.get_iter_at_offset(source.index(needle))))
    assert 'comment' in classes_at('comment'), kind
    assert 'comment' in classes_at('block'), kind
    assert 'string' in classes_at('second'), kind
    assert 'comment' not in classes_at('literal'), kind
    assert 'string' not in classes_at('return'), kind
    # Highlighted lexical elements should have actual style tags.
    for needle in (['async'] if kind == 'squirrel' else ['export', 'f64', 'sqrt']):
        assert buffer.get_iter_at_offset(source.index(needle)).get_tags(), (kind, needle)
print('GtkSourceView: both language engines passed')
