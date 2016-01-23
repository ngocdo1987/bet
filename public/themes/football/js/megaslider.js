(function($) {
	$('.megaslider').each(function() {
		// Define show and hide label triggers
		$(this)
			.find('.megaslider__slide')
			.on('showLabel', function(event) {
				$(this)
					.find('.megaslider__slide__label')
					.css('bottom', '-50px')
					.animate({
						bottom: 0
					}, 400);
			}).on('hideLabel', function(event) {
				$(this)
					.find('.megaslider__slide__label')
					.css('bottom', 0)
					.animate({
						bottom: '-50px'
					}, 200);
			});

		// Define this slide trigger
		$(this)
			.find('.megaslider__row')
			.on('thisSlide', function(event) {
				if($(event.target).hasClass('megaslider__row__link') || $(this).hasClass('megaslider__row--active')) return;
				slide = $(this).index();
				$(this)
					.addClass('megaslider__row--active')
					.siblings()
					.removeClass('megaslider__row--active');
				$(this)
					.closest('.megaslider')
					.find('.megaslider__slide--active')
					.trigger('hideLabel')
					.closest('.megaslider__slide')
					.siblings()
					.andSelf()
					.eq(slide)
					.stop(true, true)
					.css('pointer-events', '')
					.css('z-index', 0)
					.css('display', 'block')
					.addClass('megaslider__slide--active')
					.siblings('.megaslider__slide--active')
					.css('pointer-events', 'none')
					.css('z-index', '')
					.removeClass('megaslider__slide--active')
					.fadeOut(400, function() {
						$(this)
							.siblings()
							.andSelf()
							.eq(slide)
							.trigger('showLabel');
					});
			});

		// Activate click trigger
		$(this)
			.find('.megaslider__row')
			.on('click', function(event) {
				$(this).trigger('thisSlide');
				$(this)
					.closest('.megaslider')
					.trigger('resetInterval');
			});

		// Define next slide trigger
		$(this)
			.on('nextSlide', function(event) {
				$row = $(this).find('.megaslider__row--active').next();
				if ( 0 == $row.length ) {
					$row = $(this).find('.megaslider__row');
				}
				$row.eq(0).trigger('thisSlide');
			});

		// Animate first label
		$(this)
			.closest('.megaslider')
			.find('.megaslider__slide--active .megaslider__slide__label')
			.animate({
				bottom: 0
			}, 400);

		// Define start, stop, and reset interval triggers
		$(this)
			.on('startInterval', function(event) {
				if ( '1' == $(this).data('autoplay') ) {
					var $slider = $(this);
					$slider.data('interval', setInterval(function () {
						$slider.trigger('nextSlide');
					}, parseInt( $slider.data('delay') ) * 1000 ) );
				}
			}).on('stopInterval', function(event) {
				clearInterval( $(this).data('interval') );
			}).on('resetInterval', function(event) {
				$(this).trigger('stopInterval').trigger('startInterval');
			});

		// Activate autoplay trigger
		$(this).trigger('startInterval');

	});
})(jQuery);