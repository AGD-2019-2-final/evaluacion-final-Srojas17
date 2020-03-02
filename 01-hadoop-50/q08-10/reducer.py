import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    sum = 0
    cont = 0

    for line in sys.stdin:
        key, val = line.split("\t")
        val = float(val)


        if key == curkey:
            sum += val
            cont += 1
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, sum, sum/cont))
            curkey = key
            sum = val
            cont = 1
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, sum, sum/cont))