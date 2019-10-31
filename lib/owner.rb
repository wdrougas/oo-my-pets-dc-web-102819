require "pry"
require_relative = "cat.rb"
require_relative = "dog.rb"

class Owner

  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do |cat|
      if cat.owner == self
        cat
      end
    end
  end

  def dogs
    Dog.all.select do |dog|
      if dog.owner == self
        dog
      end
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.map do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pets = Cat.all + Dog.all
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
    # pets.each do |pet|
    #   pet.owner = nil
    # end
  end

  def list_pets
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end