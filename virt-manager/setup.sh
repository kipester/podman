### Podman rootless confs ###
### Storage ###
cat <<EOF > .config/containers/storage.conf
[storage]
driver = "overlay"
rootless_storage_path = "${HOME}/.local/share/containers/storage"
[storage.options]
mount_program = "/usr/bin/fuse-overlayfs"
EOF
### Network ###
cat <<EOF > .config/containers/containers.conf
[network]
default_rootless_network_cmd = "slirp4netns"
EOF

### Enable service ###
systemctl --user enable --now podman.socket && systemctl --user enable --now podman-auto-update.timer

echo "Ready"
