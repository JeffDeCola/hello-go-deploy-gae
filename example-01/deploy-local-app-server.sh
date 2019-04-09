#!/bin/sh -e 
# hello-go-deploy-gaedeploy-local-app-server.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "************************************************************************"
    echo "*deploy-local-app-server.sh -debug (START) *****************************"
    echo "************************************************************************"
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -x
    echo " "
else
    echo "************************************************************************"
    echo "*deploy-local-app-server.sh (START) ************************************"
    echo "************************************************************************"
    echo " "
fi

echo "KICK OFF APP ON YOUR LOCAL SERVER using Googles Local App server dev_appserver.py"
echo " "
echo "      Ctrl-c to stop"
echo "      Goto your local webpage: http://localhost:8080/"
echo "      Console: http://localhost:8000/console"
echo " "
# FORMAT dev_appserver.py --port=9999 [PATH_TO_YOUR_APP]
dev_appserver.py app.yaml
echo " "

echo "************************************************************************"
echo "*deploy-local-app-server.sh (END) **************************************"
echo "************************************************************************"
echo " "
