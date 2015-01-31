VERSION = $$(IODATA_VERSION)
TEMPLATE = app
QT -= gui
TARGET = iodata-type-to-c++

INSTALLS = target

LIBS += -liodata -lcrypt

QMAKE_LIBDIR_FLAGS += -L../src

SOURCES = type-to-cxx.cpp

target.path = /usr/bin
