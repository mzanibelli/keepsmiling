class Game

    attr_reader :points
    attr_reader :disks

    def initialize(data)
        @points = 0
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

    # Test every possible position by moving each disk except the base.
    # If the current position is valid, add one point. Each position
    # triggers a yield in order to print the array if needed.
    def resolve
        while @disks[1].shift
            while @disks[2].shift
                while @disks[3].shift
                    while @disks[4].shift
                        if win?
                            @points += 1
                        end
                        yield
                    end
                end
            end
        end
    end

    # Return the offset of each disk's position.
    def solution
        return @disks.map do |disk|
            disk.position.offset
        end
    end
end
