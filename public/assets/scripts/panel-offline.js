var PanelOffline = {

	checkStatus: function () {
		Offline.options = {
			checkOnLoad: true, // Should we check the connection status immediatly on page load.
			reconnect: {
				initialDelay: 3, // How many seconds should we wait before rechecking.
				delay: 10 // How long should we wait between retries.
			}
		}

		setInterval(function () {
			Offline.check(); // Check the current status of the connection.
		}, 3000);
	},

	init: function () {
		this.checkStatus();
	}
}

