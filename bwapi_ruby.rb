require 'java'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '\lib')

require 'bwmirror_v2_4.jar'

module Bwapi
	include_package 'bwapi'

	def self.start_bot(klass)
		mirror = Bwapi::Mirror.new
		BotInitializer.new(mirror, klass)
	end

	class BWListener
		include Bwapi::BWEventListener

		def method_missing(name, *args)
			# ignore for now
		end
	end

	class BotInitializer < BWListener
		attr_reader :mirror, :bot_klass

		def initialize(mirror, klass)
			@mirror = mirror
			@bot_klass = klass
			mirror.getModule.setEventListener(self)
			mirror.start_game()
			puts "Starting game.."
		end

		def on_start
			puts "Game started"

			game = mirror.getGame
			player = game.self

			puts "Initializing bot"
			bot = bot_klass.new(game, player)
			mirror.getModule.setEventListener(bot)
			puts "Bot Initialized"
			bot.on_start
		end
	end

	class Bot < BWListener
		attr_reader :game, :player

		def initialize(game, player)
			@game = game
			@player = player
		end
	end
end

