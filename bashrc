export BASE_PATH=~/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/lib/luarocks/bin:/Applications/Xcode.app/Contents/Developer/usr/bin
export PATH=$BASE_PATH
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
export LC_CTYPE UTF8
# export NODE_PATH=/usr/local/lib/node_modules

# export CC=/usr/local/bin/gcc-4.2
export RBENV_VERSION=2.1.3

# export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
# export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
# export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.7/jars"

# export JAVA_HOME=$(/usr/libexec/java_home)

# Curl CA Bundle from http://curl.haxx.se/ca/cacert.pem
# without this Ruby fails to allow some valid SSL sites,
# like in my case, Campfire.
# export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cacert.pem

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
