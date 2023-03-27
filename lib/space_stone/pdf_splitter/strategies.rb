# frozen_string_literal: true

module SpaceStone
  module PdfSplitter
    # Namespace for declaring strategies for splitting PDFs.
    module Strategies
    end
  end
end

require 'space_stone/pdf_splitter/strategies/base'
require 'space_stone/pdf_splitter/strategies/jpg'
require 'space_stone/pdf_splitter/strategies/png'
require 'space_stone/pdf_splitter/strategies/tiff'
