class Position

    attr_reader :offset

    def initialize()
        @offset = 0
    end

    # Go to next position and return true. If we reached the last one,
    # cycle back to the first one and return false.
    def shift
        if @offset == DISK_SIZE - 1
            @offset = 0
            return false
        else
            @offset += 1
            return true
        end
    end
end
