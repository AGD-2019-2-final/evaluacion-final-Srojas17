import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        letr = line.split('   ')[0]
        sys.stdout.write("{}\t1\n".format(letr))
