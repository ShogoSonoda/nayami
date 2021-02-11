class Industry < ActiveHash::Base
  self.data = [
    { id: 1, name: 'メーカー' },
    { id: 2, name: 'サービス・インフラ' },
    { id: 3, name: '商社(総合・専門)' },
    { id: 4, name: '銀行・証券・保険・金融' },
    { id: 5, name: '情報(広告・通信・マスコミ)' },
    { id: 6, name: '百貨店・専門店・流通・小売' },
    { id: 7, name: 'IT・ソフトウェア・情報処理' },
    { id: 8, name: '公務員' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users
end
