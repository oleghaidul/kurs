(function($){
   $.fn.jAccordion = function(options){
	   
	var options = $.extend({
		
	},options);

	return this.each(function() {            
		var hndl = this;
		
		this.ul = $(this);
		this.ul.addClass("jaccordion");
		
		this.first_level_li_list = this.ul.children("li");
		this.ul_list = this.ul.find("ul");
		this.second_level_li_list = this.ul_list.children("li");
		
		this.open_close = function(li){
			
			var ul = li.find("ul");
			
			hndl.ul_list.each(function(){
			
				if($.data($(this)) != $.data(ul)){
					$(this).slideUp();
				}				
			});
			
			if(ul.is(":visible")){
				ul.slideUp();
			}
			else{
				ul.slideDown();
			}
		};
		
		this.init = function(){
			hndl.ul_list.hide();
			
			hndl.first_level_li_list.click(function(e){
			
				e.stopPropagation();
				hndl.open_close($(this));
			});
			
			hndl.second_level_li_list.find("a").click(function(e){
				e.stopPropagation();
			});
			
			hndl.ul.find("li.open ul").slideDown();
		};
		
		this.init();		
	});    
   };
})(jQuery);