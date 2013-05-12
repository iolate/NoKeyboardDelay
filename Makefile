FW_DEVICE_IP=10.0.1.4

include theos/makefiles/common.mk

TWEAK_NAME = NoKeyboardDelay
NoKeyboardDelay_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk
