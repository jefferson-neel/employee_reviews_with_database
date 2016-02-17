require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'development.sqlite3'
)

class EmployeeMigration < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :department_id
      t.string :name
      t.string :email
      t.string :phone
      t.decimal :salary, precision: 11, scale: 2
      t.text :review
      t.boolean :satisfactory
      t.timestamps
    end
  end
end

class DepartmentMigration < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.timestamps
    end
  end
end

EmployeeMigration.migrate(:up)
DepartmentMigration.migrate(:up)
