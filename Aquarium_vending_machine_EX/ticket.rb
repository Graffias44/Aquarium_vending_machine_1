
class Ticket
  attr_reader :id, :name, :price
  @@count = 27
  def initialize(ticket_params)
    @id = @@count += 1
    @name = ticket_params[:name]
    @price = ticket_params[:price]
  end
end