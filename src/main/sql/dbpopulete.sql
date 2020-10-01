-- room_types

INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Single', 'SGL', '1', '0');
INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Single + Child', 'SGL+CHD', '1', '1');
INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Single + 2 Children', 'SGL+2 CHD', '1', '2');
INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Double', 'DBL', '2', '0');
INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Double twin', 'DBL TWN', '2', '0');
INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Double + Extra Bed', 'DBL+EXB', '3', '0');
INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Double + Child', 'DBL+CHD', '2', '1');
INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Double + 2 Children', 'DBL+2 CHD', '2', '2');
INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Double + Extra Bed + Child', 'DBL+EXB+CHD', '3', '1');
INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Triple', 'TRPL', '3', '0');
INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Triple + Child', 'TRPL+CHD', '3', '1');
INSERT INTO `hotel`.`room_types`
(`full_name`, `abbreviation_name`, `number_of_adults`, `number_of_children`)
VALUES ('Triple + 2 Children', 'TRPL+2CHLD', '3', '2');

-- room_statuses

INSERT INTO `hotel`.`room_statuses` (`name`) VALUES ('unoccupied');
INSERT INTO `hotel`.`room_statuses` (`name`) VALUES ('booked');
INSERT INTO `hotel`.`room_statuses` (`name`) VALUES ('occupied');
INSERT INTO `hotel`.`room_statuses` (`name`) VALUES ('unavailable');

-- roles

INSERT INTO `hotel`.`roles` (`name`) VALUES ('user');
INSERT INTO `hotel`.`roles` (`name`) VALUES ('admin');

-- positions

INSERT INTO `hotel`.`positions` (`name`) VALUES ('manager');

-- room_classes

INSERT INTO `hotel`.`room_classes` (`name`) VALUES ('Junior Suite');
INSERT INTO `hotel`.`room_classes` (`name`) VALUES ('Suite');
INSERT INTO `hotel`.`room_classes` (`name`) VALUES ('De Luxe');
INSERT INTO `hotel`.`room_classes` (`name`) VALUES ('Duplex');
INSERT INTO `hotel`.`room_classes` (`name`) VALUES ('Family Room');
INSERT INTO `hotel`.`room_classes` (`name`) VALUES ('Studio');
INSERT INTO `hotel`.`room_classes` (`name`) VALUES ('Standart');
INSERT INTO `hotel`.`room_classes` (`name`) VALUES ('Bungalow');
INSERT INTO `hotel`.`room_classes` (`name`) VALUES ('Apartament');
INSERT INTO `hotel`.`room_classes` (`name`) VALUES ('Honeymoon Room');

-- booking_statuses

INSERT INTO `hotel`.`booking_statuses` (`name`) VALUES ('booked');
INSERT INTO `hotel`.`booking_statuses` (`name`) VALUES ('expired');

-- payment_statuses

INSERT INTO `hotel`.`payment_statuses` (`name`) VALUES ('expected payment');
INSERT INTO `hotel`.`payment_statuses` (`name`) VALUES ('paid');

-- rooms

INSERT INTO `hotel`.`rooms` (`class_id`, `type_id`, `status_id`, `cost_per_day`, `floor`) VALUES ('1', '1', '1', '300.5', '1');
INSERT INTO `hotel`.`rooms` (`class_id`, `type_id`, `status_id`, `cost_per_day`, `floor`) VALUES ('7', '2', '1', '450.7', '1');
INSERT INTO `hotel`.`rooms` (`class_id`, `type_id`, `status_id`, `cost_per_day`, `floor`) VALUES (7, 3, 1, 570.1, 1);








