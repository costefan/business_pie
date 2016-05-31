require 'digest/sha1'
class Encode
  def initialize(key = "Ha, you can`t hack DAISocial.")
    @salt= key
  end

  def self.encrypt(text)
     Digest::SHA1.hexdigest("--#{@salt}--#{text}--")
  end
end

#e= Encode.new("Ha, you can`t hack DAISocial.")

pas1= Encode.encrypt("maksbulgar@gmail.com")
pas2= Encode.encrypt("admin@gmail.com")
pas3= Encode.encrypt("maksbulgar@gmail.com")

puts pas1
puts pas2
puts pas3
