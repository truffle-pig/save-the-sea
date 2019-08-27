package team.truffle.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class PythonCallTest {
	public static void main(String [] args) {

		String s = null;

		try {
			// print a message
			System.out.println("Executing python code");
//        sys.path.append("C:/Python/Mymodules");
			Process process = Runtime.getRuntime()
					.exec("C:\\Users\\miho7\\Anaconda3\\python.exe C:\\Users\\miho7\\darkflow\\");

			BufferedReader stdInput = new BufferedReader(new InputStreamReader(process.getInputStream()));

			BufferedReader stdError = new BufferedReader(new InputStreamReader(process.getErrorStream()));

			// read the output from the command
			System.out.println("python should be run.");
			while ((s = stdInput.readLine()) != null) {
				System.out.println(s);
			}

			System.out.println("Here is the standard error of the command (if any):\n");
			while ((s = stdError.readLine()) != null) {
				System.out.println(s);
			}

			System.exit(0);
		} catch (IOException e) {
			e.printStackTrace();
			System.exit(-1);
		}
	}
}
