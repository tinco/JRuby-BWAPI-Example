require '.\src\bwapi_ruby.rb'

class TestBot < Bwapi::Bot
	def on_start
		puts "Game started.."
	end

	def on_frame
		game.drawTextScreen(10, 10, "Playing as #{player.getName} - #{player.getRace}")
	end
end

Bwapi.start_bot(TestBot)
