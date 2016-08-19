var FormsTools = {

	inputMaskDate1: function () {
		$('.inputmask-date1').inputmask('d/m/y', {
			autoUnmask: true
		});
	},

	inputMaskDate2: function () {
		$('.inputmask-date2').inputmask('m/d/y', {
			autoUnmask: true
		});
	},

	inputMaskDate3: function () {
		$('.inputmask-date3').inputmask('d/m/y', {
			'placeholder': 'dd/mm/yyyy'
		});
	},

	inputMaskCurrency: function () {
		$('.inputmask-currency').inputmask('R$ 999.999.999,99', {
			numericInput: true
		});
	},

	inputMaskDecimal: function () {
		$('.inputmask-decimal').inputmask('decimal', {
			radixPoint: ',',
			autoGroup: true,
			groupSeparator: '.',
			groupSize: 3,
			rightAlign: false
		});
	},

	inputMaskDecimalRight: function () {
		$('.inputmask-decimal-right').inputmask('decimal', {
			radixPoint: ',',
			autoGroup: true,
			groupSeparator: '.',
			groupSize: 3
		});
	},

	inputMaskPhone: function () {
		$('.inputmask-phone').inputmask('mask', {
			'mask': '(999) 999-9999'
		});
	},
	
	inputMaskEmail: function () {
		$('.inputmask-email').inputmask({
			mask: '*{1,20}[.*{1,20}][.*{1,20}][.*{1,20}]@*{1,20}[.*{2,6}][.*{1,2}]',
			greedy: false,
			definitions: {
				'*': {
					validator: "[0-9A-Za-z!#$%&'*+/=?^_`{|}~\-]",
					cardinality: 1,
					casing: "lower"
				}
			}
		});
	},

	inputMaskIpV4: function () {
		$('.inputmask-ipv4').inputmask('ip');
	},

	paymentNumber: function () {
		$('.payment-number').payment('formatCardNumber');
	},

	paymentExp: function () {
		$('.payment-exp').payment('formatCardExpiry');
	},

	paymentCvc: function () {
		$('.payment-cvc').payment('formatCardCVC');
	},

	paymentRestrict: function () {
		$('.payment-restrict').payment('restrictNumeric');
	},

	googleCaptcha: function () {
		Recaptcha.create("6LcwjPoSAAAAAH4UDgFWXETiMZcarsXRydCmpj6v", 'recaptcha_div', {
			theme: "red",
			callback: Recaptcha.focus_response_field
		});
	},

	passwordStrength: function () {
		$('#password-strength').indicator();
	},

	passwordStrength2: function () {
		var options = {};
		options.ui = {
			container: '.pwd-container',
			showVerdictsInsideProgressBar: false,
			viewports: {
				progress: '.pwstrength_viewport_progress',
				verdict: '.pwstrength_viewport_verdict'
			},
			showStatus: true
		};
		$('.password-strength2').pwstrength(options);
	},

	maxLength: function () {
		$('.maxlength-default').maxlength();
	},

	maxLengthThreshold: function () {
		$('.maxlength-threshold').maxlength();
	},

	maxLengthOptions: function () {
		$('.maxlength-options').maxlength({
			alwaysShow: true,
			threshold: 10,
			warningClass: "label label-success",
			limitReachedClass: "label label-danger",
			separator: ' of ',
			preText: 'You have ',
			postText: ' chars remaining.',
			validate: true
		});
	},

	maxLengthTextarea: function () {
		$('.maxlength-textarea').maxlength({
			alwaysShow: true
		});
	},

	maxLengthPositions: function () {
		$('.maxlength-position').maxlength({
			alwaysShow: true,
			placement: 'centered-right'
		});
	},

	spinnerPostFix: function () {
		$('.touchspin-postfix').TouchSpin({
			min: 0,
			max: 100,
			step: 0.1,
			decimals: 2,
			boostat: 5,
			maxboostedstep: 10,
			postfix: '%'
		});
	},

	spinnerPreFix: function () {
		$('.touchspin-prefix').TouchSpin({
			min: 0,
			max: 20,
			stepinterval: 50,
			maxboostedstep: 10000000,
			prefix: '$'
		});
	},

	spinnerVertical: function () {
		$('.touchspin-vertical').TouchSpin({
			verticalbuttons: true
		});
	},

	spinnerStep: function () {
		$('.touchspin-step').TouchSpin({
			min: -10,
			max: 30,
			step: 10
		});
	},

	spinnerIcons: function () {
		$('.touchspin-icons').TouchSpin({
			verticalbuttons: true,
			verticalupclass: 'ion-chevron-up',
			verticaldownclass: 'ion-chevron-down'
		});
	},

	spinnerClass: function () {
		$('.touchspin-class').TouchSpin({
			buttondown_class: 'btn btn-primary',
			buttonup_class: 'btn btn-danger'
		});
	},

	init: function () {
		this.inputMaskDate1();
		this.inputMaskDate2();
		this.inputMaskDate3();
		this.inputMaskCurrency();
		this.inputMaskDecimal();
		this.inputMaskDecimalRight();
		this.inputMaskPhone();
		this.inputMaskEmail();
		this.inputMaskIpV4();

		this.paymentNumber();
		this.paymentExp();
		this.paymentCvc();
		this.paymentRestrict();

		this.passwordStrength();
		this.passwordStrength2();

		this.maxLength();
		this.maxLengthThreshold();
		this.maxLengthOptions();
		this.maxLengthTextarea();
		this.maxLengthPositions();

		this.spinnerPostFix();
		this.spinnerPreFix();
		this.spinnerVertical();
		this.spinnerStep();
		this.spinnerIcons();
		this.spinnerClass();
	}
}




