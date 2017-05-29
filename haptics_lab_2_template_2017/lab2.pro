TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp

win32{
    CHAI3D = /opt/chai3d-3.2.0

    DEFINES += WIN64
    DEFINES += D_CRT_SECURE_NO_DEPRECATE
    QMAKE_CXXFLAGS += /EHsc /MP



    INCLUDEPATH += $${CHAI3D}/src
    INCLUDEPATH += $${CHAI3D}/external/Eigen
    INCLUDEPATH += $${CHAI3D}/external/glew/include
    INCLUDEPATH += $${CHAI3D}/extras/GLFW/include

    DEPENDPATH += $${CHAI3D}/src
    LIBS += -L$${CHAI3D}/lib/Release/x64/ -lchai3d -lglu32 -lopengl32 -lwinmm
    LIBS += -L$${CHAI3D}/extras/GLFW/lib/Release/x64/ -lglfw
    LIBS += -lglu32 -lOpenGl32 -lglu32 -lOpenGl32 -lwinmm -luser32
    LIBS += kernel32.lib
    LIBS += user32.lib
    LIBS += gdi32.lib
    LIBS += winspool.lib
    LIBS += comdlg32.lib
    LIBS += advapi32.lib
    LIBS += shell32.lib
    LIBS += ole32.lib
    LIBS += oleaut32.lib
    LIBS += uuid.lib
    LIBS += odbc32.lib
    LIBS += odbccp32.lib
}

# Configured for the KTH CSC Karmosin computer halls
unix {
    CHAI3D = /opt/chai3d/3.2.0


    INCLUDEPATH += $${CHAI3D}/src
    INCLUDEPATH += $${CHAI3D}/external/Eigen
    INCLUDEPATH += $${CHAI3D}/external/glew/include
    INCLUDEPATH += $${CHAI3D}/extras/GLFW/include
    INCLUDEPATH += $${CHAI3D}/modules/ODE/src/
    INCLUDEPATH += $${CHAI3D}/modules/ODE/external/ODE/include
    #INCLUDEPATH += /tools/





    DEFINES += LINUX
    QMAKE_CXXFLAGS += -std=c++0x
    LIBS += -L$${CHAI3D}/external/DHD/lib/lin-x86_64/
    LIBS += -L$${CHAI3D}/build/extras/GLFW
    LIBS += -lchai3d
    LIBS += -L$${CHAI3D}/build
    LIBS += -ldrd
    LIBS += -lpthread
    LIBS += -lrt
    LIBS += -ldl
    LIBS += -lGL
    LIBS += -lGLU
    LIBS += -lusb-1.0
    LIBS += -lglfw
    LIBS += -lX11
    LIBS += -lXcursor
    LIBS += -lXrandr
    LIBS += -lXinerama




    #LIBS += -lnameofthelibrary
}



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../Haptic/3.2.0/modules/ODE/lib/release/lin-x86_64-cc/release/ -lchai3d-ODE
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../Haptic/3.2.0/modules/ODE/lib/release/lin-x86_64-cc/debug/ -lchai3d-ODE
else:unix: LIBS += -L$$PWD/../Haptic/3.2.0/modules/ODE/lib/release/lin-x86_64-cc/ -lchai3d-ODE

INCLUDEPATH += $$PWD/../Haptic/3.2.0/modules/ODE/lib/release/lin-x86_64-cc
DEPENDPATH += $$PWD/../Haptic/3.2.0/modules/ODE/lib/release/lin-x86_64-cc

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../Haptic/3.2.0/modules/ODE/lib/release/lin-x86_64-cc/release/libchai3d-ODE.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../Haptic/3.2.0/modules/ODE/lib/release/lin-x86_64-cc/debug/libchai3d-ODE.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../Haptic/3.2.0/modules/ODE/lib/release/lin-x86_64-cc/release/chai3d-ODE.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../Haptic/3.2.0/modules/ODE/lib/release/lin-x86_64-cc/debug/chai3d-ODE.lib
else:unix: PRE_TARGETDEPS += $$PWD/../Haptic/3.2.0/modules/ODE/lib/release/lin-x86_64-cc/libchai3d-ODE.a
