(function(){
	if(!window.jQuery){
		throw new Error("jQuery not found!");
	}

	let _format = function(v,t,d,r = 100){
		 let a = v.replace(/\D/g, "");
		 let b = Number(a) / r;
		 return String(b.toFixed(2))
			.replace('.', d)
			.replace(/(\d)(?=(\d{3})+(?!\d))/g, `$1${t}`);  
	};
	let methods = {
	  init: function(options){
		let opts = $.extend({
		  decimal:',',
		  thousands: '.',
	      prefix: ''
		}, options);
		let initial = "0.00";
		if(this.val() === "" && this.val() === undefined){
			this.val("0.00");
		}else{
			this.val(String(Number(this.val()).toFixed(2)));
		}
		this.on('input', function(evt){
		  let a = evt.target.value;
		  a = a.replace(/\D/g, "");
		  b = Number(a) / 100;
		  evt.target.value= opts.prefix +' '+ String(b.toFixed(2))
			.replace('.', opts.decimal)
			.replace(/(\d)(?=(\d{3})+(?!\d))/g, `$1${opts.thousands}`);  
		});

		this.trigger('input');
		return this;  
	  },
	  rawNumber: function(){
		return Number(this.val().replace(/\D/g,"")) / 100;
	  },
	  formattedNumber: function(){
		return this.val();
	  }
	};

	$.fn.moneyField = function(method){
	  if(methods[method]){
		return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
	  }else if (typeof method === 'object' || !method){
		return methods.init.apply(this, arguments)
	  }else{
		$.error(`Method ${method} does not exists!`);
	  }
	};
})();
