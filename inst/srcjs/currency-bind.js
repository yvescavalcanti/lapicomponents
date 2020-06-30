var binding = new Shiny.InputBinding();

$.extend(binding, {
	find: function(scope){
		return $(scope).find(".lapi-currency-input");
	},
	getValue: function(el){
		var value = $(el).moneyField('rawNumber');
		return value;
	},
	initialize(el){
		let field = $(el);
		let d = $(el).data('decimal');
		let t = $(el).data('thousands');
		let p = $(el).data('prefix');
		$(el).moneyField({
			prefix: p,
			thousands: t,
			decimal: d
		});
	},
	subscribe: function(el, callback){
		$(el).on('input keydown', function(){
			callback();
		});
	}
});

Shiny.inputBindings.register(binding);
