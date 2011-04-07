package sample;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

import org.antlr.runtime.ANTLRStringStream;
import org.antlr.runtime.CommonTokenStream;
import org.antlr.runtime.RecognitionException;

import parser.NumeralsLexer;
import parser.NumeralsParser;

public class NumeralsMain {

	public static void main(String[] args) {
		System.out.println();

		for (String file : args) {
			try {
				System.out.println("--------------------------------------------------");
				System.out.println("Processing file '" + file + "' ...");
				int ok = 0;
				int failed = 0;
				BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
				int num = 0;
				while (true) {
					String input = br.readLine();
					if (input == null) {
						break;
					}
					num++;
					System.out.println("----------");
					System.out.println("Line #" + num + ": " + input);

					NumeralsLexer lexer = new NumeralsLexer(new ANTLRStringStream(input + ";"));
					CommonTokenStream tokens = new CommonTokenStream(lexer);
					NumeralsParser parser = new NumeralsParser(tokens);
					boolean succeeded = false;
					try {
						parser.start();
						succeeded = (parser.getNumberOfSyntaxErrors() == 0) && (lexer.getNumberOfSyntaxErrors() == 0);
					} catch (RecognitionException e) {
						e.printStackTrace();
					}
					if (succeeded) {
						ok++;
						System.out.println("OK");
					} else {
						failed++;
						System.out.println("FAILED");
					}
				}
				System.out.println();
				System.out.println("OK: " + ok + " / FAILED: " + failed);
				System.out.println("--------------------------------------------------");
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}