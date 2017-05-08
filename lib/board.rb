# board.rb
require_relative 'cell'

class Board
  attr_accessor :board_a, :num_flags
  #returns number of mines
  attr_reader :num_mines, :size
  # initialize
  def initialize(size = 10, num_mines = 9, num_flags = 9)
    # creates an array of arrays containing cells
    @size = size
    @board_a = Array.new(size) {Array.new(size) {Cell.new}}
    @num_mines = num_mines
    @num_flags = num_flags
    assign_mines
  end

  # randomly assigns mines to cells
  def assign_mines
    randomizer.each do |num|
      crd = coordinator(num)
      cell = @board_a[crd[0]][crd[1]]
      cell.plant_mine
    end
  end

  #generates an array of randomly selected coordinates
  def randomizer
    output = []
    max = (@size * @size) - 1
    i = 0
    while i < @num_mines
       num = Random.new.rand(max)
       unless output.include?(num)
         output << num
         i += 1
       end
    end
    output.sort
  end

  #This handy tool turns an integer into x, y coordinates for the
  def coordinator(num)
    if num < 10
      [0, num]
    else
      num.to_s.split('').map(&:to_i)
    end
  end

end

class Cell
  attr_accessor :cleared
  attr_reader :mine, :marked, :near_mines
  #initializes a blank cell
  def initialize
    @mine = false
    @marked = false
    @cleared = false
    @near_mines = 0
  end

  def plant_mine
    @mine = true
  end

  def mark_mine
    @marked = true
  end

end

class Renderer
  def initialize(board)
    @board_a = board.board_a
    @size = board.size
  end

  def render_board
    # The size of the board
    range = (0..(@size -1))
    #
    line_brk = "  "
    @size.times {line_brk << "----"}
    top = "   "
    range.each {|e| top << "#{e}   "}
    puts top
    puts line_brk
    range.each do |row|
      new_row = "#{row}|"
      range.each do |col|
        # value =
        new_row << " #{row} |"
      end
      puts new_row
      puts line_brk

    end
  end

  # get_symbol
  def get_symbol(cell)
    #analyes the cell value and returns the appropriate string





  end
end

r = Renderer.new(Board.new)
r.render_board
