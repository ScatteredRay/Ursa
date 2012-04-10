project("irrlicht")
    kind("StaticLib")
    files { "../include/**.h", "Irrlicht/**.h", "Irrlicht/**.cpp" }
    includedirs { "../include", "Irrlicht/zlib", "Irrlicht/jpeglib", "Irrlicht/libpng" }
    defines { "IRRLICHT_EXPORTS=1" }

    -- For zlib, jpeglib, and libpng
    files { "Irrlicht/zlib/adler32.c", "Irrlicht/zlib/compress.c", "Irrlicht/zlib/crc32.c",
            "Irrlicht/zlib/deflate.c", "Irrlicht/zlib/inffast.c", "Irrlicht/zlib/inflate.c",
            "Irrlicht/zlib/inftrees.c", "Irrlicht/zlib/trees.c", "Irrlicht/zlib/uncompr.c",
            "Irrlicht/zlib/zutil.c", "Irrlicht/libpng/png.c", "Irrlicht/libpng/pngerror.c",
            "Irrlicht/libpng/pngget.c", "Irrlicht/libpng/pngmem.c", "Irrlicht/libpng/pngpread.c",
            "Irrlicht/libpng/pngread.c", "Irrlicht/libpng/pngrio.c", "Irrlicht/libpng/pngrtran.c",
            "Irrlicht/libpng/pngrutil.c", "Irrlicht/libpng/pngset.c", "Irrlicht/libpng/pngtrans.c",
            "Irrlicht/libpng/pngwio.c", "Irrlicht/libpng/pngwrite.c", "Irrlicht/libpng/pngwtran.c",
            "Irrlicht/libpng/pngwutil.c", "Irrlicht/jpeglib/jcapimin.c", "Irrlicht/jpeglib/jcapistd.c",
            "Irrlicht/jpeglib/jccoefct.c", "Irrlicht/jpeglib/jccolor.c", "Irrlicht/jpeglib/jcdctmgr.c",
            "Irrlicht/jpeglib/jchuff.c", "Irrlicht/jpeglib/jcinit.c", "Irrlicht/jpeglib/jcmainct.c",
            "Irrlicht/jpeglib/jcmarker.c", "Irrlicht/jpeglib/jcmaster.c", "Irrlicht/jpeglib/jcomapi.c",
            "Irrlicht/jpeglib/jcparam.c", "Irrlicht/jpeglib/jcprepct.c", "Irrlicht/jpeglib/jcsample.c",
            "Irrlicht/jpeglib/jctrans.c", "Irrlicht/jpeglib/jdapimin.c", "Irrlicht/jpeglib/jdapistd.c",
            "Irrlicht/jpeglib/jdatadst.c", "Irrlicht/jpeglib/jdatasrc.c", "Irrlicht/jpeglib/jdcoefct.c",
            "Irrlicht/jpeglib/jdcolor.c", "Irrlicht/jpeglib/jddctmgr.c", "Irrlicht/jpeglib/jdhuff.c",
            "Irrlicht/jpeglib/jdinput.c", "Irrlicht/jpeglib/jdmainct.c", "Irrlicht/jpeglib/jdmarker.c",
            "Irrlicht/jpeglib/jdmaster.c", "Irrlicht/jpeglib/jdmerge.c", "Irrlicht/jpeglib/jdpostct.c",
            "Irrlicht/jpeglib/jdsample.c", "Irrlicht/jpeglib/jdtrans.c", "Irrlicht/jpeglib/jerror.c",
            "Irrlicht/jpeglib/jfdctflt.c", "Irrlicht/jpeglib/jfdctfst.c", "Irrlicht/jpeglib/jfdctint.c",
            "Irrlicht/jpeglib/jidctflt.c", "Irrlicht/jpeglib/jidctfst.c", "Irrlicht/jpeglib/jidctint.c",
            "Irrlicht/jpeglib/jmemmgr.c", "Irrlicht/jpeglib/jmemnobs.c", "Irrlicht/jpeglib/jquant1.c",
            "Irrlicht/jpeglib/jquant2.c", "Irrlicht/jpeglib/jutils.c", "Irrlicht/jpeglib/jcarith.c",
            "Irrlicht/jpeglib/jdarith.c", "Irrlicht/jpeglib/jaricom.c", "Irrlicht/aesGladman/aescrypt.cpp",
            "Irrlicht/aesGladman/aeskey.cpp", "Irrlicht/aesGladman/aestab.cpp", "Irrlicht/aesGladman/fileenc.cpp",
            "Irrlicht/aesGladman/hmac.cpp", "Irrlicht/aesGladman/prng.cpp", "Irrlicht/aesGladman/pwd2key.cpp",
            "Irrlicht/aesGladman/sha1.cpp", "Irrlicht/aesGladman/sha2.cpp", "Irrlicht/bzip2/blocksort.c",
            "Irrlicht/bzip2/huffman.c", "Irrlicht/bzip2/crctable.c", "Irrlicht/bzip2/randtable.c",
            "Irrlicht/bzip2/bzcompress.c", "Irrlicht/bzip2/decompress.c", "Irrlicht/bzip2/bzlib.c",
            "Irrlicht/lzma/LzmaDec.c"}
    defines { "PNG_THREAD_UNSAFE_OK", "PNG_NO_MMX_CODE", "PNG_NO_MNG_FEATURES" }

    -- Mac OSX
    files { "Irrlicht/MacOSX/**.mm" }
    includedirs { "Irrlicht/MacOSX" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }
