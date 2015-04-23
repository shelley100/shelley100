
 require 'rmagick'

   # Demonstrate the annotate method

   Text = 'Ad Space 8'

   #granite = Magick::ImageList.new("gradient:red-blue"){self.size = "100x200" }
   granite = Magick::ImageList.new("granite:red")
   canvas = Magick::ImageList.new
   #canvas.new_image(300, 90, Magick::TextureFill.new(granite))
   canvas.new_image(300, 90){self.background_color = "#BBEADB"}
	
   text = Magick::Draw.new
   text.font_family = 'helvetica'
   text.pointsize = 30
   text.gravity = Magick::CenterGravity

   text.annotate(canvas, 0,0,2,2, Text) {
      self.fill = 'gray83'
   }

   text.annotate(canvas, 0,0,-1.5,-1.5, Text) {
      self.fill = 'gray40'
   }

   text.annotate(canvas, 0,0,0,0, Text) {
      self.fill = 'darkred'
   }

   canvas.write('banner-ad-8.gif')
   
   exit
