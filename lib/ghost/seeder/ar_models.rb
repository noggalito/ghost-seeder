require "active_record"

class ActiveRecord::Base
  self.inheritance_column = nil
end

class Tag < ActiveRecord::Base
end

class Post < ActiveRecord::Base
end

class User < ActiveRecord::Base
end

class Setting < ActiveRecord::Base
end

class PostTag < ActiveRecord::Base
  self.table_name = "posts_tags"
end
