set(VCPKG_ENV_PASSTHROUGH_UNTRACKED "EXTERNAL_QT_DIR;XCODE_ROOT")

set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_CMAKE_SYSTEM_NAME iOS)
set(VCPKG_OSX_SYSROOT iphonesimulator)

set(SDKROOT "$ENV{XCODE_ROOT}/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk")
set(ENV{SDKROOT} "${SDKROOT}")