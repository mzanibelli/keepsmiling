class Disk

    attr_reader :position

    def initialize(values)
        @values   = values
        @position = Position.new
    end

    # Move the disk by incrementing it's position's offset.
    def shift
        return @position.shift
    end

    # Read the values of the disk. Shift the default values to the right
    # according to the disk's position's current offset. This method
    # never modifies the values attribute in order to be able to always
    # keep a copy of the default values (when the disk's position's
    # offset is 0).
    def values
        result = @values.clone
        @position.offset.times { result.unshift result.pop }
        return result
    end

    # Read the current value of a tab.
    def value(offset)
        return values[offset]
    end
end
