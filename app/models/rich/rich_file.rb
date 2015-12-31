require 'cgi'
require 'mime/types'
require 'kaminari'

module Rich
  class RichFile < ActiveRecord::Base
    include Backends::Paperclip

    alias_attribute :name, :rich_file_file_name

    scope :images,  -> { where("rich_rich_files.simplified_type = 'image'") }
    scope :files,   -> { where("rich_rich_files.simplified_type = 'file'") }

    paginates_per Rich.options[:paginates_per]
  end
end
