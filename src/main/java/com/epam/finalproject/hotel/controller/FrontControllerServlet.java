package com.epam.finalproject.hotel.controller;

import org.apache.log4j.Logger;
import com.epam.finalproject.hotel.controller.command.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/frontControllerServlet"})
public class FrontControllerServlet extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(FrontControllerServlet.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            process(request, response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            process(request, response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }

    /**
     * Main method of this controller.
     */
    private void process(HttpServletRequest request,
                         HttpServletResponse response) throws IOException, ServletException {

        LOG.debug("覧> Controller starts");

        // 1. extract command name from the request
        String commandName = request.getParameter("command");
        LOG.trace("覧> Request parameter: command --> " + commandName);

        // 2. obtain command object by its name
        Command command = CommandContainer.get(commandName);
        LOG.trace("覧> Obtained command --> " + command);

        // 3. execute command and get forward address
        String forward = command.execute(request, response);
        LOG.trace("覧> Forward address --> " + forward);

        LOG.debug("覧> Controller finished, now go to forward address --> " + forward);

        // 4. if the forward address is not null go to the address
        if (forward != null) {
            RequestDispatcher disp = request.getRequestDispatcher(forward);
            disp.forward(request, response);
        }
    }

}

