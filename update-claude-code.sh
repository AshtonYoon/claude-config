#!/bin/bash

# Claude Code 자동 업데이트 스크립트
# 이 스크립트는 @anthropic-ai/claude-code 패키지를 확인하고 업데이트합니다.

LOGFILE="$HOME/.claude/update-claude-code.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$DATE] Claude Code 업데이트 확인 시작" >> "$LOGFILE"

# 현재 버전 확인
CURRENT_VERSION=$(pnpm list -g @anthropic-ai/claude-code 2>/dev/null | grep '@anthropic-ai/claude-code' | awk '{print $2}')
echo "[$DATE] 현재 버전: $CURRENT_VERSION" >> "$LOGFILE"

# 업데이트 가능한 버전 확인
OUTDATED=$(pnpm outdated -g @anthropic-ai/claude-code 2>&1)

if echo "$OUTDATED" | grep -q "@anthropic-ai/claude-code"; then
    echo "[$DATE] 업데이트 가능한 버전 발견" >> "$LOGFILE"
    echo "$OUTDATED" >> "$LOGFILE"

    # 업데이트 실행
    echo "[$DATE] 업데이트 시작..." >> "$LOGFILE"
    pnpm update -g @anthropic-ai/claude-code >> "$LOGFILE" 2>&1

    # 업데이트 후 버전 확인
    NEW_VERSION=$(pnpm list -g @anthropic-ai/claude-code 2>/dev/null | grep '@anthropic-ai/claude-code' | awk '{print $2}')
    echo "[$DATE] 업데이트 완료: $CURRENT_VERSION -> $NEW_VERSION" >> "$LOGFILE"
else
    echo "[$DATE] 이미 최신 버전입니다." >> "$LOGFILE"
fi

echo "[$DATE] 업데이트 확인 완료" >> "$LOGFILE"
echo "" >> "$LOGFILE"
