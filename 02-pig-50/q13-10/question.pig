--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta en SQL.
-- 
--    SELECT
--        color
--    FROM 
--        u 
--    WHERE 
--        color 
--    LIKE 'b%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 

dat = FOREACH u GENERATE color;

rpta = FILTER dat BY STARTSWITH(color,'b');

store rpta into 'output' USING PigStorage(' ');