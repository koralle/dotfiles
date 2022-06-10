VSCODE_USER_SETTING_PATH="~/Library/Application\ Support/Code/User"

echo $(dirname $0) && pwd

if [ -f "$VSCODE_USER_SETTING_PATH/settings.json" ]; then
  #rm $VSCODE_USER_SETTING_PATH/settings.json
  echo ok
fi

cat extensions | while read line
do 
  code --install-extension $line
done

code --list-extensions extensions

