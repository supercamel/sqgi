"""A green run for another revision must never authorize a master update."""
import importlib.util
from pathlib import Path
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location('guard', Path(__file__).resolve().parents[1] / 'tools/check_windows_ci.py')
guard = importlib.util.module_from_spec(spec)
spec.loader.exec_module(guard)
SHA = 'a' * 40


class WindowsCIGuard(unittest.TestCase):
    def run_record(self, **changes):
        return dict(dict(id=1, head_sha=SHA, status='completed', conclusion='success',
                         html_url='https://github.com/example/project/actions/runs/1'), **changes)

    def test_exact_success(self):
        run = self.run_record()
        self.assertEqual(guard.successful_run({'workflow_runs': [run]}, SHA), run['html_url'])

    def test_missing_or_other_commit(self):
        for runs in [[], [self.run_record(head_sha='b' * 40)]]:
            with self.subTest(runs=runs), self.assertRaises(RuntimeError):
                guard.successful_run({'workflow_runs': runs}, SHA)

    def test_latest_failure_or_pending_overrides_old_pass(self):
        for status, conclusion in [('queued', None), ('in_progress', None), ('completed', 'failure'),
                                   ('completed', 'cancelled'), ('completed', 'skipped')]:
            with self.subTest(status=status, conclusion=conclusion), self.assertRaises(RuntimeError):
                guard.successful_run({'workflow_runs': [self.run_record(),
                    self.run_record(id=2, status=status, conclusion=conclusion)]}, SHA)

    def test_candidate_push_and_delete_do_not_need_network(self):
        with patch.object(guard, 'check') as check:
            guard.pre_push('git@github.com:supercamel/sqgi.git', [
                f'refs/heads/fix {SHA} refs/heads/fix {"0" * 40}',
                f'(delete) {"0" * 40} refs/heads/master {SHA}'])
            check.assert_not_called()

    def test_any_local_ref_pushed_to_master_is_checked(self):
        for url in ['git@github.com:supercamel/sqgi.git', 'https://github.com/supercamel/sqgi.git',
                    'ssh://git@github.com/supercamel/sqgi.git']:
            with self.subTest(url=url), patch.object(guard, 'check') as check:
                guard.pre_push(url, [f'HEAD {SHA} refs/heads/master {"b" * 40}'])
                check.assert_called_once_with('supercamel/sqgi', SHA)

    def test_errors_block_master(self):
        with patch.object(guard, 'check', side_effect=OSError('network unavailable')):
            with self.assertRaises(OSError):
                guard.pre_push('git@github.com:supercamel/sqgi.git', [f'HEAD {SHA} refs/heads/master {"b" * 40}'])
        with self.assertRaises(ValueError):
            guard.pre_push('/unknown/repo', [f'HEAD {SHA} refs/heads/master {"b" * 40}'])


if __name__ == '__main__':
    unittest.main()
