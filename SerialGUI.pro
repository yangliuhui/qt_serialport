QT += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
DEFINES += QT_DEPRECATED_WARNINGS

TARGET = SerialGUI
TEMPLATE = app
CONFIG += debug_and_release
SOURCES += src/main.cpp \
    src/mainwindow.cpp \
    src/QAsyncSerial.cpp \
    src/AsyncSerial.cpp
INCLUDEPATH += .
HEADERS += src/mainwindow.h \
    src/QAsyncSerial.h \
    src/AsyncSerial.h

FORMS += src/mainwindow.ui

unix{
  CONFIG(debug, debug|release){
    MOC_DIR += debug/moc
    UI_DIR += debug/forms
    OBJECTS_DIR += debug/obj
    DESTDIR += debug/bin
    }
  else{
    MOC_DIR += release/moc
    UI_DIR += release/forms
    OBJECTS_DIR += release/obj
    DESTDIR += release/bin
  }
  LIBS += -L/usr/local/lib \
      -lboost_system \
      -lboost_thread \
      -lboost_date_time
}
win32{
  RC_ICONS =GEPClient.ico
  CONFIG(debug, debug|release){
    LIBS += -L../glog/x64/Debug
    LIBS += -L../curl-7.57.0/builds/Debug/lib
    LIBS += -llibcurl_debug
  }
  else{
    LIBS += -L../glog/x64/Release
    LIBS += -L../curl-7.57.0/builds/Release/lib
    LIBS += -llibcurl
  }
  INCLUDEPATH += ../glog/src/windows
  INCLUDEPATH += ../ffmpeg-win64-dev/include
  INCLUDEPATH += ../curl-7.57.0/include
  LIBS += -L../ffmpeg-win64-dev/lib

  LIBS += -llibglog
  LIBS += -lavformat
  LIBS += -lavcodec
  LIBS += -lavdevice
  LIBS += -lavfilter
  LIBS += -lavutil
  LIBS += -lswscale
}
