class Game

    def initialize(data)
        @solutions = []
        @disks     = []
        for i in 0...DISK_NUMBER do
            @disks << Disk.new(data[i])
        end
    end

    # Tell if the current position is a solution to the game. Check each
    # tab clockwise : if it's a sad face, the game is lost. If it's a
    # happy face, continue to the next tab. Otherwise, check the value
    # of the next disk's tab.
    def win?
        for i in 0...DISK_SIZE do
            @disks.reverse_each do |disk|
                value = disk.value(i)
                break if value == OK
                return false if value == KO
            end
        end
        return true
    end

    # Check if the current position wins the game and return true if
    # successfully moved to the next one. Return false if the last
    # position has been verified.
    def shift(i = DISK_NUMBER - 1)
        @solutions << solution if win?
        return true if @disks[i].shift
        return shift(i-1) if i != 1
        return false
    end

    # Test every possible solution in the game and return an array of
    # solutions.
    def solve
        loop { break if !shift }
        return @solutions
    end

    # Return the offset of each disk's position.
    def solution
        return @disks.map { |disk| disk.position.offset }
    end
end
