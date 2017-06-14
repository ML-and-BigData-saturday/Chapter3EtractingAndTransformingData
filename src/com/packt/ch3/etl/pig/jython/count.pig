register 'count.py' using jython as count;
nobots_weblogs = LOAD '/home/hadoop/apache_nobots_tsv.txt' AS (ip: chararray, timestamp:long, page:chararray, http_status:int,
				 payload_size:int, useragent:chararray);

ip_page_groups = GROUP nobots_weblogs BY (ip, page);

ip_page_hits = FOREACH ip_page_groups GENERATE FLATTEN(group),count.calculate(nobots_weblogs);

STORE ip_page_hits INTO '/home/hadoop/ip_page_hits';