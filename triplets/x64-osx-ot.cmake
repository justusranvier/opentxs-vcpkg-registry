set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)

set(VCPKG_CMAKE_SYSTEM_NAME Darwin)
set(VCPKG_OSX_ARCHITECTURES x86_64)

if(DEFINED ENV{OT_OSX_DEPLOYMENT_TARGET})
  message(STATUS "using $ENV{OT_OSX_DEPLOYMENT_TARGET} for VCPKG_OSX_DEPLOYMENT_TARGET")
  set(CMAKE_OSX_DEPLOYMENT_TARGET "$ENV{OT_OSX_DEPLOYMENT_TARGET}")
  set(VCPKG_OSX_DEPLOYMENT_TARGET "$ENV{OT_OSX_DEPLOYMENT_TARGET}")
else()
  message(FATAL_ERROR "you must set OT_OSX_DEPLOYMENT_TARGET in the environment before using this triplet")
endif()

set(SDKROOT "$ENV{XCODE_ROOT}/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk")
set(ENV{SDKROOT} "${SDKROOT}")