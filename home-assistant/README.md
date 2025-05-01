Home Assistant compose file for podman and with integrated file editor container

Quick start:

Create user hass and under as root or sudo run 
```
loginctl enable-linger hass
```

```
su hass
```
And in hass's home folder commands:
```
export XDG_RUNTIME_DIR=/run/user/$UID
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
```
or to make it permanent add above lines to hass user .bashrc file in home folder and reboot or run source .bashrc

After that for rootless to work copy setup.sh file hass's home folder and run:
```
chmod +x setup.sh && ./setup.sh
```
Copy compose example from here https://github.com/kipester/podman/blob/main/home-assistant/compose.yaml

Make your own modifications and then:

```
podman-compose up -d
```
Now you can go login page which is http://host-ip:8123

If you want to autostart container after reboot you can copy and save  homeassistant.service file under /home/hass/.config/systemd/user/homeassistant.service

And after that:
```
systemctl --user enable homeassistant.service && systemctl --user start homeassistant.service
```
After that you can use normal systemctl --user commads to stop|start|restart|status to manage and/or check container service
