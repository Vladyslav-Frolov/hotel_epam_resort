package com.epam.finalproject.hotel.controller.command.commands;

import com.epam.finalproject.hotel.Path;
import com.epam.finalproject.hotel.controller.command.Command;
import com.epam.finalproject.hotel.dao.FreeRoomsDao;
import com.epam.finalproject.hotel.model.FreeRooms;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListFreeRoomsCommand extends Command {
    private static final Logger log = Logger.getLogger(ListFreeRoomsCommand.class);

    @Override
    public String execute(HttpServletRequest request,
                          HttpServletResponse response) throws IOException, ServletException {

        System.out.println("Пришло");
        log.debug("Command starts");
        String checkInDate = request.getParameter("check_in_date");
        String checkOutDate = request.getParameter("check_out_date");
        System.out.println(checkInDate + "\n" + checkOutDate);
        if(checkInDate.equals("") || checkOutDate.equals("")){
            request.setAttribute("enter_period", "enter period");
            System.out.println("нет даты");
            return Path.PAGE_HOME;
        }

        // get menu items list
        List<FreeRooms> freeRoomsList = new FreeRoomsDao().getFreeRooms(checkInDate, checkOutDate);
        log.trace("Found in DB: menuItemsList --> " + freeRoomsList);

        // sort menu by category
        freeRoomsList.sort((o1, o2) -> (int) (o1.getId() - o2.getId()));

        // put menu items list to the request
        request.setAttribute("freeRoomsList", freeRoomsList);
        log.trace("Set the request attribute: menuItems --> " + freeRoomsList);

        System.out.println("Ушло");
        log.debug("Command finished");
        return Path.PAGE_HOME;
    }
}
