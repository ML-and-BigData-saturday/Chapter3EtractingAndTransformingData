set mapred.cache.files '/home/hadoop/blacklist.txt#blacklist';
set mapred.create.symlink 'yes';

register myudfjar.jar;

all_weblogs = LOAD '/home/hadoop/apache_tsv.txt' AS (ip: chararray, timestamp:long, page:chararray, http_status:int, payload_size:int, useragent:chararray);

nobots_weblogs = FILTER all_weblogs BY NOT com.packt.ch3.etl.pig.IsUserAgentBot(useragent);

STORE nobots_weblogs INTO '/home/hadoop/nobots_weblogs';