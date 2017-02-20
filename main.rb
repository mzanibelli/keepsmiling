#!/usr/bin/ruby

=begin
********** KEEP SMILING **********
Author : Matéo ZANIBELLI (mzanibelli)
Date   : Mon Feb 20 2017
About  : How to win at the "Keep Smiling" puzzle game
Image  : https://www.puzzlemaster.ca/imagecache/products/ffffff/320x320/007/007277.jpg
----------------------------------
The game is composed of 5 disks having 15 values. The value is either a
smiling face (the OK constant), a sad face (the KO constant), or no face
at all (the NO constant). Every disk can move except the first one (the
base). If they have any, their values cover the values of the previous
disks. You win the game when you can only see smiling faces. In order to
identify the disks, they are given a number between 1 and 5. This number
can be seen at the extremity of the first value of the disk. The disk
n°5 is the base and it doesn't have an empty value. At start, the disks
are placed so their numbered radius overlap. This is the position stored
in the global DATA constant. This program tries to solve the puzzle by
testing every possible position in the game (bruteforce).
**********************************
=end

# lib
load "game.rb"
load "disk.rb"
load "position.rb"

# constants
OK          = 1   # Happy face
KO          = 0   # Sad face
NO          = nil # Empty tab
DISK_NUMBER = 5   # Number of disks, must be equal to the number of rows in DATA
DISK_SIZE   = 15  # Number of tabs per disk, must be equal to the number of columns in DATA

# This represents the position where numbered tabs are aligned. Every
# disk's position's offset equals to 0. This data has been manually
# extracted by precisely reporting the values from the real puzzle. It
# may vary according to the version of the game you bought. Note that
# disks indexes are different from disks numbers. For the rest of this
# program, the actual index will be used for convenience.
DATA = [
    [KO, KO, OK, KO, KO, KO, OK, KO, KO, KO, KO, KO, OK, KO, KO], # Disk n°5 (the base)
    [KO, NO, NO, OK, NO, NO, NO, NO, KO, NO, NO, OK, NO, KO, NO], # Disk n°4
    [OK, NO, NO, OK, NO, NO, NO, NO, OK, NO, OK, NO, KO, NO, NO], # Disk n°3
    [OK, NO, NO, NO, OK, NO, NO, NO, NO, NO, OK, OK, NO, NO, NO], # Disk n°2
    [OK, OK, NO, NO, NO, NO, OK, NO, OK, NO, NO, NO, NO, NO, NO]  # Disk n°1
]

# MAIN ###########################

game = Game.new(DATA)

game.solve.each do |solution|

    # About solutions : each solution is an array of offsets. The first
    # element of the array represents the base. Since it can't move,
    # it's offset is always 0. Move the other disks clockwise according
    # to the values to see the smiling faces. Keep smiling !
    p solution

end

exit 0
