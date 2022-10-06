class Comment < ApplicationRecord
validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
validates_presence_of :name,:message
has_many :commentshavecomments
has_many :comments, through: :commentshavecomments, source: :othercomment
attr_accessor :comment, :comment_post_ID,:author,:comment_parent
before_validation :validatesattribute
after_save :aftersave
def validatesattribute
self.name=self.author
self.message=self.comment
end
def aftersave
if self.comment_parent != '0'
begin
Comment.find(self.comment_parent).comments << self
rescue => e
p e.inspect
end


end
end
end