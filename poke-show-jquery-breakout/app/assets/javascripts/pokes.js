$(function(){
  console.log("I Work");
  var slides = $('.slideShow>div');
  var slideCount = 0;
  var totalSlides = slides.length;

  slides.hide();
  function SlideShow(){
    slides.eq(slideCount).fadeIn(1000).delay(3000).fadeOut(1000, function(){
      slideCount < totalSlides - 1 ? slideCount ++ : slideCount = 0;
      SlideShow();
      })
    }
    SlideShow();
  })
