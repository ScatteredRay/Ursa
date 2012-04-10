project("irrlicht")
    kind("StaticLib")
    files { "Irrlich/inc/**.h", "Irrlicht/src/**.h", "Irrlicht/src/**.cpp" }
    includedirs { "Irrlicht/inc", "Irrlicht/src/zlib", "Irrlicht/src/jpeglib", "Irrlicht/src/libpng" }
    defines { "IRRLICHT_EXPORTS=1" }

    -- For zlib, jpeglib, and libpng
    files { "Irrlicht/src/zlib/adler32.c", "Irrlicht/src/zlib/compress.c",
            "Irrlicht/src/zlib/crc32.c", "Irrlicht/src/zlib/deflate.c",
            "Irrlicht/src/zlib/inffast.c", "Irrlicht/src/zlib/inflate.c",
            "Irrlicht/src/zlib/inftrees.c", "Irrlicht/src/zlib/trees.c",
            "Irrlicht/src/zlib/uncompr.c", "Irrlicht/src/zlib/zutil.c",
            "Irrlicht/src/libpng/png.c", "Irrlicht/src/libpng/pngerror.c",
            "Irrlicht/src/libpng/pngget.c", "Irrlicht/src/libpng/pngmem.c",
            "Irrlicht/src/libpng/pngpread.c", "Irrlicht/src/libpng/pngread.c",
            "Irrlicht/src/libpng/pngrio.c", "Irrlicht/src/libpng/pngrtran.c",
            "Irrlicht/src/libpng/pngrutil.c", "Irrlicht/src/libpng/pngset.c",
            "Irrlicht/src/libpng/pngtrans.c", "Irrlicht/src/libpng/pngwio.c",
            "Irrlicht/src/libpng/pngwrite.c", "Irrlicht/src/libpng/pngwtran.c",
            "Irrlicht/src/libpng/pngwutil.c", "Irrlicht/src/jpeglib/jcapimin.c",
            "Irrlicht/src/jpeglib/jcapistd.c", "Irrlicht/src/jpeglib/jccoefct.c",
            "Irrlicht/src/jpeglib/jccolor.c", "Irrlicht/src/jpeglib/jcdctmgr.c",
            "Irrlicht/src/jpeglib/jchuff.c", "Irrlicht/src/jpeglib/jcinit.c",
            "Irrlicht/src/jpeglib/jcmainct.c", "Irrlicht/src/jpeglib/jcmarker.c",
            "Irrlicht/src/jpeglib/jcmaster.c", "Irrlicht/src/jpeglib/jcomapi.c",
            "Irrlicht/src/jpeglib/jcparam.c", "Irrlicht/src/jpeglib/jcprepct.c",
            "Irrlicht/src/jpeglib/jcsample.c", "Irrlicht/src/jpeglib/jctrans.c",
            "Irrlicht/src/jpeglib/jdapimin.c", "Irrlicht/src/jpeglib/jdapistd.c",
            "Irrlicht/src/jpeglib/jdatadst.c", "Irrlicht/src/jpeglib/jdatasrc.c",
            "Irrlicht/src/jpeglib/jdcoefct.c", "Irrlicht/src/jpeglib/jdcolor.c",
            "Irrlicht/src/jpeglib/jddctmgr.c", "Irrlicht/src/jpeglib/jdhuff.c",
            "Irrlicht/src/jpeglib/jdinput.c", "Irrlicht/src/jpeglib/jdmainct.c",
            "Irrlicht/src/jpeglib/jdmarker.c", "Irrlicht/src/jpeglib/jdmaster.c",
            "Irrlicht/src/jpeglib/jdmerge.c", "Irrlicht/src/jpeglib/jdpostct.c",
            "Irrlicht/src/jpeglib/jdsample.c", "Irrlicht/src/jpeglib/jdtrans.c",
            "Irrlicht/src/jpeglib/jerror.c", "Irrlicht/src/jpeglib/jfdctflt.c",
            "Irrlicht/src/jpeglib/jfdctfst.c", "Irrlicht/src/jpeglib/jfdctint.c",
            "Irrlicht/src/jpeglib/jidctflt.c", "Irrlicht/src/jpeglib/jidctfst.c",
            "Irrlicht/src/jpeglib/jidctint.c", "Irrlicht/src/jpeglib/jmemmgr.c",
            "Irrlicht/src/jpeglib/jmemnobs.c", "Irrlicht/src/jpeglib/jquant1.c",
            "Irrlicht/src/jpeglib/jquant2.c", "Irrlicht/src/jpeglib/jutils.c",
            "Irrlicht/src/jpeglib/jcarith.c", "Irrlicht/src/jpeglib/jdarith.c",
            "Irrlicht/src/jpeglib/jaricom.c", "Irrlicht/src/aesGladman/aescrypt.cpp",
            "Irrlicht/src/aesGladman/aeskey.cpp", "Irrlicht/src/aesGladman/aestab.cpp",
            "Irrlicht/src/aesGladman/fileenc.cpp", "Irrlicht/src/aesGladman/hmac.cpp",
            "Irrlicht/src/aesGladman/prng.cpp", "Irrlicht/src/aesGladman/pwd2key.cpp",
            "Irrlicht/src/aesGladman/sha1.cpp", "Irrlicht/src/aesGladman/sha2.cpp",
            "Irrlicht/src/bzip2/blocksort.c", "Irrlicht/src/bzip2/huffman.c",
            "Irrlicht/src/bzip2/crctable.c", "Irrlicht/src/bzip2/randtable.c",
            "Irrlicht/src/bzip2/bzcompress.c", "Irrlicht/src/bzip2/decompress.c",
            "Irrlicht/src/bzip2/bzlib.c", "Irrlicht/src/lzma/LzmaDec.c"}
    defines { "PNG_THREAD_UNSAFE_OK", "PNG_NO_MMX_CODE", "PNG_NO_MNG_FEATURES" }

    -- Mac OSX
    files { "Irrlicht/src/MacOSX/**.mm" }
    includedirs { "Irrlicht/src/MacOSX" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }
