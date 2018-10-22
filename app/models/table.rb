class Table < ActiveRecord::Base
  belongs_to :user


end
#>> u.table = t
#=>     #<Table id: 1, table_number: 49>
