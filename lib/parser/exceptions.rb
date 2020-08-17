# frozen_string_literal: true

# Abstract exceptions raised from Error
module Parser
  class Error < StandardError; end
  class FileNotFoundException < StandardError; end
  class InvalidExtensionException < StandardError; end
end
