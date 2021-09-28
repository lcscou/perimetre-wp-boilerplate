# Remove Wordpress Themes
rm -rf ./wp-content/themes/twentynineteen ./wp-content/themes/twentytwenty
# Remove Wordpress Plugins
rm -rf ./wp-content/plugins/hello.php ./wp-content/plugins/akismet
# Rename Theme
mv ./wp-content/themes/new-theme/ ./wp-content/themes/"${PWD##*/}"