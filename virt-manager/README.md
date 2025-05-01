Originally forked from   
https://github.com/m-bers/docker-virt-manager

First create user virtmanager and under as root or sudo run 
```shell
loginctl enable-linger virtmanager
```

```shell
su virtmanager
```

And in virtmanager's home folder commands:
```shell
export XDG_RUNTIME_DIR=/run/user/$UID
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
```

or to make it permanent add above lines to users .bashrc file in home folder and reboot or run source .bashrc

After that for rootless to work copy setup.sh file virtmanager's home folder and run:
```shell
chmod +x setup.sh && ./setup.sh
```
First you have to build Broadway base image, for example here: https://github.com/kipester/podman/tree/main/broadway-base

And after that you can build Virt-manager which is based Broadway-base image

```
podman build -t virt-manager:latest .
```
```
podman-compose up -d
```
Now you can login with default username(admin) and password(admin) from Virt-manager WebUi which is http://host-ip:8185

If you want to autostart container after reboot you can copy and save  virtmanager.service file under /home/virtmanager/.config/systemd/user/virtmanager.service

And after that:
```shell
systemctl --user enable virtmanager.service && systemctl --user start virtmanager.service
```
After that you can use normal systemctl --user commads to stop|start|restart|status to manage and/or check container service
