#
#  Copyright (c) 2008 Mathieu Malaterre <mathieu.malaterre@gmail.com>
#
#  Redistribution and use is allowed according to the terms of the New
#  BSD license.
#  For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#

FIND_PATH(LJPEG_INCLUDE_DIR ljpeg-62/jpeglib.h
/usr/local/include
/usr/include
)

FIND_LIBRARY(LJPEG8_LIBRARY
  NAMES jpeg8
  PATHS /usr/lib /usr/local/lib
  )
FIND_LIBRARY(LJPEG12_LIBRARY
  NAMES jpeg12
  PATHS /usr/lib /usr/local/lib
  )
FIND_LIBRARY(LJPEG16_LIBRARY
  NAMES jpeg16
  PATHS /usr/lib /usr/local/lib
  )

IF (LJPEG8_LIBRARY AND LJPEG_INCLUDE_DIR)
    SET(LJPEG_LIBRARIES ${LJPEG8_LIBRARY} ${LJPEG12_LIBRARY} ${LJPEG16_LIBRARY})
    SET(LJPEG_INCLUDE_DIRS ${LJPEG_INCLUDE_DIR})
    SET(LJPEG_FOUND "YES")
ELSE (LJPEG8_LIBRARY AND LJPEG_INCLUDE_DIR)
  SET(LJPEG_FOUND "NO")
ENDIF (LJPEG8_LIBRARY AND LJPEG_INCLUDE_DIR)


IF (LJPEG_FOUND)
   IF (NOT LJPEG_FIND_QUIETLY)
      MESSAGE(STATUS "Found LJPEG: ${LJPEG_LIBRARIES}")
   ENDIF (NOT LJPEG_FIND_QUIETLY)
ELSE (LJPEG_FOUND)
   IF (LJPEG_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "Could not find LJPEG library")
   ENDIF (LJPEG_FIND_REQUIRED)
ENDIF (LJPEG_FOUND)

MARK_AS_ADVANCED(
  LJPEG_LIBRARIES
  LJPEG_INCLUDE_DIR
  )
