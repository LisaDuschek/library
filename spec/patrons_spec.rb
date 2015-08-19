require("spec_helper")

describe(Patrons) do
  describe("#==") do
    it("is the same patron if it has the same name") do
      patron1 = Patrons.new({:name => "Bob", :patron_id => "patron_id"})
      patron2 = Patrons.new({:name => "Bob", :patron_id => "patron_id"})
      expect(patron1).to(eq(patron2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Patrons.all()).to(eq([]))
    end
  end

end
