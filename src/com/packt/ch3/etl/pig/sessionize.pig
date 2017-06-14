register myjar.jar;
define Sessionize com.packt.ch3.etl.pig.Sessionize('1800'); /* 30 minutes */
nobots_weblogs = LOAD '/home/hadoop/apache_nobots_tsv.txt' 
				 AS (ip: chararray, timestamp:long, page:chararray, http_status:int, payload_size:int, useragent:chararray);

ip_groups = GROUP nobots_weblogs BY ip;

sessions = FOREACH ip_groups {
                ordered_by_timestamp = ORDER nobots_weblogs BY timestamp;
                GENERATE FLATTEN(Sessionize(ordered_by_timestamp));
           }

STORE sessions INTO '/home/hadoop/sessions';