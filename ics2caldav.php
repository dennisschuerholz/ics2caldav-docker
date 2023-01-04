<?php
	include 'calendar_import.php';
	foreach($calendars as $cal) {
		$c = array_merge_recursive($config, $cal);
		$log->debug(print_r($c, true));
		import_calendar($c, $log);
	}
