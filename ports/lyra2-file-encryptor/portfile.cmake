vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO amazon-biobank/lyra2-file-encryptor
    REF 3a4906d06e6075cbaad984728c40e1f3a3260411
    SHA512 84d0e0070c0570421fdd18f39ce270adeab45117b78d2340fe9c8f0b352381aa1574b0aca50bf0a3632a3f54af41bad4d24c68dd3b9ea82d4af64676cce44b2d    
    HEAD_REF v_1_3
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH cmake/lyra2-file-encryptor)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)