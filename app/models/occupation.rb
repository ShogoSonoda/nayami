class Occupation < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: '事務系'},
    {id: 3, name: '営業系'},
    {id: 4, name: '販売系'},
    {id: 5, name: 'IT系'},
    {id: 6, name: '技術系'},
    {id: 7, name: '専門系'},
    {id: 8, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :users
end