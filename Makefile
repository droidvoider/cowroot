ARCH := $(shell adb shell getprop ro.product.cpu.abi)
SDK_VERSION := $(shell adb shell getprop ro.build.version.sdk)

all: build

build:
	ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=./Android.mk APP_ABI=$(ARCH) APP_PLATFORM=android-$(SDK_VERSION)

push: build
	adb push libs/$(ARCH)/cowroot /data/local/tmp/cowroot
	adb shell 'chmod 777 /data/local/tmp/cowroot'

root: push
	adb shell '/data/local/tmp/cowroot'

clean:
	rm -rf libs
	rm -rf obj
