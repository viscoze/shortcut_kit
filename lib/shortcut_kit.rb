class Class
  def self.hi
    puts "Hello World!"
  end
  
  def acc!(*args)
    args.each do |arg|
      self.class_eval("def #{arg};@#{arg};end")
      self.class_eval("def #{arg}=(val);@#{arg}=val;end")
    end
  end

  def pre!(args)
    args.each do |name, body|
      self.class_eval("def #{name}?;#{body};end")
    end
  end

  def init!(*args) # init! :a, :b, :c
    param = body = ""
    args.each do |var|
      param += "#{var}"
      body += "@#{var}=#{var};"
      param += "," if args.index(var) != (args.size-1)
    end
    method_string = "def initialize(#{param});#{body}end"
    self.class_eval(method_string)
  end
end
