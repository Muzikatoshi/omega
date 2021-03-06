# - Try to find evolutiondataserver1.0 components
# Find evolutiondataserver 1.0 headers, libraries and the answer to all questions.
#
#  EVOLUTIONDATASERVER1.0_FOUND               True if evolutiondataserver1.0 got found
#  EVOLUTIONDATASERVER1.0_INCLUDE_DIRS         Location of evolutiondataserver1.0 headers 
#  EVOLUTIONDATASERVER1.0_LIBRARIES           List of libaries to use evolutiondataserver1.0
#  EVOLUTIONDATASERVER1.0_DEFINITIONS         Definitions to compile evolutiondataserver1.0 
#
# Copyright (c) 2007 Juha Tuomala <tuju@iki.fi>
# Copyright (c) 2007 Daniel Gollub <gollub@b1-systems.de>
# Copyright (c) 2007 Alban Browaeys <prahal@yahoo.com>
#
#  Redistribution and use is allowed according to the terms of the New
#  BSD license.
#  For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#

INCLUDE( FindPkgConfig )
# Take care about evolution-data-server-1.0.pc settings
IF ( EvolutionDataServer1.0_FIND_REQUIRED )
  SET( _pkgconfig_REQUIRED "REQUIRED" )
ELSE ( EvolutionDataServer1.0_FIND_REQUIRED )
  SET( _pkgconfig_REQUIRED "" )
ENDIF ( EvolutionDataServer1.0_FIND_REQUIRED )

pkg_search_module( EVOLUTIONDATASERVER1.0 ${_pkgconfig_REQUIRED} evolution-data-server-1.0 )


# Look for evolutiondataserver1.0 include dir and libraries w/o pkg-config.
IF ( NOT EVOLUTIONDATASERVER1.0_FOUND AND NOT PKG_CONFIG_FOUND )
        # Handle dependencies
	IF ( NOT LIBGNOME2_FOUND )
		FIND_PACKAGE ( LibGnome2 REQUIRED )
                IF ( LIBGNOME2_FOUND )
                        SET ( EVOLUTIONDATASERVER1.0_INCLUDE_DIRS ${EVOLUTIONDATASERVER1.0_INCLUDE_DIRS} ${LIBGNOME2_INCLUDE_DIRS} )
                        SET ( EVOLUTIONDATASERVER1.0_LIBRARIES ${EVOLUTIONDATASERVER1.0_LIBRARIES} ${LIBGNOME2_LIBRARIES} )
                ENDIF ( LIBGNOME2_FOUND )		
	ENDIF ( NOT LIBGNOME2_FOUND )
	IF ( NOT BONOBO2_FOUND )
		SET ( BONOBO2_MIN_VERSION "2.4.2" )
		FIND_PACKAGE ( BONOBO2 REQUIRED )
                IF ( BONOBO2_FOUND )
                        SET ( EVOLUTIONDATASERVER1.0_INCLUDE_DIRS ${EVOLUTIONDATASERVER1.0_INCLUDE_DIRS} ${BONOBO2_INCLUDE_DIRS} )
                        SET ( EVOLUTIONDATASERVER1.0_LIBRARIES ${EVOLUTIONDATASERVER1.0_LIBRARIES} ${BONOBO2_LIBRARIES} )
                ENDIF ( BONOBO2_FOUND )		
	ENDIF ( NOT BONOBO2_FOUND )

	# Report results
	IF ( EVOLUTIONDATASERVER1.0_LIBRARIES AND EVOLUTIONDATASERVER1.0_INCLUDE_DIRS )
		SET( EVOLUTIONDATASERVER1.0_FOUND 1 )
		IF ( NOT EvolutionDataServer1.0_FIND_QUIETLY )
			MESSAGE( STATUS "Found evolutiondataserver-1.0: ${EVOLUTIONDATASERVER1.0_LIBRARIES}" )
		ENDIF ( NOT EvolutionDataServer1.0_FIND_QUIETLY )
	ELSE ( EVOLUTIONDATASERVER1.0_LIBRARIES AND EVOLUTIONDATASERVER1.0_INCLUDE_DIRS )	
		IF ( EvolutionDataServer1.0_FIND_REQUIRED )
			MESSAGE( SEND_ERROR "Could NOT find evolutiondataserver-1.0" )
		ELSE ( EvolutionDataServer1.0_FIND_REQUIRED )
			IF ( NOT EvolutionDataServer1.0_FIND_QUIETLY )
				MESSAGE( STATUS "Could NOT find evolutiondataserver-1.0" )	
			ENDIF ( NOT EvolutionDataServer1.0_FIND_QUIETLY )
		ENDIF ( EvolutionDataServer1.0_FIND_REQUIRED )
	ENDIF ( EVOLUTIONDATASERVER1.0_LIBRARIES AND EVOLUTIONDATASERVER1.0_INCLUDE_DIRS )	

ENDIF ( NOT EVOLUTIONDATASERVER1.0_FOUND AND NOT PKG_CONFIG_FOUND )
# Hide advanced variables from CMake GUIs
MARK_AS_ADVANCED( EVOLUTIONDATASERVER1.0_LIBRARIES EVOLUTIONDATASERVER1.0_INCLUDE_DIRS )

