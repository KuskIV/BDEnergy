select * 
from 
    Configuration
where 1 = 1
    and JSON_CONTAINS(AllocatedCores, '[]')