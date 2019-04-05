#!/bin/sh
# hello-go-deploy-gae test-on-local-server.sh

echo " "
echo "test-on-local-server.sh (END)"
echo " "

echo "KICK OFF APP ON YOUR LOCAL SERVER using Googles Local App server dev_appserver.py"
echo " "
echo "      Ctrl-c to stop"
echo "      Goto your local webpage: http://localhost:8080/"
echo "      Console: http://localhost:8000/console"
echo " "
# FORMAT dev_appserver.py --port=9999 [PATH_TO_YOUR_APP]
dev_appserver.py app.yaml
echo " "

echo "test-on-local-server.sh (END)"
echo " "