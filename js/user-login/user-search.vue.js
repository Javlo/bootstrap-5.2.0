var AJAX_LOADER = '<div class="d-flex justify-content-center" style="margin: 60px;"><div class="spinner-border spinner-grow-sm" role="status"><span class="sr-only" lang="en">Loading...</span></div></div></div>';

new Vue({
	el: "#user-login-registration",
	data: {		
		query: ''
	},
	created: function(e) {
		
	},
	mounted: function() {
	},
	methods: {
	},
	filters: {
		formatDate: function(date) {
			if (typeof (date.year) == 'undefined') {
				newDate = new Date(date);
				return newDate.getFullYear() + "-" + (newDate.getMonth() + 1) + "-" + newDate.getDate();
			} else {
				return date.year + "-" + date.month + "-" + date.day;
			}
		},
		formatPercent: function(value) {
			return Math.round(value * 100) + '%';
		},
		formatNumber: function(value) {
			return this.formatNumber(value);
		},
		formatAge: function(birthDate) {
			if (typeof (birthDate.year) == 'undefined') {
				birthDate = new Date(birthDate);
			}
			var today = new Date();
			var age = today.getFullYear() - birthDate.getFullYear();
			var m = today.getMonth() - birthDate.getMonth();
			if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
				age--;
			}
			return age;
		},
		formatMoney: function(value) {
			if (typeof value !== "number") {
				return value;
			}
			var formatter = new Intl.NumberFormat('fr-BE', {
				maximumFractionDigits: 0,
				style: 'currency',
				currency: 'EUR'
			});
			return formatter.format(value);
		}
	},
});

function formatTime(number) {
	str = "" + number;
	if (str.length == 1) {
		str = "0" + str;
	}
	return str;
}

function containsId(list, obj) {
	for (listObj of list) {
		if (listObj.id == obj.id) {
			return true;
		}
	};
	return false;
}

var startLoadingCount = 0;

function startSearch() {
	document.body.classList.add("ajax-loading");
	startLoadingCount++;
}

function endSearch() {
	startLoadingCount--;
	if (startLoadingCount < 0) {
		startLoadingCount = 0;
	}
	console.log("end search startLoadingCount = " + startLoadingCount);
	if (startLoadingCount == 0) {
		document.body.classList.remove("ajax-loading");
	}
}