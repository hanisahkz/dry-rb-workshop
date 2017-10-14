#this is a very basic dry setup
require "dry-struct"
require "dry-types"

module Types
  include Dry::Types.module

  #exe begin here
  ArticleStatus = Strict::String.default("draft").enum("draft", "published")
end
