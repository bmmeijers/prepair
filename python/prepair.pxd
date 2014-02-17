cdef extern from "PolygonRepair.h":
    cdef cppclass _PolygonRepair "PolygonRepair":
        _PolygonRepair() except +
        void repairOddEvenWkt(char ** wkt, char ** out)


cdef extern from "cpl_conv.h":
    void CPLFree (void *ptr)

from libc.string cimport strlen, strcpy
from libc.stdlib cimport malloc, free
