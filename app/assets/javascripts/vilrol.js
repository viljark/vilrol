Vilrol = {
	initTicker: function () {
		$(".end-date").each(function(i, e) {
			new Vilrol.Ticker($(e));
		});
	},
	Ticker: function ($element) {
		var end = $element.data("end-date"),
			endYear = end.split("-")[0],
			endMonth = end.split("-")[1],
			endDay = end.split("-")[2],
			endDate = new Date(endYear, endMonth - 1, endDay);
		endDate.setDate(endDate.getDate() + 1);
		setInterval(function() {
			var curDate = new Date(),
				difference = endDate - curDate,
				days = Math.floor(difference / 86400000);
			difference = difference - days*86400000;
			var hours = Math.floor(difference / 3600000);
			difference = difference - hours*3600000;
			var minutes = Math.floor(difference / 60000);
			difference = difference - minutes*60000;
			var seconds = Math.floor(difference / 1000);
			var s = days ? days + "p " : "";
			s += (hours || days) ? hours + "t " : "";
			s += (hours || days || minutes) ? minutes + "m " : "";
			s += (hours || days || minutes || seconds) ? seconds + "s " : "";
			$element.text(s);
		}, 1000);
	}
};
$(document).ready(function () {
	Vilrol.initTicker();
});
