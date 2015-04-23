require 'rmagick'
 include Magick

 def drawImage(myText, fileName, imagePath)
   
   cat = ImageList.new(imagePath)
   
   canvas = Magick::ImageList.new
   canvas.new_image(300, 90, Magick::TextureFill.new(cat))
  # canvas.new_image(300, 90){self.background_color = "#BBEADB"}
	
   text = Magick::Draw.new
   text.font_family = 'helvetica'
   text.pointsize = 25
   text.gravity = Magick::CenterGravity

   text.annotate(canvas, 0,0,2,2, myText) {
      self.fill = 'gray83'
   }

   text.annotate(canvas, 0,0,-1.5,-1.5, myText) {
      self.fill = 'gray40'
   }

   text.annotate(canvas, 0,0,0,0, myText) {
      self.fill = 'darkred'
   }

   canvas.write(fileName)
  end 


  
 
 
 
 
 #Text = "AD Space\nCat-RHB-03"
 #fileName = 'cat-rhb-03.png'
 
 pages = ['Home', 'Cat', 'Tag', 'Archive', 'Year', 'Month', 'Cat1', 'Tag1', 'About', 'Post']
 
 panels = ['Ban', 'LHB', 'RHB']
 
 slots = [1, 2, 3, 4]
 
 
 images = ["/home/abul/Downloads/images/beautiful_natural_scenery_04_hd_pictures_166229.jpg", "/home/abul/Downloads/images/beautiful_nature_landscape_05_hd_picture_166223.jpg",
 "/home/abul/Downloads/images/canoe_water_nature_221611.jpg", "/home/abul/Downloads/images/sky_sunset_nature_216079.jpg",
 "/home/abul/Downloads/images/nature_flower_sky_218344.jpg", "/home/abul/Downloads/images/beautiful_natural_scenic_03_hd_picture_166230.jpg",
 "/home/abul/Downloads/images/beautiful_nature_landscape_04_hd_picture_166204.jpg", "/home/abul/Downloads/images/flower_violet_nature_220177.jpg",
 "/home/abul/Downloads/images/poppy_flower_nature_219157.jpg", "/home/abul/Downloads/images/tree_meadow_nature_220408.jpg",
 "/home/abul/Downloads/images/wild_flowers_wild_plants_nature_217563.jpg", 
 "/home/abul/Downloads/images/brandenburg_germany_nature_217279.jpg"]
 
 pages.each do
	|pg|
	puts pg
	panels.each do
		|pnl|
		puts pnl
		slots.each do
			|slot|
			puts slot
			Text = "Ad Space\n" + pg + "-" + pnl + "-" + slot.to_s
			fileName = pg + "-" + pnl + "-" + slot.to_s + ".png"
			imageindex = rand(0..11)
			drawImage(Text, fileName, images[imageindex])
		end
	end
 end
 exit			
 
 #cat = ImageList.new("/home/abul/Downloads/images/beautiful_natural_scenery_04_hd_pictures_166229.jpg")
 #cat = ImageList.new("/home/abul/Downloads/images/beautiful_nature_landscape_05_hd_picture_166223.jpg")
 #cat = ImageList.new("/home/abul/Downloads/images/canoe_water_nature_221611.jpg")
 #cat = ImageList.new("/home/abul/Downloads/images/sky_sunset_nature_216079.jpg")
 
 #cat = ImageList.new("/home/abul/Downloads/images/nature_flower_sky_218344.jpg")
 #cat = ImageList.new("/home/abul/Downloads/images/beautiful_natural_scenic_03_hd_picture_166230.jpg")
 #cat = ImageList.new("/home/abul/Downloads/images/beautiful_nature_landscape_04_hd_picture_166204.jpg")
 #cat = ImageList.new("/home/abul/Downloads/images/flower_violet_nature_220177.jpg")
 
 #cat = ImageList.new("/home/abul/Downloads/images/poppy_flower_nature_219157.jpg")
 #cat = ImageList.new("/home/abul/Downloads/images/tree_meadow_nature_220408.jpg")
 #cat = ImageList.new("/home/abul/Downloads/images/wild_flowers_wild_plants_nature_217563.jpg")
 #cat = ImageList.new("/home/abul/Downloads/images/brandenburg_germany_nature_217279.jpg")
 
 
