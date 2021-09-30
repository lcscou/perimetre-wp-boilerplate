#/bin/bash

printf "\n##### INITIAL SETUP  ######\n\n"

# Fix permissions

# try getting uid from docker, if it fails, try 33 (should work)
WWW_DATA_UID=33 # plug in your number from previous step
RESULT=$(docker-compose exec -u www-data wordpress id -u)
COMMAND_SUCCESS=$?
if [ $COMMAND_SUCCESS -eq 0 ]; then
  WWW_DATA_UID=$(echo $RESULT | tr -d '\r')
fi

sudo chown -R $WWW_DATA_UID:$USER ./wp-content
sudo find ./wp-content -type d -exec chmod 775 {} \;
sudo find ./wp-content -type f -exec chmod 664 {} \;


printf "\n##### INITIAL SETUP  ######\n\n"


read -p "Theme Name: " THEME_NAME
# Restarting Repo
rm -rf .git && git init

printf "\n⚠️ WARNING: Remote repo code will be replaced with your local repo code ⚠️\n\n"
read -p "Repository URL: " REPO_URL
git remote add origin "$REPO_URL"
git add .
git commit -m "First commit"


printf "/*\n* Theme Name: $THEME_NAME\n* Description: Thème $THEME_NAME\n* Author: Périmètre\n*/" > temas/tema/style.css
printf "\n##### INSTALING PLUGINS  ######\n\n"
# composer update


git push -u -f origin master


