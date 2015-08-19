require("spec_helper")

describe(Books) do
  describe(".all") do
    it("starts off with no books") do
    expect(Books.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      book = Books.new({:name => "Programming", :id => nil})
      expect(book.name()).to(eq("Programming"))
    end
  end

  describe ("#id") do
    it("sets its ID when you save it") do
      book = Books.new({:name => "Programming", :id => nil})
      book.save()
      expect(book.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save books to the database") do
      book = Books.new({:name => "Programming", :id => nil})
      book.save()
      expect(Books.all()).to(eq([book]))
    end
  end

  describe("#==") do
    it("is the same book if it has the same name") do
      book1 = Books.new({:name => "Programming", :id => nil})
    book2 = Books.new({:name => "Programming", :id => nil})
      expect(book1).to(eq(book2))
    end
  end

  describe(".find") do
    it("returns a book by its ID") do
      test_book = Books.new({:name => "Programming", :id => nil})
      test_book.save()
      test_book2 = Books.new({:name => "tffgdxgdx", :id => nil})
      test_book2.save()
      expect(Books.find(test_book2.id())).to(eq(test_book2))
    end
  end

  describe("#patrons") do
    it("returns patron for that book") do
      test_book = Books.new({:name => "Programming", :id => nil})
      test_book.save()
      test_patron = Patrons.new({:name => "Bob", :patron_id => test_book.id()})
      test_patron.save()
      test_patron2 = Patrons.new({:name => "Ruby", :patron_id => test_book.id()})
      test_patron2.save()
      expect(test_book.patrons()).to(eq([test_patron, test_patron2]))
    end
  end









end
