class Position

    attr_reader :offset

    def initialize()
        @offset = 0
    end

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
