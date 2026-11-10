build:
    mkdir -p dist
    bundle exec ruby ./scripts/packages.rb

    sudo chown -R $USER:$USER tmp
    sudo chmod -R 777 tmp

    cp -r filesystem/. tmp
    (cd tmp && find . | cpio -o -H newc | gzip -9) > dist/initramfs.igz

    mkdir -p image/initramfs

    cp dist/initramfs.igz image/initramfs/initramfs.igz

    xorriso -as mkisofs \
        -r -V "Progwilinux Unstable" \
        -o dist/progwilinux-unstable.iso \
        -J -joliet-long \
        -no-emul-boot \
        -e limine-uefi-cd.bin \
        ./image
deps:
    sudo pacman -Syu ruby just qemu-full
clean:
    rm -rf dist
    rm -rf image/initramfs

    rm -rf tmp
test:
    qemu-system-x86_64 -m 4096 -cdrom dist/progwilinux-unstable.iso -bios /usr/share/ovmf/x64/OVMF.4m.fd -enable-kvm
