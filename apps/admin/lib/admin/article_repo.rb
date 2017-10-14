require "blog/repository"
require "admin/entities"

module Admin
  class ArticleRepo < Blog::Repository[:articles]
    relations :authors #only for rom-3
    commands :create

    struct_namespace Admin::Entities #make sure that when you do this, the file is required on top

    def by_pk(id)
      articles.by_pk(id).one #similar to rails find_by
    end

    def listing
      # articles.order_by_created_at
      # aggregate.combine(:author).order_by_created_at #similar to below. This is going to be deprecated since below is clearer
      articles.combine(:author).order_by_created_at

    end
  end
end
