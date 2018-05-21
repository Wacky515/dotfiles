# historyの表示に日付を追加する
function history
    builtin history --show-time='%Y/%m/%d %H:%M:%S ' | sort
end

# history を複数端末間で共有
history を複数端末間で共有
function peco_sync_select_history
  history-merge
  peco_select_history $argv
end

function fish_user_key_bindings
  bind \cr 'peco_sync_select_history (commandline -b)'
end
