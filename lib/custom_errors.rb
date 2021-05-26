class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    self.partner = person
    # We need to tell our program to raise our brand new `PartnerError` when the argument passed into the `#get_married` method is *not* an instance of the `Person` class. We can do that with the `raise` keyword.
    if person.class != Person
      begin
        raise PartnerError
      rescue PartnerError => error
          puts error.message
      end
    else
      person.partner = self
    end
  end

  # Add the following two lines:
  class PartnerError < StandardError
    # Of course we want our program to continue running after we raise the error. It would also be nice to output a custom error message when the error is raised.
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end
end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name




