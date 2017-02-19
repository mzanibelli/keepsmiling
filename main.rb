#!/usr/bin/ruby

=begin
********** KEEP SMILING **********
Author : mzanibelli
Date   : Mon Feb 20 01:28:53 CET 2017
About  : How to win at the "Keep Smiling" puzzle game
Web    : https://www.spielemine.de/Siebenstein-Spiele
----------------------------------
The game is composed of 5 disks having 15 values. The value is either a
smiling face (the OK constant), a sad face (the KO constant), or no face
at all (the NO constant). Every disk can move except the first one (the
base). If they have any, their values cover the values of the previous
disks. You win the game when you can only see smiling faces. In order to
identify the disks, they are given a number between 1 and 5. This number
can be seen at the extremity of the first value of the disk. The disk
n°1 is the base and it doesn't have an empty value. At start, the disks
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
OK          = 1
KO          = 0
NO          = nil
DISK_NUMBER = 5
DISK_SIZE   = 15
DATA        = [
    [KO, KO, OK, KO, KO, KO, OK, KO, KO, KO, KO, KO, OK, KO, KO], # Disk n°1
    [KO, NO, NO, OK, NO, NO, NO, NO, KO, NO, NO, OK, NO, KO, NO], # Disk n°2
    [OK, NO, NO, OK, NO, NO, NO, NO, OK, NO, OK, NO, KO, NO, NO], # Disk n°3
    [OK, NO, NO, NO, OK, NO, NO, NO, NO, NO, OK, OK, NO, NO, NO], # Disk n°4
    [OK, OK, NO, NO, NO, NO, OK, NO, OK, NO, NO, NO, NO, NO, NO]  # Disk n°5
]

# RUN ############################

game = Game.new(DATA)

game.resolve do
    if game.win?
        puts "SOLUTION #{game.points} : #{game.solution}"
    end
end

exit 0
