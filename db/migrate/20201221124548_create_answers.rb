class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text       :text,    null: false
      t.references :user,    null: false
      t.references :problem, null: false
      t.timestamps
    end
  end
end
