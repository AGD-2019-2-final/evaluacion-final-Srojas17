-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (key:CHARARRAY, 
        date:CHARARRAY,
        cant:INT);
DUMP data;

groupkey = GROUP data BY key;
DUMP groupkey;

conteo = FOREACH groupkey GENERATE $0, COUNT(data);
DUMP conteo;

STORE conteo INTO 'output' using PigStorage('\t');
