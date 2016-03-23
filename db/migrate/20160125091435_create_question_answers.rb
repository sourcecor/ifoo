class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
