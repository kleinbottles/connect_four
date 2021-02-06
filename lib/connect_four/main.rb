#/lib/connect_four/main.rb
require_relative "../connect_four/game.rb"
require_relative "../connect_four/player.rb"

puts "Welcome to Connect Four.".red
puts ""
puts "Enter player 1's name:"
p1_name = gets.chomp
puts "Enter player 2's name:"
p2_name = gets.chomp

p1 = ConnectFour::Player.new(p1_name, "black")
p2 = ConnectFour::Player.new(p2_name, "red")
players = [p1, p2]
ConnectFour::Game.new(players).play