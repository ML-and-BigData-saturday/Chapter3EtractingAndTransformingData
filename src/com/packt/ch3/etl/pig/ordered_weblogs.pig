nobots_weblogs = LOAD '/home/hadoop/apache_nobots_tsv.txt' 
				 AS (ip: chararray, timestamp:long, page:chararray, http_status:int, payload_size:int, useragent:chararray);

ordered_weblogs = ORDER nobots_weblogs BY timestamp;

STORE ordered_weblogs INTO '/home/hadoop/ordered_weblogs';




