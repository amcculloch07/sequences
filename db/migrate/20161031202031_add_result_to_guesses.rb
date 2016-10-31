class AddResultToGuesses < ActiveRecord::Migration
  def change
      add_column :guesses, :result, :string
  end
end
