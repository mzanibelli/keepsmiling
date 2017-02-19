class Disk

    attr_reader :position

    def initialize(values)
        @values   = values
        @position = Position.new
    end

    def shift
        return @position.shift
    end

    def values
        result = @values.clone
        @position.offset.times do
            result.unshift result.pop
        end
        return result
    end

    def value(offset)
        return values[offset]
    end
end
