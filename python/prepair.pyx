# cython: c_string_type=unicode, c_string_encoding=ascii

cdef class PolygonRepair:
    """Repairs invalid input polygons. 
    
    Two repair paradigms are supported: odd-even and pointset.
    """
    cdef _PolygonRepair* _this

    def __cinit__(self):
        self._this = new _PolygonRepair()

    cpdef repair_oddeven_wkt(self, wkt):
        """Repairs an input polygon according to the odd-even paradigm.

        wkt -- Polygon to be repaired
        type wkt -- str (well known text)

        returns -- MultiPolygon 
        type -- str
        """
        cdef str result
        cdef char* tmp = NULL
        cdef char* cwkt = wkt
        self._this.repairOddEvenWkt(&cwkt, &tmp)
        if tmp != NULL:
            result = tmp
            CPLFree(tmp)
        else:
            raise ValueError("Could not repair input")
        return result
    
    cpdef repair_oddeven_wkb(self, wkb):
        """Repairs an input polygon according to the odd-even paradigm."""
        raise NotImplementedError("not there yet")

    cpdef repair_pointset_wkt(self, wkt):
        """Repairs an input polygon according to the pointset paradigm."""
        raise NotImplementedError("not there yet")
    
    cpdef repair_pointset_wkb(self, wkb):
        """Repairs an input polygon according to the pointset paradigm."""
        raise NotImplementedError("not there yet")
    
    def __dealloc__(self):
        del self._this

cpdef str mytest(str pywkt):
    pass
    return ""
    #cdef str result
    #cdef char* tmp
    ##cdef char* result = NULL
    #cdef char* wkt = pywkt
    #prepair(&wkt, &tmp)
    #result = tmp
    ##print strlen(tmp)
    ##strcpy(result, tmp)
    #CPLFree(tmp)
    #return result
# See:
# for a good example C++ mapping
# http://stackoverflow.com/questions/20123696/cython-how-to-move-large-objects-without-copying-them


#cdef cppclass PolygonRepair:
#    PolygonRepair() except +
#    repair_odd_even_wkb(char *, char *)
#
#def repair_odd_even_wkb(geom):
#    cdef PolygonRepair pr = new PolygonRepair()
#    #out = ""
#    
#    # at c++ level :::
#    #char *outputWKT;
#    #outPolygons->exportToWkt(&outputWKT);
#    #std::cout << outputWKT << std::endl;
#    
#    cdef unsigned char * out;
#    pr.repair_odd_even_wkb(geom, &out ) #address of out --> &out
#    cdef str pyout = (&out)[:] # contents of out ---> pyout = out[0][:]
#    del out # contents of out ---> del out[0]
#    # pr.clean_up(out)
#    return pyout
