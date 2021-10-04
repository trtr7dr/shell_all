sudo sh -c 'echo "deb [arch=amd64]
http://dl.google.com/linux/chrome/deb/ stable main" >>
/etc/apt/sources.list.d/google.list'

sudo apt-get updatesudo

apt-get install google-chrome-stable

