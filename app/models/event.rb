class Event < ActiveRecord::Base
    
    validates_presence_of :name
    #資料驗證  名子欄位必填
end
