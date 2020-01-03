class CommandLineInterface 
  attr_accessor :player, :questlog, :quest

def run
  main_music
  sleep 3.0
  display_title
  sleep 3.0
  greet 
  new_player
  sleep 2.0
  stop_main_music
  main_menu
end

def greet
  puts "You're finally awake..."
  sleep 1.5
end

def new_player
  prompt = TTY::Prompt.new
  name = prompt.ask("What's your name, traveller?")
  @player = Player.create(player_name: name, gear: "", renown: 0)
  name 
  sleep 1.5
  system "clear"
end
#----------------------------GRAPHIC METHODS------------------------------------------
def display_title
  title = TTY::Font.new(:doom)
  puts title.write("GRINDLEFELL")
  puts                "                                       ,.=,,==. ,,_
                      _ ,====, _    |I|`` ||  `|I `|
                     |`I|    || `==,|``   ^^   ``  |
                     | ``    ^^    ||_,===TT`==,,_ |
                     |,==Y``Y==,,__| \L=_-`'   +J/`
                      \|=_  ' -=#J/..-|=_-     =|
                       |=_   -;-='`. .|=_-     =|----T--,
                       |=/\  -|=_-. . |=_-/^\  =||-|-|::|____
                       |=||  -|=_-. . |=_-| |  =|-|-||::\____
                       |=LJ  -|=_-. . |=_-|_| =||-|-|:::::::
                       |=_   -|=_-_.  |=_-     =|-|-||:::::::
                       |=_   -|=//^\. |=_-     =||-|-|:::::::
                   ,   |/&_,_-|=||  | |=_-     =|-|-||:::::::
                ,--``8%,/    ',%||  | |=_-     =||-|-|%::::::
            ,---`_,888`  ,.'''''`-.,|,|/!,--,.&\|&\-,|&#:::::
           |;:;K`__,...;=\_____,=``           %%%&     %#,---
           |;::::::::::::|       `'.________+-------\   ``
          /8M%;:::;;:::::|                  |        `-------\n\n\n\n"
end

def display_village
puts    " 
           
        /_\ 
       /(_)\ 
       |/^\| 
       // \\    ,@@@@@@@,
      //   \\ ,@@@\@@@@/@@,
     // === \\ @@\@@@/@@@@@
    // =-=-= \\@@@@\@@@@@@;%
   //   ===   \\@@@@@@/@@@%%%,
  //|         |\\@\\//@@%%%%%%
  ~ |         | ~ @|| %\\//%%%
    |  __ __  |    || %%||%%'
    | |  |  | |    ||   ||
    | | -|- | |    ||   ||
    |_|__|__|_|    ||   ||
  /`  =======  `\__||_._||
/`    =======            `\n\n\n\n"               

end

def display_dead
  puts "
                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                  MMMMMMMMMMMM        MMMMMMMMMMMM
                  MMMMMMMMMM            MMMMMMMMMM
                  MMMMMMMMM              MMMMMMMMM
                  MMMMMMMM                MMMMMMMM
                  MMMMMMM                 MMMMMMMM
                  MMMMMMM                  MMMMMMM
                  MMMMMMM                  MMMMMMM
                  MMMMMMM    MMM    MMM    MMMMMMM
                  MMMMMMM   MMMMM   MMMM   MMMMMMM
                  MMMMMMM   MMMMM   MMMM   MMMMMMM
                  MMMMMMMM   MMMM M MMMM  MMMMMMMM
                  MMVKMMMM        M        MMMMMMM
                  MMMMMMMM       MMM      MMMMMMMM
                  MMMMMMMMMMMM   MMM  MMMMMMMMMMMM
                  MMMMMMMMMM MM       M  MMMMMMMMM
                  MMMMMMMMMM  M M M M M MMMMMMMMMM
                  MMMM  MMMMM MMMMMMMMM MMMMM   MM
                  MMM    MMMM M MMMMM M MMMM    MM
                  MMM    MMMM   M M M  MMMMM   MMM
                  MMMM    MMMM         MMM      MM
                  MMM       MMMM     MMMM       MM
                  MMM         MMMMMMMM      M  MMM
                  MMMM  MMM      MMM      MMMMMMMM
                  MMMMMMMMMMM  MM       MMMMMMM  M
                  MMM  MMMMMMM       MMMMMMMMM   M
                  MM    MMM        MM            M
                  MM            MMMM            MM
                  MMM        MMMMMMMMMMMMM       M
                  MM      MMMMMMMMMMMMMMMMMMM    M
                  MMM   MMMMMMMMMMMMMMMMMMMMMM   M
                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
"
end





#-------------------------------MUSIC METHODS------------------------------------------
def play_coin
  pid = fork{exec 'afplay', "lib/music/Track'n'Field_Coin.mp3"}
end


def play_village
  pid = fork{exec 'afplay', "lib/music/Village.mp3"}
end


def end_village
  pid = fork{exec 'afplay', "lib/music/Village.mp3"}
  system "killall afplay"
end


def step
  pid = fork{exec 'afplay', "lib/music/step.mp3"}
end


def main_music
  pid = fork{exec 'afplay', "lib/music/Adventure Meme.mp3"}
end

def stop_main_music
  pid = fork{exec 'afplay', "lib/music/Adventure Meme.mp3"}
  system "killall afplay"
end

def dragon_fight
  pid = fork{exec 'afplay', "lib/music/DragonFight.mp3"}
end


def roar_sfx
  pid = fork{exec 'afplay', "lib/music/ogre1.mp3"}
end


def play_godzilla
  pid = fork{exec 'afplay', "lib/music/Godzilla.mp3"}
end


def victory_music
  pid = fork{exec 'afplay', "lib/music/Victory.mp3"}
end

#-------------------------------TOWN MENU METHODS-----------------------------------------------------

def turk
  display_village
  # @player.quest_logs.map do |quest_inst|
  # if quest_inst.quest_id == 3 && quest_inst.quest_complete? == true
  #   puts "You've already completed this quest."
  #   sleep 1.0
  #   view_all_villagers
    prompt = TTY::Prompt.new
    turk_quest = Quest.find_by(npc_id: 3)
    puts "#{turk_quest.title} - #{turk_quest.quest_desc}"
    sleep 3.0
    quest_accept = prompt.ask("Would you like to accept this quest?")
   if quest_accept == "yes"
      @player.quest_logs.create(quest_id: turk_quest.id, quest_complete?: true)
    sleep 2.0
    play_coin
      puts "You've collected ingot for Turk Sandmanch. You've recieved #{turk_quest.reward} and #{turk_quest.add_renown} renown"
      @player.gear += "\n#{turk_quest.reward}"
      @player.renown += turk_quest.add_renown
      @player.save
    sleep 4.5
    system "clear"
    end_village
    main_menu
   elsif quest_accept == "no"
     system "clear"
     end_village
     town_menu
   else
     puts "There must be dirt in my ears. Please answer yes or no next time"
     sleep 3.0
     system "clear"
     turk
  end
end

def henri
  display_village
  prompt = TTY::Prompt.new
  henri_quest = Quest.find_by(npc_id: 4)
    puts "#{henri_quest.title} - #{henri_quest.quest_desc}"
    sleep 3.0
  quest_accept = prompt.ask("Would you like to accept this quest?")
   if quest_accept == "yes"
    @player.quest_logs.create(quest_id: henri_quest.id, quest_complete?: true)
    sleep 2.0
    play_coin
       puts "You've got back the pie for Henrietta Hill. You've recieved #{henri_quest.reward} and #{henri_quest.add_renown} renown"
       @player.gear += "\n#{henri_quest.reward}"
       @player.renown += henri_quest.add_renown
       @player.save
   sleep 4.5
   system "clear"
   end_village
   main_menu
  elsif quest_accept == "no"
   system "clear"
   end_village
   town_menu
  else
   puts "I couldn't understand you. Please answer yes or no next time"
   sleep 3.0
   system "clear"
   henri
 end
end

def carmine
  display_village
  prompt = TTY::Prompt.new
  carmine_quest = Quest.find_by(npc_id: 5)
    puts "#{carmine_quest.title} - #{carmine_quest.quest_desc}"
    sleep 3.0
  quest_accept = prompt.ask("Would you like to accept this quest?")
    if quest_accept == "yes"
      @player.quest_logs.create(quest_id: carmine_quest.id, quest_complete?: true)
    sleep 2.0
    play_coin
      puts "SSSSSSounds like you had your hands full with that quest for Carmine Cloos. You've recieved the #{carmine_quest.reward} and #{carmine_quest.add_renown} renown"
      @player.gear += "\n#{carmine_quest.reward}"
      @player.renown += carmine_quest.add_renown
      @player.save
    sleep 4.5
    system "clear"
    end_village
    main_menu
  elsif quest_accept == "no"
   system "clear"
   end_village
   town_menu
  else
   puts "Sorry! I misssssed that. Please answer yes or no next time"
   sleep 3.0
   system "clear"
   carmine
 end
end

def gerald 
  display_village
  prompt = TTY::Prompt.new
  gerald_quest = Quest.find_by(npc_id: 6)
    puts "#{gerald_quest.title} - #{gerald_quest.quest_desc}"
    sleep 3.0
  quest_accept = prompt.ask("Would you like to accept this quest?")
    if quest_accept == "yes"
     @player.quest_logs.create(quest_id: gerald_quest.id, quest_complete?: true)
    sleep 2.0
    play_coin
      puts "You've fixed the roof for Gerlad Sadmoon. You've recieved #{gerald_quest.reward} and #{gerald_quest.add_renown} renown"
      @player.gear += "\n#{gerald_quest.reward}"
      @player.renown += gerald_quest.add_renown
      @player.save
    sleep 4.5
    system "clear"
    end_village
    main_menu
  elsif quest_accept == "no"
   system "clear"
   end_village
   town_menu
  else
   puts "Do you have a leak in your head? Please answer yes or no next time"
   sleep 3.0
   system "clear"
   gerald
 end
end

def ingrid 
  display_village
  prompt = TTY::Prompt.new
  ingrid_quest = Quest.find_by(npc_id: 7)
    puts "#{ingrid_quest.title} - #{ingrid_quest.quest_desc}"
    sleep 3.0
  quest_accept = prompt.ask("Would you like to accept this quest?")
    if quest_accept == "yes"
      @player.quest_logs.create(quest_id: ingrid_quest.id, quest_complete?: true)
    sleep 2.0
    play_coin
      puts "You protected Ingrid Welspit from a bunch of creepers. You've recieved #{ingrid_quest.reward} and #{ingrid_quest.add_renown} renown"
      @player.gear += "\n#{ingrid_quest.reward}"
      @player.renown += ingrid_quest.add_renown
      @player.save
   sleep 4.5
   system "clear"
   end_village
   main_menu
 elsif quest_accept == "no"
   system "clear"
   end_village
   town_menu
 else
   puts "Now is not the time for such gibberish. Please answer yes or no next time"
   sleep 3.0
   system "clear"
   ingrid
 end
end

def stockades 
  display_village
  prompt = TTY::Prompt.new
  stockades_quest = Quest.find_by(npc_id: 8)
    puts "#{stockades_quest.title} - #{stockades_quest.quest_desc}"
  sleep 3.0
  quest_accept = prompt.ask("Would you like to accept this quest?")
    if quest_accept == "yes"
      @player.quest_logs.create(quest_id: stockades_quest.id, quest_complete?: true)
  sleep 2.0
  play_coin
      puts "You put in some coins for Stockades Guy's horse. He won't be needing it, though. You've recieved #{stockades_quest.reward} and #{stockades_quest.add_renown} renown"
      @player.gear += "\n#{stockades_quest.reward}"
      @player.renown += stockades_quest.add_renown
      @player.save
   sleep 4.5
   system "clear"
   end_village
   main_menu
 elsif quest_accept == "no"
   system "clear"
   end_village
   town_menu
 else
   puts "I didn't get a lick of that. Please answer yes or no next time"
   sleep 3.0
   system "clear"
   stockades
 end
end
  
def view_all_villagers
  display_village
  prompt = TTY::Prompt.new
    villager = prompt.select("Please select a villager to accept their quest.", %w(Turk_Sandmanch Henrietta_Hill Carmine_Cloos Gerald_Sadmoon Ingrid_Welspit Stockades_Guy))
    if villager == "Turk_Sandmanch"
      system "clear"
      turk
    elsif villager == "Henrietta_Hill"
      system "clear"
       henri
    elsif villager == "Carmine_Cloos"
      system "clear"
      carmine
    elsif villager == "Gerald_Sadmoon"
      system "clear"
      gerald
    elsif villager == "Ingrid_Welspit"
      system "clear"
      ingrid
    elsif villager == "Stockades_Guy"
      system "clear"
      stockades
    else 
      return
    end
end

def town_menu
  display_village
  play_village
  prompt = TTY::Prompt.new
  town = prompt.select("Welcome to Grindlefell, select a villager to view their quests!", %w(View_all_villagers Main_Menu))
  if town == "View_all_villagers"
    system "clear"
    view_all_villagers
  elsif town == "Main_Menu"
    system "clear"
    end_village
    main_menu
  else
    return
  end
  end
end

#---------------------------------CHANGE NAME-----------------------------------------------------

def change_name
  change = TTY::Prompt.new
    puts "Hello, #{@player.player_name}. I'm the mystical name changer. Let's give you a heroic new name!"
    new_name = change.ask("What would you like to be called?")
  @player.update(player_name: new_name)
  sleep 1.0
  play_coin
  puts "Ahh! #{@player.player_name}!! Now that's the name of Grindlefell's next hero!"
  sleep 3.5
  system "clear"
  main_menu
end

#--------------------------------VIEW QUESTS------------------------------------------------------

def view_my_quests
  prompt = TTY::Prompt.new
  all_quests = @player.quests
  all_quests.reload
  if all_quests.length == 0 
    puts "You have nothing in your Quest Log."
  else
    all_quests.each do |quest|
    puts "\n#{quest.title} - #{quest.quest_desc}\n"
    sleep 2.0
    end
  end
  sleep 2.0
  go_back = prompt.select("\n Select 'Go Back' to return to the main menu", %w(Go_Back))
  if go_back == "Go_Back"
    system "clear"
    main_menu
  end
end

#-----------------------------------VIEW GEAR----------------------------------------------------

def view_my_gear
  prompt = TTY::Prompt.new
  if @player.gear.size == 0
    puts "You don't have any gear!"
  else
  puts @player.gear
  sleep 2.0
  end
  sleep 2.0
  go_back = prompt.select("\n Select 'Go Back' to return to the main menu", %w(Go_Back))
  if go_back == "Go_Back"
    system "clear"
    main_menu
   end
end

#-----------------------------------VIEW RENOWN-----------------------------------------------------

def view_my_renwon
  prompt = TTY::Prompt.new
  if @player.renown == 0
    puts "Your name means nothing in Grindlefell! Help the villagers to increase your renown."
  else
  puts "\n#{@player.renown}"
  sleep 2.0
  end
  sleep 2.0
  go_back = prompt.select("\n Select 'Go Back' to return to the main menu", %w(Go_Back))
  if go_back == "Go_Back"
    system "clear"
    main_menu
   end
end

#-----------------------------------DRAGON METHODS----------------------------------------------------

def correct_gear
  main_music
  sleep 4.0
  prompt = TTY::Prompt.new
  beast = Quest.create(title: "The Dragon", quest_desc: "Our dear Grindlefell is nothing like the kingdom it once was.\n Ever since the dragon known as Tom Brady has taken roost in the nearby mountains, we're powerless to defend ourselves. Please, slay the dragon, and Grindlefell will love you dearly", reward: "Tom Brady's Skull", add_renown: 50, npc_id: 10)
  sleep 2.0
    puts "#{beast.title} - #{beast.quest_desc}"
  sleep 2.0
  final_battle = prompt.ask("Will you enter Tom Brady's cave?")
  if final_battle == "yes"
    @player.quest_logs.create(quest_id: beast.id, quest_complete?: true)
    sleep 4.0
    stop_main_music
    step
    sleep 0.5
    roar_sfx
    sleep 0.5
    dragon_fight
  sleep 4.0
    puts "Battered, beaten, and bruised. You emerge from Tom Brady's cave dragging his goat-like reptilian skull.\n You have won."
    @player.gear += "\n#{beast.reward}"
    @player.renown += beast.add_renown 
    @player.save
    play_coin
  sleep 5.0
    system "clear"
    main_menu
  elsif final_battle == "no"
    system "clear"
    main_menu
  else puts "Tom Brady's roar is too loud! A simple yes or no will work..."
  sleep 3.0
    system "clear"
    correct_gear
  end
end

def incorrect_gear
  prompt = TTY::Prompt.new
  dead = TTY::Font.new(:doom)
  sleep 2.0
  puts "You don't have the right gear to slay a dragon! You need a Sword, a Shield, Armor, and a Horse!"
  sleep 2.5
  dragon = prompt.ask("Travel to the dragon's lair anyway?")
  if dragon == "yes"
    oops = Player.find_by(id: @player.id)
    oops.destroy
    puts "You walk into the dark cave..."
    step
    sleep 3.0
    puts "It's quiet..."
    step
    sleep 3.0
    puts "What's that sound?!"
    sleep 2.0
    roar_sfx
    puts "Look out!!!"
    #sfx
    sleep 2.0
    puts dead.write("YOU ARE DEAD!")
    play_godzilla
    display_dead
    sleep 12.5
    puts dead.write("GAME OVER")
    sleep 12.5
    puts "Starting new game..."
    sleep 2.0
    system "clear"
    run
  elsif dragon == "no"
    system "clear"
    main_menu
  else puts "You must be scared if you can't say a simple yes or no..."
    sleep 3.0
    system "clear"
    correct_gear
  end
end

def dragon_message
  gear_check = @player.quest_ids
    if gear_check.include?(2) && gear_check.include?(6) && gear_check.include?(8) && gear_check.include?(9)
     correct_gear
    else
     incorrect_gear
  end
end

#--------------------------------------KINGDOM METHODS------------------------------------------------

def kingdom_message
  prompt = TTY::Prompt.new
  font = TTY::Font.new(:doom)
  if @player.renown < 150
    puts "You must have the highest renown in all the land if you want to save the kingdom!\n Getting rid of that dragon wouldn't hurt, too."
    sleep 2.0
    go_back = prompt.select("Select 'Go Back' to return to the main menu", %w(Go_Back))
    go_back == "Go_Back"
    system "clear"
    main_menu
  else 
    victory_music
    sleep 2.0
    puts display_title
    puts font.write("YOU WIN")
    sleep 26.0
    system "clear"
    run
  end
end
#--------------------------------------EXIT METHOD------------------------------------------------------
def exit_game
  oops2 = Player.find_by(id: @player.id)
  oops2.destroy
  puts "Maybe you can try again another Knight...Thanks for Playing!"
  sleep 10.0
  system "clear"
  run
end

#-----------------------------------MAIN MENU METHODS---------------------------------------------------

#main menu 
def main_menu
  prompt = TTY::Prompt.new
  first = prompt.select("Greetings, #{@player.player_name}. Select Go to Town to start your adventure!", %w(Go_to_Town Change_my_Name View_my_Quests View_my_Inventory View_my_Renown Slay_the_Dragon Save_the_Kingdom Exit_Game))
  #binding.pry
  if first == "Go_to_Town"
    system "clear"
    town_menu
  elsif first == "Change_my_Name"
    system "clear"
    change_name
  elsif first == "View_my_Quests"
    system "clear"
    view_my_quests  #Shows all a players quests
  elsif first == "View_my_Inventory"
    system "clear"
    view_my_gear   #Shows all a players gear
  elsif first == "View_my_Renown"
    system "clear"
    view_my_renwon #Shows a players total renown
  elsif first == "Slay_the_Dragon"
    system "clear"
    dragon_message
  elsif first == "Save_the_Kingdom"
    system "clear"
    kingdom_message
  elsif first == "Exit_Game"
    system "clear"
    exit_game
  else 
    return 
  end
end
