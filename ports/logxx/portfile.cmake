vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_configure_cmake(
    SOURCE_PATH d:/repos/q/products/logxx
    PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL d:/repos/q/products/logxx/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/logxx RENAME copyright)