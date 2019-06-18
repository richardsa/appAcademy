require_relative "room"

class Hotel
  
  def initialize(name, rooms)
    @name = name
    @rooms = Hash.new
    rooms.each do |room_names, capacity|
      @rooms[room_names] = Room.new(capacity)
    end
  end
  
  def name 
    names = @name.split 
    names.each_with_index do |name, idx|
      names[idx] = name.capitalize
    end
    
    names.join(' ')
  end
  
  def rooms
    @rooms
  end
  
  def room_exists?(name)
    @rooms.has_key?(name)
  end
  
  def check_in(person, room_name) 
    if !self.room_exists?(room_name)
      print 'sorry, room does not exist'
    else
      if @rooms[room_name].add_occupant(person)
        print 'check in successful'
      else 
        print 'sorry, room is full'
      end
    end
  end
  
  def has_vacancy?
    all_full = @rooms.all? do |room_name, room_info|
      @rooms[room_name].full? 
    end
    !all_full
  end
  
  def list_rooms
    @rooms.each do |room_name, room_info| 
      puts room_name + " " + @rooms[room_name].available_space.to_s
    end
  end
  
end
