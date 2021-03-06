vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO stiffstream/sobjectizer
    REF afe9fc4d9fac6157860ec4459ac7a129223be87c # v.5.7.0.1
    SHA512 5dfdfa5d868f9165c3f2b2051a737c36849c3ed7fbc6a4c857ce8f079dee8636e311b6ad5a4510fb36d3888601bfddb063bd8f880fd7107293e6096e34253148
)

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
    set(SOBJECTIZER_BUILD_STATIC ON)
    set(SOBJECTIZER_BUILD_SHARED OFF)
else()
    set(SOBJECTIZER_BUILD_STATIC OFF)
    set(SOBJECTIZER_BUILD_SHARED ON)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/dev
    PREFER_NINJA
    OPTIONS
        -DSOBJECTIZER_BUILD_STATIC=${SOBJECTIZER_BUILD_STATIC}
        -DSOBJECTIZER_BUILD_SHARED=${SOBJECTIZER_BUILD_SHARED}
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sobjectizer)

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

