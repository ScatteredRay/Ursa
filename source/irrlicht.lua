project("irrlicht")
    kind("StaticLib")
    files { "Irrlich/inc/**.h", "Irrlicht/src/**.h", "Irrlicht/src/**.cpp" }
    includedirs { "Irrlicht/inc", "external", "external/zlib", "external/jpeglib", "external/libpng" }
    defines { "IRRLICHT_EXPORTS=1" }

    -- For zlib, jpeglib, and libpng
    files { "external/zlib/adler32.c", "external/zlib/compress.c",
            "external/zlib/crc32.c", "external/zlib/deflate.c",
            "external/zlib/inffast.c", "external/zlib/inflate.c",
            "external/zlib/inftrees.c", "external/zlib/trees.c",
            "external/zlib/uncompr.c", "external/zlib/zutil.c",
            "external/libpng/png.c", "external/libpng/pngerror.c",
            "external/libpng/pngget.c", "external/libpng/pngmem.c",
            "external/libpng/pngpread.c", "external/libpng/pngread.c",
            "external/libpng/pngrio.c", "external/libpng/pngrtran.c",
            "external/libpng/pngrutil.c", "external/libpng/pngset.c",
            "external/libpng/pngtrans.c", "external/libpng/pngwio.c",
            "external/libpng/pngwrite.c", "external/libpng/pngwtran.c",
            "external/libpng/pngwutil.c", "external/jpeglib/jcapimin.c",
            "external/jpeglib/jcapistd.c", "external/jpeglib/jccoefct.c",
            "external/jpeglib/jccolor.c", "external/jpeglib/jcdctmgr.c",
            "external/jpeglib/jchuff.c", "external/jpeglib/jcinit.c",
            "external/jpeglib/jcmainct.c", "external/jpeglib/jcmarker.c",
            "external/jpeglib/jcmaster.c", "external/jpeglib/jcomapi.c",
            "external/jpeglib/jcparam.c", "external/jpeglib/jcprepct.c",
            "external/jpeglib/jcsample.c", "external/jpeglib/jctrans.c",
            "external/jpeglib/jdapimin.c", "external/jpeglib/jdapistd.c",
            "external/jpeglib/jdatadst.c", "external/jpeglib/jdatasrc.c",
            "external/jpeglib/jdcoefct.c", "external/jpeglib/jdcolor.c",
            "external/jpeglib/jddctmgr.c", "external/jpeglib/jdhuff.c",
            "external/jpeglib/jdinput.c", "external/jpeglib/jdmainct.c",
            "external/jpeglib/jdmarker.c", "external/jpeglib/jdmaster.c",
            "external/jpeglib/jdmerge.c", "external/jpeglib/jdpostct.c",
            "external/jpeglib/jdsample.c", "external/jpeglib/jdtrans.c",
            "external/jpeglib/jerror.c", "external/jpeglib/jfdctflt.c",
            "external/jpeglib/jfdctfst.c", "external/jpeglib/jfdctint.c",
            "external/jpeglib/jidctflt.c", "external/jpeglib/jidctfst.c",
            "external/jpeglib/jidctint.c", "external/jpeglib/jmemmgr.c",
            "external/jpeglib/jmemnobs.c", "external/jpeglib/jquant1.c",
            "external/jpeglib/jquant2.c", "external/jpeglib/jutils.c",
            "external/jpeglib/jcarith.c", "external/jpeglib/jdarith.c",
            "external/jpeglib/jaricom.c", "external/aesGladman/aescrypt.cpp",
            "external/aesGladman/aeskey.cpp", "external/aesGladman/aestab.cpp",
            "external/aesGladman/fileenc.cpp", "external/aesGladman/hmac.cpp",
            "external/aesGladman/prng.cpp", "external/aesGladman/pwd2key.cpp",
            "external/aesGladman/sha1.cpp", "external/aesGladman/sha2.cpp",
            "external/bzip2/blocksort.c", "external/bzip2/huffman.c",
            "external/bzip2/crctable.c", "external/bzip2/randtable.c",
            "external/bzip2/bzcompress.c", "external/bzip2/decompress.c",
            "external/bzip2/bzlib.c", "external/lzma/LzmaDec.c"}
    defines { "PNG_THREAD_UNSAFE_OK", "PNG_NO_MMX_CODE", "PNG_NO_MNG_FEATURES" }

    -- Mac OSX
    files { "Irrlicht/src/MacOSX/**.mm" }
    includedirs { "Irrlicht/src/MacOSX" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }
