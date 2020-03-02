-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
dato = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        bolsa:bag{(a:CHARARRAY)},
        mape:map[]);
DUMP dato;

datotmp= FOREACH dato GENERATE FLATTEN(mape) as clave;
dump datotmp;


resumen= group datotmp by clave;
dump resumen;

conteo = FOREACH resumen GENERATE group, COUNT(datotmp);
dump conteo;

store conteo into 'output' using PigStorage(',');