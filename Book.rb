class Book < ActiveRecord::Base

  def to_s
    "Book id = #{self.id}, title = #{self.title}, author = #{self.author}, year = #{self.year}, publisher = #{self.publisher}"
  end
  

end
