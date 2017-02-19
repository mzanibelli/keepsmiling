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

    def solution
        @disks.map do |disk|
            disk.position.offset
        end
    end
end
