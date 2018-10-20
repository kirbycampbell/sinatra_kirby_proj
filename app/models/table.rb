class Table < ActiveRecord::Base
  has_many :users


end
#>> u.table = t
#=>     #<Table id: 1, table_number: 49>
