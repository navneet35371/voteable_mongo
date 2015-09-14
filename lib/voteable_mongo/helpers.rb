module Mongo
  module Voteable
    module Helpers

      def self.try_to_convert_string_to_object_id(x)
        if defined?(Mongo::BSON)
          x.is_a?(String) && Mongo::BSON::ObjectId.legal?(x) ? Mongo::BSON::ObjectId.from_string(x) : x
        else
          x.is_a?(String) && BSON::ObjectId.legal?(x) ? BSON::ObjectId.from_string(x) : x
        end
      end

      def self.get_mongo_id(x)
        x.respond_to?(:id) ? x.id : x
      end
    end
  end
end
