<%@ page import="org.json.simple.*" %>


<!DOCTYPE html>
<html>
<head>
	<title>Twitter Bootstrap jQuery Calendar component</title>

	<meta name="description" content="Full view calendar component for twitter bootstrap with year, month, week, day views.">
	<meta name="keywords" content="jQuery,Bootstrap,Calendar,HTML,CSS,JavaScript,responsive,month,week,year,day">
	<meta name="author" content="Serhioromano">
	<meta charset="UTF-8">

	<link rel="stylesheet" href="components/bootstrap2/css/bootstrap.css">
	<link rel="stylesheet" href="components/bootstrap2/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="./css/calendar.css">

	<style type="text/css">
		.btn-twitter {
			padding-left: 30px;
			background: rgba(0, 0, 0, 0) url(https://platform.twitter.com/widgets/images/btn.27237bab4db188ca749164efd38861b0.png) -20px 6px no-repeat;
			background-position: -20px 11px !important;
		}
		.btn-twitter:hover {
			background-position:  -20px -18px !important;
		}
	</style>
</head>
<body>
<div class="container">
	<div class="hero-unit">
		<h1>Bootstrap Calendar Demo</h1>

		<p>Bootstrap based full view calendar. Template based.</p>

		<a class="btn btn-inverse" href="https://github.com/Serhioromano/bootstrap-calendar">Fork on GitHub</a>
		<a class="btn" href="index-bs3.html">Use bootstrap 3</a>
		<a href="https://twitter.com/serhioromano" class="btn btn-twitter" data-show-count="false" data-size="large">Follow @serhioromano</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
		</script>
	</div>

	<div class="page-header">

		<div class="pull-right form-inline">
			<div class="btn-group">
				<button class="btn btn-primary" data-calendar-nav="prev"><< Prev</button>
				<button class="btn" data-calendar-nav="today">Today</button>
				<button class="btn btn-primary" data-calendar-nav="next">Next >></button>
			</div>
			<div class="btn-group">
				<button class="btn btn-warning" data-calendar-view="year">Year</button>
				<button class="btn btn-warning active" data-calendar-view="month">Month</button>
				<button class="btn btn-warning" data-calendar-view="week">Week</button>
				<button class="btn btn-warning" data-calendar-view="day">Day</button>
			</div>
		</div>

		<h3></h3>
		
	</div>
  <div class="row">
<div class="span9">
      <div id="calendar" class="cal-context" style="width: 100%;"><div class="cal-row-fluid cal-row-head">


<!--   
    <div class="cal-cell1">Sunday</div>
  
    <div class="cal-cell1">Monday</div>
  
    <div class="cal-cell1">Tuesday</div>
  
    <div class="cal-cell1">Wednesday</div>
  
    <div class="cal-cell1">Thursday</div>
  
    <div class="cal-cell1">Friday</div>
  
    <div class="cal-cell1">Saturday</div>
  
</div>
<div class="cal-month-box">
  
    
    <div class="cal-row-fluid cal-before-eventlist">
      <div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-outmonth cal-day-weekend cal-month-first-row">
  <span class="pull-right" data-cal-date="2016-06-26" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">26</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-outmonth cal-month-first-row">
  <span class="pull-right" data-cal-date="2016-06-27" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">27</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-outmonth cal-month-first-row">
  <span class="pull-right" data-cal-date="2016-06-28" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">28</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-outmonth cal-month-first-row">
  <span class="pull-right" data-cal-date="2016-06-29" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">29</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-outmonth cal-month-first-row">
  <span class="pull-right" data-cal-date="2016-06-30" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">30</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-01" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">1</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
  <span class="pull-right" data-cal-date="2016-07-02" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">2</span>
  
</div>
</div>
    </div>
  
    
    <div class="cal-row-fluid cal-before-eventlist">
      <div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
  <span class="pull-right" data-cal-date="2016-07-03" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">3</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-inmonth cal-day-holiday">
  <span class="pull-right" data-cal-date="2016-07-04" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="Independence Day">4</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-05" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">5</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-06" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">6</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-inmonth cal-day-today">
  <span class="pull-right" data-cal-date="2016-07-07" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">7</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-08" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">8</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
  <span class="pull-right" data-cal-date="2016-07-09" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">9</span>
  
</div>
</div>
    </div>
  
    
    <div class="cal-row-fluid cal-before-eventlist">
      <div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
  <span class="pull-right" data-cal-date="2016-07-10" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">10</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-11" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">11</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-12" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">12</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-13" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">13</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-14" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">14</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-15" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">15</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
  <span class="pull-right" data-cal-date="2016-07-16" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">16</span>
  
</div>
</div>
    </div>
  
    
    <div class="cal-row-fluid cal-before-eventlist">
      <div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
  <span class="pull-right" data-cal-date="2016-07-17" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">17</span>
  
<div id="cal-week-box" data-cal-week="2016-07-17" style="display: none;">Week 30</div></div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-18" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">18</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-19" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">19</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-20" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">20</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-21" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">21</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-22" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">22</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
  <span class="pull-right" data-cal-date="2016-07-23" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">23</span>
  
</div>
</div>
    </div>
  
    
    <div class="cal-row-fluid cal-before-eventlist">
      <div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
  <span class="pull-right" data-cal-date="2016-07-24" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">24</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-25" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">25</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-26" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">26</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-27" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">27</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-28" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">28</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-inmonth">
  <span class="pull-right" data-cal-date="2016-07-29" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">29</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
  <span class="pull-right" data-cal-date="2016-07-30" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">30</span>
  
</div>
</div>
    </div>
  
    
    <div class="cal-row-fluid cal-before-eventlist">
      <div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
  <span class="pull-right" data-cal-date="2016-07-31" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">31</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-outmonth">
  <span class="pull-right" data-cal-date="2016-08-01" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">1</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-outmonth">
  <span class="pull-right" data-cal-date="2016-08-02" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">2</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-outmonth">
  <span class="pull-right" data-cal-date="2016-08-03" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">3</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-outmonth">
  <span class="pull-right" data-cal-date="2016-08-04" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">4</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-outmonth">
  <span class="pull-right" data-cal-date="2016-08-05" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">5</span>
  
</div>
</div>
      <div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-outmonth cal-day-weekend">
  <span class="pull-right" data-cal-date="2016-08-06" data-cal-view="day" data-toggle="tooltip" title="" data-original-title="">6</span>
  
</div>
</div>
    </div>
  -->
</div>
</div>
    </div> 

    
    
		<div class="span3">
			<div class="row-fluid">
				<select id="first_day" class="span12">
					<option value="" selected="selected">First day of week language-dependant</option>
					<option value="2">First day of week is Sunday</option>
					<option value="1">First day of week is Monday</option>
				</select>
				<select id="language" class="span12">
					<option value="">Select Language (default: en-US)</option>
					<option value="bg-BG">Bulgarian</option>
					<option value="nl-NL">Dutch</option>
					<option value="fr-FR">French</option>
					<option value="de-DE">German</option>
					<option value="el-GR">Greek</option>
					<option value="hu-HU">Hungarian</option>
					<option value="id-ID">Bahasa Indonesia</option>
					<option value="it-IT">Italian</option>
					<option value="pl-PL">Polish</option>
					<option value="pt-BR">Portuguese (Brazil)</option>
					<option value="ro-RO">Romania</option>
					<option value="es-CO">Spanish (Colombia)</option>
					<option value="es-MX">Spanish (Mexico)</option>
					<option value="es-ES">Spanish (Spain)</option>
					<option value="ru-RU">Russian</option>
					<option value="sk-SR">Slovak</option>
					<option value="sv-SE">Swedish</option>
					<option value="zh-CN">简体中文</option>
					<option value="zh-TW">繁體中文</option>
					<option value="ko-KR">한국어</option>
					<option value="th-TH">Thai (Thailand)</option>
				</select>
				<label class="checkbox">
					<input type="checkbox" value="#events-modal" id="events-in-modal"> Open events in modal window
				</label>
				<label class="checkbox">
					<input type="checkbox" id="format-12-hours"> 12 Hour format
				</label>
				<label class="checkbox">
					<input type="checkbox" id="show_wb" checked> Show week box
				</label>
				<label class="checkbox">
					<input type="checkbox" id="show_wbn" checked> Show week box number
				</label>
			</div>

			<h4>Events</h4>
			<small>This list is populated with events dynamically</small>
			<ul id="eventlist" class="nav nav-list"></ul>
		</div>
	</div>

	<div class="clearfix"></div>
	<br><br>
	<a href="https://github.com/Serhioromano/bootstrap-calendar/issues" class="btn btn-block btn-info">
		<center>
			<span class="lead">
				Submit an issue, ask questions or give your ideas here!<br>
			</span>
			<small>Please do not post your "How to ..." questions in comments. use GitHub issue tracker.</small>
		</center>
	</a>
	<br><br>

	<div id="disqus_thread"></div>
	<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

	<div class="modal hide fade" id="events-modal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3>Event</h3>
		</div>
		<div class="modal-body" style="height: 400px">
		</div>
		<div class="modal-footer">
			<a href="#" data-dismiss="modal" class="btn">Close</a>
		</div>
	</div>

	<script type="text/javascript" src="components/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="components/underscore/underscore-min.js"></script>
	<script type="text/javascript" src="components/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="components/jstimezonedetect/jstz.min.js"></script>
	<script type="text/javascript" src="js/language/bg-BG.js"></script>
	<script type="text/javascript" src="js/language/nl-NL.js"></script>
	<script type="text/javascript" src="js/language/fr-FR.js"></script>
	<script type="text/javascript" src="js/language/de-DE.js"></script>
	<script type="text/javascript" src="js/language/el-GR.js"></script>
	<script type="text/javascript" src="js/language/it-IT.js"></script>
	<script type="text/javascript" src="js/language/hu-HU.js"></script>
	<script type="text/javascript" src="js/language/pl-PL.js"></script>
	<script type="text/javascript" src="js/language/pt-BR.js"></script>
	<script type="text/javascript" src="js/language/ro-RO.js"></script>
	<script type="text/javascript" src="js/language/es-CO.js"></script>
	<script type="text/javascript" src="js/language/es-MX.js"></script>
	<script type="text/javascript" src="js/language/es-ES.js"></script>
	<script type="text/javascript" src="js/language/ru-RU.js"></script>
	<script type="text/javascript" src="js/language/sk-SR.js"></script>
	<script type="text/javascript" src="js/language/sv-SE.js"></script>
	<script type="text/javascript" src="js/language/zh-CN.js"></script>
	<script type="text/javascript" src="js/language/cs-CZ.js"></script>
	<script type="text/javascript" src="js/language/ko-KR.js"></script>
	<script type="text/javascript" src="js/language/zh-TW.js"></script>
	<script type="text/javascript" src="js/language/id-ID.js"></script>
	<script type="text/javascript" src="js/language/th-TH.js"></script>
	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/app.js"></script>

	<script type="text/javascript">
		var disqus_shortname = 'bootstrapcalendar'; // required: replace example with your forum shortname
		(function() {
			var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
			dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
			(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		})();
	</script>
</div>
</body>
</html>
