KEYMAPS_CONFIG="$HOME/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/keymaps.lua"
EDITOR_CONFIG="$HOME/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/editor.lua"

if [ -f "$KEYMAPS_CONFIG" ]; then
	echo "delete default lazyvim keymaps\n"
	rm -f "$KEYMAPS_CONFIG"
fi

if [ -f "$EDITOR_CONFIG" ]; then
	echo "delete default lazyvim editor plugins\n"
	rm -f "$EDITOR_CONFIG"
fi

echo "new lazyvim config keymaps\n"
cp modified/keymaps.lua "$KEYMAPS_CONFIG"

echo "new lazyvim editor plugins\n"
cp modified/editor.lua "$EDITOR_CONFIG"
