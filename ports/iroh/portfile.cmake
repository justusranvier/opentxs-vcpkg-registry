vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO n0-computer/iroh-c-ffi
    REF "v0.101.0"
    SHA512 da670f3770183cc123d1b5092f7f5c7213fddeff128737375ac891233b8db5f6707873bf317ebb6a73acc936f09784a362261eab197089fec67a3ff2f0f76362
    HEAD_REF main
)

file(WRITE "${SOURCE_PATH}/CMakeLists.txt" [[
cmake_minimum_required(VERSION 3.22)
project(iroh VERSION 0.101.0 LANGUAGES C)

find_package(Corrosion CONFIG REQUIRED)

corrosion_import_crate(
    MANIFEST_PATH Cargo.toml
    CRATES iroh-c-ffi
    FEATURES headers
)

set(IROH_HEADERS
    irohnet.h
)

# Target name must explicitly match the Cargo.toml library definition: iroh_c_ffi
install(TARGETS iroh_c_ffi
    EXPORT iroh-targets
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)

install(FILES ${IROH_HEADERS} DESTINATION include/iroh)

install(EXPORT iroh-targets
    FILE irohTargets.cmake
    NAMESPACE iroh::
    DESTINATION lib/cmake/iroh
)

include(CMakePackageConfigHelpers)
configure_package_config_file(
    ${CMAKE_CURRENT_LIST_DIR}/iroh-config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/iroh-config.cmake
    INSTALL_DESTINATION lib/cmake/iroh
)
write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/iroh-config-version.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/iroh-config.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/iroh-config-version.cmake
    DESTINATION lib/cmake/iroh
)
]])

file(WRITE "${SOURCE_PATH}/iroh-config.cmake.in" [[
@PACKAGE_INIT@
include("${CMAKE_CURRENT_LIST_DIR}/irohTargets.cmake")
check_required_components(iroh)
]])

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME iroh
    CONFIG_PATH lib/cmake/iroh
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE-MIT")
