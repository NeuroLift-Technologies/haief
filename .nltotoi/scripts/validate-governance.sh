#!/usr/bin/env bash
# validate-governance.sh
# NeuroLift Technologies — Governance Compliance Validation
# Validates that all required governance files exist and contain expected content.
# Usage: bash .nltotoi/scripts/validate-governance.sh [--strict]
#   --strict  Treat warnings (empty files, stale files) as failures.
# Exit code: 0 = pass, 1 = fail

# NOTE: set -e is intentionally omitted so every helper runs to completion and
# all results are collected before the summary/exit.  set -uo pipefail still
# guards against undefined variables and broken pipelines outside of helpers.
set -uo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
PASS=0
FAIL=0
WARN=0
STRICT=0

# Parse flags
for _arg in "$@"; do
  case "${_arg}" in
    --strict) STRICT=1 ;;
    *) echo "Unknown flag: ${_arg}" >&2; exit 1 ;;
  esac
done

check_file() {
  local file="$1"
  if [[ -f "${REPO_ROOT}/${file}" ]]; then
    echo "  ✅ EXISTS: ${file}"
    ((PASS++)) || true
  else
    echo "  ❌ MISSING: ${file}"
    ((FAIL++)) || true
  fi
}

check_content() {
  local file="$1"
  local pattern="$2"
  local label="$3"
  if [[ -f "${REPO_ROOT}/${file}" ]] && grep -q "${pattern}" "${REPO_ROOT}/${file}"; then
    echo "  ✅ CONTENT OK: ${label} in ${file}"
    ((PASS++)) || true
  else
    echo "  ❌ CONTENT MISSING: ${label} in ${file}"
    ((FAIL++)) || true
  fi
}

# check_file_not_empty <file>
# Warns (or fails in --strict mode) when a required file is empty.
# Always returns 0 so it never triggers errexit.
check_file_not_empty() {
  local file="$1"
  if [[ -f "${REPO_ROOT}/${file}" ]] && [[ -s "${REPO_ROOT}/${file}" ]]; then
    echo "  ✅ NOT EMPTY: ${file}"
    ((PASS++)) || true
  elif [[ "${STRICT}" -eq 1 ]]; then
    echo "  ❌ EMPTY OR MISSING: ${file}"
    ((FAIL++)) || true
  else
    echo "  ⚠️  EMPTY OR MISSING: ${file}"
    ((WARN++)) || true
  fi
  return 0
}

# check_file_age <file> [max_days]
# Warns (or fails in --strict mode) when a file's last-modified age exceeds
# max_days (default: 90).  Always returns 0 so it never triggers errexit.
# If the file does not exist this function returns silently without incrementing
# any counter — missing-file detection is the responsibility of check_file.
check_file_age() {
  local file="$1"
  local max_days="${2:-90}"
  if [[ ! -f "${REPO_ROOT}/${file}" ]]; then
    return 0
  fi
  local mtime now age_days
  # Try BSD stat (-r flag), then GNU stat (-c flag).  If both fail, skip the
  # check and emit a warning rather than silently misreporting the age.
  mtime="$(stat -c %Y "${REPO_ROOT}/${file}" 2>/dev/null \
           || stat -f %m "${REPO_ROOT}/${file}" 2>/dev/null)" || {
    echo "  ⚠️  AGE CHECK SKIPPED (cannot read mtime): ${file}"
    ((WARN++)) || true
    return 0
  }
  now="$(date +%s)"
  age_days=$(( (now - mtime) / 86400 ))
  if [[ "${age_days}" -le "${max_days}" ]]; then
    echo "  ✅ FRESH (${age_days}d old): ${file}"
    ((PASS++)) || true
  elif [[ "${STRICT}" -eq 1 ]]; then
    echo "  ❌ STALE (${age_days}d old, max ${max_days}d): ${file}"
    ((FAIL++)) || true
  else
    echo "  ⚠️  STALE (${age_days}d old, max ${max_days}d): ${file}"
    ((WARN++)) || true
  fi
  return 0
}

echo "=============================================="
echo "  NLT Governance Validation"
echo "  Repo: ${REPO_ROOT}"
echo "  Date: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "=============================================="
echo ""

# --- Required Files ---
echo "[ Required Files ]"
required_files=(
  "NLT-DEV-OTOI.md"
  "AGENTS.md"
  "nltotoi.json"
  ".nltotoi/README.md"
  ".nltotoi/index/governance-files.md"
  ".nltotoi/contracts/README.md"
  ".nltotoi/scripts/validate-governance.sh"
  ".nltotoi/proposals/validation-roadmap.md"
  "templates/agent-registration.json"
  "templates/handoff-record.json"
  "templates/escalation.md"
  "templates/intent-log.md"
  "templates/commit-message.md"
  "ISSUE_TEMPLATE/agent-escalation.md"
  "ISSUE_TEMPLATE/governance-proposal.md"
  "PULL_REQUEST_TEMPLATE/agent-contribution.md"
  ".github/workflows/validate-governance.yml"
  "SOPs/new-agent-onboarding.md"
  "SOPs/repo-governance-setup.md"
  "SOPs/incident-response.md"
)

for f in "${required_files[@]}"; do
  check_file "$f"
done

echo ""

# --- Content Checks ---
echo "[ Content Validation ]"
check_content "NLT-DEV-OTOI.md"  "ORG-DEV-OTOI-1.0.2"           "Document ID"
check_content "NLT-DEV-OTOI.md"  "Joshua W. Dorsey"              "Authority marker"
check_content "NLT-DEV-OTOI.md"  "Solidarity Framework"          "Solidarity Framework reference"
check_content "NLT-DEV-OTOI.md"  "HAIEF"                         "HAIEF reference"
check_content "AGENTS.md"        "NLT-DEV-OTOI.md"               "OTOI reference in AGENTS.md"
check_content "AGENTS.md"        "ORG-DEV-OTOI-1.0.2"            "Document ID in AGENTS.md"
check_content "nltotoi.json"     "NeuroLift-Technologies/haief" "Repository name in manifest"
check_content "nltotoi.json"     "ORG-DEV-OTOI-1.0.2"            "Document ID in manifest"
check_content "nltotoi.json"     "NLT-DEV-OTOI.md"               "Canonical contract path in manifest"

echo ""

# --- Summary ---
echo "=============================================="
echo "  Results: ${PASS} passed, ${FAIL} failed, ${WARN} warned"
if [[ "${STRICT}" -eq 1 ]]; then
  echo "  Mode: strict (warnings treated as failures)"
fi
echo "=============================================="

if [[ "${FAIL}" -gt 0 ]]; then
  echo ""
  echo "GOVERNANCE VALIDATION FAILED — ${FAIL} check(s) did not pass."
  echo "Review missing files and content above."
  exit 1
elif [[ "${WARN}" -gt 0 && "${STRICT}" -eq 1 ]]; then
  echo ""
  echo "GOVERNANCE VALIDATION FAILED (strict mode) — ${WARN} warning(s) treated as failure(s)."
  echo "Review warnings above, or run without --strict to allow warnings."
  exit 1
elif [[ "${WARN}" -gt 0 ]]; then
  echo ""
  echo "GOVERNANCE VALIDATION PASSED WITH WARNINGS — ${PASS} passed, ${WARN} warned."
  echo "Run with --strict to treat warnings as failures."
  exit 0
else
  echo ""
  echo "GOVERNANCE VALIDATION PASSED — all ${PASS} checks passed."
  exit 0
fi
