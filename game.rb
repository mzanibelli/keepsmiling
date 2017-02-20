class Game

    def initialize(data)
        @solutions = []
        @disks  = []
        for i in 0...DISK_NUMBER do
            @disks << Disk.new(data[i])
        end
    end

    # Tell if the current position is a solution to the game.
    # We're going to look at each tab, from the first to the last.
    # If we see a sad face, the game is lost. If we see a happy face, we
    # continue to the next tab. Otherwise, we check the value of the disk
    # underneath.
    def win?
        for i in 0...DISK_SIZE do
            for j in (DISK_NUMBER - 1).downto(0) do
                value = @disks[j].value(i)
                break if value == OK
                return false if value == KO
            end
        end
        return true
    end

    # Move current disk to next position and return true. If the last
    # position is reached, apply this to the next disk. If the last
    # moving disk is at it's maximum position, return false.
    def shift(i)
        @solutions << solution if win?
        return true if @disks[i].shift
        return shift(i-1) if i != 1
        return false
    end

    # Check current position and move to the next one until every
    # combination is tested.
    def solve
        loop do
            break if !shift(DISK_NUMBER - 1)
        end
        return @solutions
    end

    # Return the offset of each disk's position.
    def solution
        return @disks.map do |disk|
            disk.position.offset
        end
    end
end
