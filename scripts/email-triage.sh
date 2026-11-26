#!/bin/zsh
# Headless run of the email-triage skill. Called by cron (07:00 / 14:00 weekdays) or by hand.
# Log: logs/email-triage-YYYY-MM-DD.log (gitignored).
set -u
REPO=/Users/huaca/Projects/hugo/notask
CLAUDE=/Users/huaca/.local/bin/claude
cd "$REPO" || exit 1
mkdir -p logs
LOG="logs/email-triage-$(date +%Y-%m-%d).log"
{
  echo "=== $(date '+%Y-%m-%d %H:%M:%S') start ==="
  # If "/email-triage" is not resolved as a skill in -p mode on this build, replace the prompt with:
  #   "$(cat .claude/skills/email-triage/SKILL.md)"
  "$CLAUDE" -p "/email-triage" \
    --model sonnet \
    --permission-mode auto --permission-prompts none \
    --allowedTools "mcp__claude_ai_Gmail__search_threads,mcp__claude_ai_Gmail__get_thread,mcp__claude_ai_Gmail__get_message,mcp__claude_ai_Gmail__list_labels,mcp__claude_ai_Gmail__create_label,mcp__claude_ai_Gmail__label_thread,mcp__claude_ai_Gmail__label_message,mcp__notion__*" \
    --max-turns 40 --max-budget-usd 1 \
    --output-format json
  echo "=== exit $? ==="
} >> "$LOG" 2>&1
