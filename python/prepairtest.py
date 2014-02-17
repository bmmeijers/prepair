from prepair import PolygonRepair

pr = PolygonRepair()
wkt = "POLYGON((1 1, 2 2, 2 1, 1 1))"
for i in range(100):
    print pr.repair_oddeven_wkt(wkt)

try:
    wkt = ""
    print pr.repair_oddeven_wkt(wkt)
except ValueError:
    pass

# FIXME: segfaults 
#wkt = "LINESTRING(0 0, 10 10)"
#print pr.repair_oddeven_wkt(wkt)
#
#wkt = "POINT(0 0)"
#print pr.repair_oddeven_wkt(wkt)
#
#wkt = "POINT(0 0"
#print pr.repair_oddeven_wkt(wkt)
