omodule Fatty
  class Formatter

    class << self

      def formats
        @formats ||= {}
      end

      def format(name, options={}, &block)
        formats[name] = Class.new(Fatty::Format, &block)
      end

      def render(format, params={})
        format_obj = formats[format].new
        format_obj.params = params
        format_obj.render
      end

    end
  end

  class Format
    attr_accessor :params
  end
end

class ListFormatter < Fatty::Formatter
  format :text do
    def render
      params[:data].map{|e| "* #{e}"}.join("\n")
    end
  end

  format :html do
    def render
      list_elements = params[:data].map{|e| "<li>#{e}</li>"}.join("<ul>#{list_elements}</ul>")
    end
  end
end

data = %w[foo bar baz]
[:html, :text].each do |format|
  puts ListFormatter.render(format, :data => data)
end


# initialize method which defines an array
# add method which adds a trait to an array and returns self, which allows us to chain
# build method which will add any semantic sugar and return as required, in the below case an array of symbols without nils
class TraitBuilder
  def initialize
    @traits = []
  end
  def add(trait)
    @traits << trait
    p self
    self
  end
  def build
    @traits.compact
  end
end
trait_builder = TraitBuilder.new
trait_builder.add(:blonde_hair)
trait_builder.add(:blue_eyes).add(:male).add(:black_shirt)
p trait_builder.build





