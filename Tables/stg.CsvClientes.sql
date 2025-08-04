

CREATE OR REPLACE VIEW stg.CsvClientes
select FullName
from crono$csv('/csv/clientes.csv')