require '.\src\bwapi_ruby.rb'

class TestBot < Bwapi::Bot
	def on_start
		puts "Game started.."
	end

	def on_frame
		game.draw_text_screen(10, 10, "Playing as #{player.name} - #{player.race}")
	end
end

Bwapi.start_bot(TestBot)
