Originally forked from
https://github.com/cutelyst/Virtlyst

Nice and clean, but works only on localhost because of issue:
https://github.com/cutelyst/Virtlyst/issues/62

Quick start:

Create user virtlyst and under as root or sudo run 
```
loginctl enable-linger virtlyst
```

```
su virtlyst
```
And in virtlyst's home folder commands:
```
export XDG_RUNTIME_DIR=/run/user/$UID
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
```
or to make it permanent add above lines to virtlyst user .bashrc file in home folder and reboot or run source .bashrc

After that for rootless to work copy setup.sh file virtlyst's home folder and run:
```
chmod +x setup.sh && ./setup.sh
```
First you have to build Cutelyst, for example here: https://github.com/kipester/podman/tree/main/cutelyst5

And after that you can build Virtlyst which is based Cutelyst image

```
podman build -t virtlyst:latest .
```
```
podman-compose up -d
```
Now you can login with default username(admin) and password(admin) from Virtlyst WebUi which is http://host-ip:8080

If you want to autostart container after reboot you can copy and save  virtlyst.service file under /home/virtmanager/.config/systemd/user/virtlyst.service

And after that:
```
systemctl --user enable virtlyst.service && systemctl --user start virtlyst.service
```
After that you can use normal systemctl --user commads to stop|start|restart|status to manage and/or check container service
