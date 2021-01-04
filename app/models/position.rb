class Position < ActiveHash::Base
  self.data = [
    # {id: 1, name: '--'},
    {id: 2, name: '一般社員'},
    {id: 3, name: '主任'},
    {id: 4, name: '係長'},
    {id: 5, name: '課長'},
    {id: 6, name: '次長'},
    {id: 7, name: '部長'},
    {id: 8, name: '本部長(事業部長)'},
    {id: 9, name: '常務取締役'},
    {id: 10, name: '専務取締役'},
    {id: 11, name: '代表取締役'},
    {id: 12, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :users
end