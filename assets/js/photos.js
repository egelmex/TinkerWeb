var mOn = false;

$(window).load( function(){ 
var $container = $('#container');
// initialize
$container.masonry({
  itemSelector: '.item',
  "isFitWidth": true
});
mOn = true

console.log("getign son");
$.getJSON("https://api.flickr.com/services/rest/?method=flickr.photosets.getPhotos&api_key=760a792c2587e990dbbb4a664afa0066&photoset_id=72157626507704899&format=json&jsoncallback=?", function() {
      	console.log( "success" );
})
  .done(function(data) {
    console.log( "second success" );
    console.log(data);
    displayImages(data);
  })
  .fail(function(data) {
    console.log( "error" );
    console.log(data);
  })
  .always(function() {
    console.log( "complete" );
  });

function displayImages(data) {
    console.log("got some data");
    // Start putting together the HTML string
    var htmlString = "";
    
    // Now start cycling through our array of Flickr photo details
    $.each(data.photoset.photo, function(i, item){
	    console.log("adding itmes")
   
	var path = "https://farm" + "1" + ".staticflickr.com/" + item.server + "/" + item.id + "_" + item.secret + "_m.jpg";


	var img = $('<img src="' + path + '" class="item" />'); //Equivalent: $(document.createElement('img'))
//	img.attr('src', path);
	$('#container').append(img).imagesLoaded(function(){
		$('#container').masonry( 'appended', img );
	});
    
    });
    
    	$container = $("#container");
    	$container.imagesLoaded( function() {
  		$container.masonry();
	});
    // Pop our HTML in the #images DIV
}
});

$(window).resize(function(){	
	var $container = $('#container');
	var color = $(".item").css("border-color")
	if (color == "rgb(255, 255, 255)" && mOn) {
		$container.masonry('destroy')
		mOn = false
	} else if (color != "rgb(255, 255, 255)" && !mOn) {
		$container.masonry({
		  itemSelector: '.item',
		  "isFitWidth": true
		});
		mOn = true
	
	}
});

