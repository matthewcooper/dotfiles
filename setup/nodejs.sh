#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Install node.js from nodesource.com
echo "Installing nodejs..."
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs && echo "Done!"
echo

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash

# Configure npm
# Ask required parameters
echo "Configure npm init..."
echo -n "What is your name? (Denys Dovhan): " && read NAME
echo -n "What is your email? (email@denysdovhan.com): " && read EMAIL
echo -n "What is your website? (http://denysdovhan.com/): " && read SITE

# If required parameters dont entered, set them default values
: ${NAME:="Denys Dovhan"}
: ${EMAIL:="email@denysdovhan.com"}
: ${SITE:="http://denysdovhan.com/"}

echo "Author name put as: $NAME"
npm set init.author.name "$NAME"
echo "Author email put as: $EMAIL"
npm set init.author.email "$EMAIL"
echo "Author website put as: $SITE"
npm set init.author.url "$SITE"
echo

# Installing global packages

echo "Installing global packages..."
# Compilers
sudo npm i -g babel less stylus coffee-script
# Builders
sudo npm i -g grunt-cli gulp webpack browserify
# DevTools
sudo npm i -g bower nodemon yo stylint eslint
# Tools
sudo npm i -g npm-check-updates github-upstreamer speed-test gh
echo "Done!"
