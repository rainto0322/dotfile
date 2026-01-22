fcitx5-remote -n | awk '{ 
  if ($0 == "pinyin") print "ZH"; 
  else if ($0 == "rime") print "ZH"; 
  else print "EN"; 
}'