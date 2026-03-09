# Run this *before* do_compile so HAB code always sees a ready cst-certs tree
hab_copy_certs_kernel() {
    echo ">>> [HAB][linux] Populating ${WORKDIR}/cst-certs/iMX8M from hab-pki-certs"

    # Start clean
    rm -rf ${WORKDIR}/cst-certs
    mkdir -p ${WORKDIR}/cst-certs/iMX8M/keys

    # Copy CRTs
    cp -a /home/ubuntu/var-fsl-yocto/sources/hab-pki-certs/iMX8M/crts \
          ${WORKDIR}/cst-certs/iMX8M/

    # Copy KEYS
    cp -a /home/ubuntu/var-fsl-yocto/sources/hab-pki-certs/iMX8M/keys/* \
          ${WORKDIR}/cst-certs/iMX8M/keys/

    echo ">>> [HAB][linux] After copy, tree is:"
    ls -R ${WORKDIR}/cst-certs || true
}

# Make sure our helper runs before *any* do_compile body / HAB logic
do_compile[prefuncs] += "hab_copy_certs_kernel"
