Originally forked from   
https://github.com/m-bers/docker-virt-manager

First create user virtmanager and under as root or sudo run "loginctl enable-linger virtmanager" and after that su virtmanager

And in virtmanager's home folder commands:

export XDG_RUNTIME_DIR=/run/user/$UID

export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"

or to make it permanent add above lines to users .bashrc file in home folder and reboot or run source .bashrc

After that for rootless to work copy setup.sh file virtmanager's home folder and run:

chmod +x setup.sh && ./setup.sh

If you want to autostart container after reboot you can save  virtmanager.service file under /home/virtmanager/.config/systemd/user/virtmanager.service

And after that:

systemctl --user enable virtmanager.service && systemctl --user start virtmanager.service

After that you can use normal systemctl --user commads to stop|start|restart|status to manage and/or check container service
