package com.epam.finalproject.hotel.controller;


import com.epam.finalproject.hotel.dao.ConnectionPool;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(urlPatterns = {"/home"})
public class FrontControllerServlet extends HttpServlet {

    public static final String SELECT_QUERY_COMPLEX = "SELECT r.id                                                 'id',\n" +
            "       rt.full_name                                                                                   'room type',\n" +
            "       rc.name                                                                                        'room classes',\n" +
            "       rt.number_of_adults + rt.number_of_children                                                    'num',\n" +
            "       rt.number_of_adults                                                                            'adults',\n" +
            "       rt.number_of_children                                                                          'children',\n" +
            "       CAST((UNIX_TIMESTAMP('2020-10-14') - UNIX_TIMESTAMP('2020-10-01')) / (60 * 60 * 24) as SIGNED) 'days',\n" +
            "       r.cost_per_day                                                                                 `cost per day`,\n" +
            "       ROUND(((UNIX_TIMESTAMP('2020-10-14') - UNIX_TIMESTAMP('2020-10-01')) / (60 * 60 * 24) * r.cost_per_day),\n" +
            "             2)                                                                                       `total price`\n" +
            "FROM rooms r\n" +
            "         JOIN room_classes rc ON r.class_id = rc.id\n" +
            "         JOIN room_types rt ON r.type_id = rt.id\n" +
            "WHERE r.id NOT IN (\n" +
            "    SELECT r.id\n" +
            "    FROM hotel.order_flow ofl\n" +
            "             JOIN rooms r ON ofl.room_id = r.id\n" +
            "    WHERE ofl.check_out > '2020-10-01'\n" +
            "      and ofl.check_in < '2020-10-14'\n" +
            "      and ofl.room_order_status_id IN (1, 3, 4))";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        resp.setCharacterEncoding("cp1251");
        PrintWriter pw = resp.getWriter();


        pw.println("Сервлет начал работу...\n");

        try (Connection connection = ConnectionPool.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(SELECT_QUERY_COMPLEX)) {

            while (rs.next()) {
                pw.println(rs.getString("num"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try (ResultSet rs = ConnectionPool.getConnection().
                createStatement().
                executeQuery(SELECT_QUERY_COMPLEX)) {

            while (rs.next()) {
                pw.println(rs.getString("num"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        pw.println("\nСервлет закончил работу...");


    }

}

