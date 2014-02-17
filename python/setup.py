from distutils.core import setup, Extension

# FIXME:
# instead of running cython --cplus prepair.pyx it should be possible to 
# run cythonize, but somehow this does not pick up properly the C++ 
# aspect of the sources

setup(
    ext_modules = [Extension('prepair',
    sources = ["prepair.cpp"],
    language="c++",
    libraries=['gdal', 'prepair'],
    )],
    include_dirs = ["/usr/include/gdal/", ".."],
)

