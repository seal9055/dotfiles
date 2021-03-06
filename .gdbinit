source /home/seal/pwndbg/gdbinit.py

set highlight-color bold,green
set highlight-pc yes

set prompt-color bold,green
set message-system-color bold,green
set banner-title-color bold,green

set context-flag-set-color green,bold
set context-flag-unset-color light-red
set context-flag-value-color light-cyan
set context-flag-bracket-color white,bold
set context-register-color green
set context-register-changed-color red,bold
set context-register-changed-marker *

set backtrace-prefix —►
set backtrace-prefix-color red,bold
set backtrace-address-color gray
set backtrace-symbol-color red
set backtrace-frame-label-color green
set backtrace-frame-label ''

set nearpc-symbol-color gray
set nearpc-address-color gray
set nearpc-argument green
set nearpc-syscall-name-color red,bold
set nearpc-prefix —►
set nearpc-prefix-color red
set nearpc-branch-marker '    ↓'
set nearpc-branch-marker-color yellow,bold
set nearpc-branch-marker-contiguous

set memory-stack blue
set memory-heap yellow
set memory-rodata green
set memory-data purple

set disasm-branch-color red,bold

set hexdump-normal-color light-gray
set hexdump-separator-color blue
set hexdump-printable-color light-yellow
set hexdump-zero-color green
set hexdump-special-color red
set hexdump-offset-color yellow
set hexdump-address-color green

set telescope-register-color yellow
set telescope-offset-color green
set telescope-offset-separator ''
set telescope-offset-delimiter-color red
set telescope-offset-delimiter :
set telescope-repeating-marker '... ↓'
set telescope-repeating-marker-color yellow,bold

set chain-arrow-left ◂—
set chain-arrow-right —▸
set chain-arrow-color light-yellow,bold
set chain-contiguous-marker ...
set chain-contiguous-marker-color yellow,bold

set enhance-integer-value-color light-cyan
set enhance-string-value-color cyan
set enhance-comment-color gray
set enhance-unknown-color red

set banner-separator ─
set banner-color blue
set banner-title-position right
set banner-title-surrounding-left "────[ "
set banner-title-surrounding-right " ]────"
set banner-title-color light-red,bold

set code-prefix —►
set code-prefix-color red,bold
