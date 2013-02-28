module DotMailer
  class DataField
    def self.client
      DotMailer.client
    end

    def self.all
      fields = client.get '/data-fields'

      fields.map { |attributes| new(attributes) }
    end

    def self.create(name, options = {})
      options[:type]       ||= 'String'
      options[:visibility] ||= 'Public'

      client.post_json(
        '/data-fields',
        'name'         => name,
        'type'         => options[:type],
        'visibility'   => options[:visibility],
        'defaultValue' => options[:default]
      )

      true
    end

    def initialize(attributes)
      self.attributes = attributes
    end

    def name
      attributes['name']
    end

    def type
      attributes['type']
    end

    def visibility
      attributes['visibility']
    end

    def default
      attributes['defaultValue']
    end

    def to_json(options = {})
      attributes.to_json
    end

    def to_s
      %{#{self.class.name} name: "#{name}", type: "#{type}", visibility: "#{visibility}", default: "#{default}"}
    end

    def ==(other)
      attributes == other.attributes
    end

    def date?
      type == 'Date'
    end

    protected
    attr_accessor :attributes
  end
end
