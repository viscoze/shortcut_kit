require "shortcut_kit"

class Person
  init! :name
  acc!  :name

  def add(a,b)
    a + b
  end
end

p = Person.new("Vlad")
puts p.name
