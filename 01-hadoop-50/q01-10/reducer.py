import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = 0

    for line in sys.stdin:

        key, vals = line.split("\t")
        vals = int(vals)

        if key == curkey:
        	total += vals
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\n".format(curkey, total))

            curkey = key
            total = vals

    sys.stdout.write("{}\t{}\n".format(curkey, total))