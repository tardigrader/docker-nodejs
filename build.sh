#!/bin/bash
set -e

docker build -t nodejs .

docker run -t nodejs ./INSTALL_VIM.sh
COMMIT=$(docker ps -a | grep nodejs | grep "INSTALL_VIM.sh" | awk '{print $1}' | head -1)
docker commit "${COMMIT}" nodejs

docker run -d --entrypoint /bin/bash nodejs
COMMIT=$(docker ps -a | grep nodejs | grep '"/bin/bash"' | awk '{print $1}' | head -1)
docker commit "${COMMIT}" nodejs

reset
echo
echo "======================================================================"
echo " Node Docker image nodejs finished."
echo 
echo " Node.js, TypeScript, ESLint, TSLint, Git, Vim with good-to-have "
echo " plugins installed."
echo 
echo " Run container: docker run -it nodejs "
echo "======================================================================"
