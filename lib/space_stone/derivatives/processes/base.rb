# frozen_string_literal: true

module SpaceStone
  module Derivatives
    module Processes
      class Base
        ##
        # @param repository [Repository]
        # @param derivative [Types::BaseType]
        def self.call(repository:, derivative:)
          new(repository: repository, derivative: derivative).call
        end

        ##
        # @param repository [Repository]
        # @param derivative [Types::BaseType]
        def initialize(repository:, derivative:)
          @repository = repository
          @derivative = derivative
        end
        attr_reader :repository, :derivative

        def call
          raise NotImplementedError
        end
      end
    end
  end
end