# Rootless Podman 
Mainly rootless podman containers for different services.

If there is instuctions or link to instructions, they are under service specific folder.

If you don't know nothing about Linux, podman, cli etc. Don't try these at home.

Almost every compose.yaml and Containerfile needs to be modified users own needs.

These containers are ment to use as service specific user (e.g. virtlyst runs under user virtlyst)

So first create user for container and after that in service users homefolder run:

export XDG_RUNTIME_DIR=/run/user/$UID
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"

or to make it permanet add above lines to users .bashrc file in home folder

If you clone this repo with git clone https://github.com/kipester/podman.git

After that for rootless to work run:

cd podman && chmod +x setup.sh  &&  ./setup.sh

If you want to autostart specific container after reboot you can find user specific systemd file
under every service which have a compose.yaml file. You have to save or move that file service users home folder under e.g
.config/systemd/user/example.service

And after that:

systemctl --user enable example.service && systemctl --user start example.service

After that you can use normal systemctl --user commads to stop|start|restart|status to manage container service
