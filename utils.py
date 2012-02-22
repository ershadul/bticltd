import re

def pdf_count(pdfile):
    vFileOpen = open( pdfile, 'rb', 1 )

    for vLine in vFileOpen.readlines():
        if "/Count " in vLine:
            vPages = int(re.search("/Count \d*", vLine).group()[7:] )
    vFileOpen.close()
    return vPages

def grouper(seq, size, fillvalue=None):
    def group(seq, size):
        if not hasattr(seq, 'next'):
            seq = iter(seq)
        while True:
            yield [seq.next() for i in xrange(size)]

    result = list(group(seq, size))
    length = len(seq)
    temp_len = length / size * size
    if temp_len != length:
        rest = seq[temp_len:]
        rest.extend([fillvalue]*(size-len(rest)))
        result.append(rest)
    return result