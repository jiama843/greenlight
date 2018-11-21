# frozen_string_literal: true

ActiveModel::Serializer.setup do |config|
  config.embed = :ids
end