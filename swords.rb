class Character
  attr_reader :name, :maxhealth, :attack, :defense, :speed, :accuracy
  attr_accessor :health #this can be modified by other players.

  # Method to create a new player.
  def initialize(name)
    @name = name
    #Pair attack and defense so that they add up to 10, that way no character is overpowered
    @attack = rand(1..10)
    @defense = 10 - @attack
    # Other methods - have a narrower window of randomness - the percent differential here isn't dramatic.
    @speed = rand(6..9)
    @accuracy = rand(6..9)
    # health requires two values - a current health that can be modified by other players (i.e. by attacking)
    # a maxhealth that cannot be modified by other players.
    @health = 10
    @maxhealth = 10
    @items = []
  end

  # Method to attack another player
  def fight(opponent)
    # Display the player stats:
    puts "#{self.name}'s attack is #{self.attack}."
    puts "#{opponent.name}'s defense is #{opponent.defense}."
    if self.attack > opponent.defense
      #If the attacker is stronger, decrement the opponent's health
      difference = (self.attack - opponent.defense)
      opponent.health = opponent.health - difference
      puts "#{opponent.name}'s health has been decreased by #{difference}. #{opponent.name} has #{opponent.health} health left."
    else
      #If the opponent was stronger, let the attacher know they withstood the attack.
      puts "#{opponent.name} has withstood #{self.name}'s attack!"
    end
    # idea: This attacking process will get boring very quickly. If an attacker is weaker, he literally cannot win
    # if the attacker is stronger, they still have to attack several times.
    # Right now, the result of such an attack is inevitable and tedious.
    # It also seems like every pair is evenly matched, always. Why is that and how can we fix it?
  end

end

jeff = Character.new("Jeff")
mike = Character.new("Michael")

jeff.fight(mike)
mike.fight(jeff)
