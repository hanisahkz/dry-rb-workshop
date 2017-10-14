require "dry-validation"
require "types"

module Admin
  module Articles
    FormSchema = Dry::Validation.Form do
      #begin exec
      required(:title).filled
      required(:author_id).filled(:int?)
      required(:status).filled(included_in?: Types::ArticleStatus.values) #we reuse the definition of types inside filled() >> you can also check in console what are the Types being defined
      required(:published_at).maybe(:time?)

      #up to this point we failed. below is the fix where we specify the rule that fits with the business logic
      #if the status is published, then pubslished at should be filled. Not nil
      rule(published_at: [:status, :published_at]) do | status, published_at |
        status.eql?("published").then(published_at.filled?)
      end
    end
  end
end
