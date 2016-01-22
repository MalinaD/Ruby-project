 Shoes.app do
   stack do
     @back  = background blue
     @text  = banner "Our appetizing Menu"
     @press = button "Show our daily proposals"

     @text.style size: 22, stroke: red, margin: 10, align: "center"
     @press.style width: 200, height: 50, align: "center"
     @back.style height: 10
   end
 end