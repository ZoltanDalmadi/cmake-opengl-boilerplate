add_library(SOIL2 STATIC
    etc1_utils.c
    image_DXT.c
    image_helper.c
    SOIL2.c
)

if (MSVC)
    target_compile_options(SOIL2 PUBLIC "/TP")
    target_compile_definitions(SOIL2 PUBLIC "_CRT_SECURE_NO_WARNINGS")
else()
    target_compile_options(SOIL2 PUBLIC "-O2" "-DNDEBUG")
endif()
