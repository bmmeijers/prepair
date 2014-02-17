#!/bin/bash
valgrind --tool=memcheck --track-origins=yes --leak-check=full --suppressions=valgrind-python.supp python -E -tt prepairtest.py
