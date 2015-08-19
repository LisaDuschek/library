class Patrons
  attr_reader(:name, :patron_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @patron_id = attributes.fetch(:patron_id)

  end

  define_singleton_method(:all) do
    returned_patrons = DB.exec("SELECT * FROM patrons;")
    patrons = []
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      patron_id = patron.fetch("patron_id").to_i()
      patrons.push(Patrons.new({:name => name, :patron_id => patron_id}))
    end
    patrons
  end

  define_method(:save) do
    DB.exec("INSERT INTO patrons (name, patron_id) VALUES ('#{@name}', #{@patron_id});")
  end

  define_method(:==) do |another_patron|
    self.name().==(another_patron.name()).&(self.patron_id().==(another_patron.patron_id()))
  end





end
