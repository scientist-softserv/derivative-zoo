# frozen_string_literal: true

require_relative 'derivatives/version'
require 'active_support'
require 'active_support/core_ext/class/attribute'
require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/string/inflections'

require 'space_stone/derivatives/exceptions'
require 'space_stone/derivatives/configuration'
require 'space_stone/derivatives/environment'
require 'space_stone/derivatives/manifest'
require 'space_stone/derivatives/process'
require 'space_stone/derivatives/storage_adapters'
require 'space_stone/derivatives/queue_adapters'
require 'space_stone/derivatives/type'
require 'space_stone/derivatives/types'

# These are the files conceptually lifted from the IIIF Print gem.
require 'space_stone/derivatives/pdf_pages_summary'
require 'space_stone/derivatives/technical_metadata'
require 'space_stone/derivatives/page_splitters'
require 'space_stone/derivatives/text_extractors'
require 'space_stone/derivatives/utilities'

module SpaceStone
  ##
  # Welcome to SpaceStone::Derivatives, a gem responsible
  module Derivatives
    def self.config
      @config ||= Configuration.new
      yield(@config) if block_given?
      @config
    end

    def self.logger
      # For testing I really want to set a Logger::FATAL level so I'm not seeing all of the chatter.
      @logger ||= Logger.new(STDERR, level: Logger::FATAL)
    end

    ##
    # @api public
    #
    # @param manifest [SpaceStone::Derivatives::Manifest::Original]
    def self.start_processing!(manifest:)
      Environment.start_processing!(manifest: manifest)
    end
  end
end
