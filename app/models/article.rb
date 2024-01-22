class Article < ApplicationRecord
    serialize :tagList, coder: JSON
    before_create :set_slug
  
    
  
    def set_slug
      self.slug = title.to_s.parameterize
    end

    def as_json(options = {})
    super(options.merge({ except: [:id, :updated_at, :created_at],
                          methods: [:createdAt, :updatedAt] }))
    end

    def createdAt
        created_at.iso8601
    end

    def updatedAt
        updated_at.iso8601
    end
end
  