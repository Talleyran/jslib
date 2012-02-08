require 'rake'
require 'rake/tasklib'

module Jslib
  class Tasks < ::Rake::TaskLib
    attr_accessor :libspec, :jslib, :libspec_building_block

    def initialize(libspec = nil, &libspec_building_block)
      @libspec = libspec || {}
      self.libspec_building_block = libspec_building_block
      define
    end

    def jslib
      if @jslib.nil?
        @jslib = libspec
        libspec_building_block.call libspec if libspec_building_block
      end
      @jslib
    end

  private

    def define
      desc "desc"
      task :task_name do
        puts jslib[:attr]
      end
    end
  end
end
