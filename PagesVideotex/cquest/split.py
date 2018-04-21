def readlines(filename, endings, chunksize=4096):
    """Returns a generator that splits on lines in a file with the given
    line-ending.
    """
    line = ''
    while True:        
        buf = filename.read(chunksize)
        if not buf:
            yield line
            break

        line = line + buf

        while endings in line:
            idx = line.index(endings) + len(endings)
            yield line[:idx-1]
            line = line[idx:]

if __name__ == "__main__":
    import sys, os

    FORMFEED = chr(12) # ASCII 12
    basename = os.path.basename(sys.argv[1])
    for num, data in enumerate(readlines(open(sys.argv[1]), endings=FORMFEED)):
        filename = basename + '-' + str(num)
        open(filename, 'wb').write(data)

