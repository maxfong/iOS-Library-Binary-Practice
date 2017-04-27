# 更新CocoaPods
pod update

# 填写Framework的Target名称
FMK_NAME=iOSBinaryPractice
WORKSPACE_NAME=${FMK_NAME}
SCHEME_NAME=${FMK_NAME}
# Install dir will be the final output to the framework.
# The following line create it in the root folder of the current project.
INSTALL_DIR=Products/${FMK_NAME}.framework
# Working dir will be deleted after the framework creation.
WRK_DIR=build
DEVICE_DIR=${WRK_DIR}/Release-iphoneos/${FMK_NAME}.framework
SIMULATOR_DIR=${WRK_DIR}/Release-iphonesimulator/${FMK_NAME}.framework
# project方式
# xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphoneos clean build
# xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphonesimulator clean build
# workspace方式
xcodebuild -workspace ${WORKSPACE_NAME}".xcworkspace" -configuration "Release" -scheme ${SCHEME_NAME} SYMROOT=$(PWD)/build -sdk iphoneos clean build
xcodebuild -workspace ${WORKSPACE_NAME}".xcworkspace" -configuration "Release" -scheme ${SCHEME_NAME} SYMROOT=$(PWD)/build -sdk iphonesimulator clean build
# Cleaning the oldest.
if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi
mkdir -p "${INSTALL_DIR}"
cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"
# Uses the Lipo Tool to merge both binary files (i386 + armv6/armv7) into one Universal final product.
lipo -create "${DEVICE_DIR}/${FMK_NAME}" "${SIMULATOR_DIR}/${FMK_NAME}" -output "${INSTALL_DIR}/${FMK_NAME}"
rm -r "${WRK_DIR}"