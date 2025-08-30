

CREATE OR REPLACE VIEW stg.Clientes
select FullName
from crono$csv('/csv/clientes.csv')