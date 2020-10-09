package com.epam.finalproject.hotel.controller.command;

import com.epam.finalproject.hotel.controller.command.commands.HomePageCommand;
import com.epam.finalproject.hotel.controller.command.commands.NoCommand;
import org.apache.log4j.Logger;

import java.util.Map;
import java.util.TreeMap;

/**
 * Holder for all commands.<br/>
 */
public class CommandContainer {
	private CommandContainer() {
	}

	private static final Logger log = Logger.getLogger(CommandContainer.class);
	
	private static Map<String, Command> commands = new TreeMap<>();
	
	static {
		// commands
		commands.put("noCommand", new NoCommand());
		commands.put("homePage", new HomePageCommand());

		log.debug("Command container was successfully initialized");
		log.trace("Number of commands --> " + commands.size());
	}

	/**
	 * Returns command object with the given name.
	 * 
	 * @param commandName
	 *            Name of the command.
	 * @return Command object.
	 */
	public static Command get(String commandName) {
		if (commandName == null || !commands.containsKey(commandName)) {
			log.trace("Command not found, name --> " + commandName);
			return commands.get("noCommand"); 
		}
		
		return commands.get(commandName);
	}
	
}