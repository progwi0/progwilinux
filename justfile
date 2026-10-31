image:
    mkdir -p dist
    xorriso -as mkisofs \
        -r -V "Progwilinux Unstable" \
        -o dist/progwilinux-unstable.iso \
        -J -joliet-long \
        -no-emul-boot \
        -e limine-uefi-cd.bin \
        ./image