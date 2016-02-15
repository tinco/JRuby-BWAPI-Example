import org.jruby.embed.ScriptingContainer;
import java.nio.charset.*;
import java.nio.file.*;
import java.io.IOException;

public class Run {
	public static void main(String[] args) {
		ScriptingContainer container = new ScriptingContainer();
		try {
			container.runScriptlet(readFile(args[0], StandardCharsets.UTF_8));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	static String readFile(String path, Charset encoding) 
		throws IOException 
	{
		byte[] encoded = Files.readAllBytes(Paths.get(path));
		return new String(encoded, encoding);
	}
}


