class Restaurant

  def self.create_menu(file_menu, &block)
    menu = Menu.new(file_menu)
    menu.instance_eval(&block)

    menu
  end

class Menu
attr_accessor :name, :items

    def initialize(name)
      @name = name
      @items = Array.new
    end

    def item(header, *tags, &block)
  	 new_item = Item.new(self, header)
     new_item.tags = tags
     new_item.instance_eval(&block)
     @items.push(new_item)

     new_item
    end

    def filter_notes(tag: nil, text: nil, status: nil)
      filter = notes.reject { |note| !note.tags.include?(tag) and tag  }
      filter.delete_if { |note| note.status != status and status }
      filter.delete_if do |note|
        (note.body =~ text) == nil and (note.header =~ text) == nil and text
      end

      filter
    end

end

class Item
attr_accessor :tags, :menu, :header

  def initialize(menu, header)
    @menu = menu
    @header = header
    @status = ""
    @body = ""
  end

  def body(new_body = nil)
    @body = new_body if new_body

    @body
  end

  def status(new_status = nil)
  @status = new_status if new_status

  @status
  end

  def item(header, *tags, &block)
    new_note = Note.new(@menu, header)
    new_note.tags = tags
    new_note.instance_eval(&block)
    @menu.notes.push(new_note)
    new_note
  end


end

end