class Table < ActiveRecord::Base
  belongs_to :users


end
#>> u.table = t
#=>     #<Table id: 1, table_number: 49>
