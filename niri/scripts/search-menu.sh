#!/bin/bash
# Author: Rainto_0322
# Description: Search script

#Search engine configuration: Name+Search URL
declare -A SEARCH_ENGINES=(
    ["Bing"]="https://www.bing.com/search?q="
    ["Baidu"]="https://www.baidu.com/s?wd="
    ["Sougou"]="https://www.sogou.com/web?query="
    ["GitHub"]="https://github.com/search?q="
    ["Z-libraty"]="https://zh.zli3.ru/s/"
    ["Google"]="https://www.google.com/search?q="
)

# Choose a search engine through Wofi
selected_engine=$(printf '%s\n' "${!SEARCH_ENGINES[@]}" | wofi --dmenu --prompt "选择搜索引擎: ")

# Check if a search engine has been selected
if [ -z "$selected_engine" ]; then
    exit 0
fi

# Retrieve search terms
query=$(echo "在 $selected_engine 搜索: " | wofi --dmenu --height=20 )

# Check if the search term has been entered
if [ -z "$query" ]; then
    exit 0
fi

# URL encoding of search terms
encoded_query=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$query'))")

# Build a complete search URL
search_url="${SEARCH_ENGINES[$selected_engine]}${encoded_query}"

# Open search results using the default browser
xdg-open "$search_url"
