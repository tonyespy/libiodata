TEMPLATE = subdirs

SUBDIRS = src tests type-to-cxx

prf.path =  $$[QT_HOST_DATA]/mkspecs/features
prf.files = iodata.prf

INSTALLS = prf

OTHER_FILES += rpm/*.spec *.prf
