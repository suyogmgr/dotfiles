window_title=$(hyprctl activewindow -j | jq -r '.title')

# Check if we have a valid window title
if [[ "$window_title" == "null" || -z "$window_title" ]]; then
    # No window or empty title, output nothing
    echo ""
else
    # We have a window title, optionally process it
    # You can add formatting or truncating here if needed
    
    # Example: Truncate long titles
    max_length=80
    if [ ${#window_title} -gt $max_length ]; then
        window_title="${window_title:0:$max_length}..."
    fi
    
    # Optional: Replace known app names with cleaner versions
    window_title=$(echo "$window_title" | sed -E 's/ - Mozilla Firefox$//')
    window_title=$(echo "$window_title" | sed -E 's/ - fish$//')
    
    echo "$window_title"
fi
