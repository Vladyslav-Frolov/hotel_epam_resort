package com.epam.finalproject.hotel.controller.command.commands;

import com.epam.finalproject.hotel.Path;
import com.epam.finalproject.hotel.controller.command.Command;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Go to the home page.
 */
public class HomePageCommand extends Command {

	private static final Logger log = Logger.getLogger(HomePageCommand.class);

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		log.debug("Command starts");
		
		String attribute = "Go to the home page";
		request.setAttribute("homePage", attribute);
		log.error("Set the request attribute: homePage --> " + attribute);

		log.debug("Command finished");
		return Path.PAGE_HOME;
	}

}