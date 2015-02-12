VERSION = 0.$$(IODATA_VERSION)
TEMPLATE=lib

QT -= gui

HEADERS = iodata.h validator.h storage.h misc.h log.h
SOURCES = iodata.cpp validator.cpp storage.cpp misc.cpp

TARGET = iodata
target.path = $$[QT_INSTALL_LIBS]

pkgconfig.path = $$[QT_INSTALL_LIBS]/pkgconfig
pkgconfig.files = iodata.pc

devheaders.files = iodata.h validator.h storage.h
devheaders.path =  $$[QT_INSTALL_HEADERS]/iodata

FLEXSOURCES = datalang.l
BISONSOURCES = datalang.y
QMAKE_EXTRA_COMPILERS += bison flex bisonh

flex.commands = flex -o tokens.cpp ${QMAKE_FILE_IN}
flex.input = FLEXSOURCES
flex.output = tokens.cpp
flex.variable_out = SOURCES
flex.depends = parser.hpp
flex.name = flex

bison.commands = bison -v -d -o parser.cpp ${QMAKE_FILE_IN}
bison.input = BISONSOURCES
bison.output = parser.cpp
bison.variable_out = SOURCES
bison.name = bison

bisonh.commands = true
bisonh.input = BISONSOURCES
bisonh.output = parser.hpp
bisonh.variable_out = HEADERS
bisonh.name = bison header
bisonh.depends = parser.cpp

CONFIG += create_pc create_prl no_install_prl link_pkgconfig

QMAKE_PKGCONFIG_DESTDIR = pkgconfig
QMAKE_PKGCONFIG_INCDIR = $$devheaders.path

INSTALLS = target devheaders pkgconfig
