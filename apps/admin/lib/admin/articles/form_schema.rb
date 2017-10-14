require "dry-validation"
require "types"

module Admin
  module Articles
    FormSchema = Dry::Validation.Form do
    end
  end
end
