image:
    mkdir -p dist
    xorriso -as mkisofs \
        -r -V "Progwilinux Unstable" \
        -o dist/progwilinux-unstable.iso \
        -J -joliet-long \
        -no-emul-boot \
        -e limine-uefi-cd.bin \
        ./image
packages:
    ./scripts/packages.sh
copy:
    cp -r filesystem/. tmp
test:
    qemu-system-x86_64 -m 4096 -cdrom dist/progwilinux-unstable.iso -bios /usr/share/ovmf/x64/OVMF.4m.fd -enable-kvm