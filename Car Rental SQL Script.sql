CREATE TABLE ft_rentals(
    rental_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    carstatus_id INTEGER NOT NULL,
    renters_id INTEGER NOT NULL,
    dates_id INTEGER NOT NULL,
    pickupdate DATE NOT NULL,
    returndate DATE,
    priceperhour DECIMAL(8, 2) NOT NULL,
    totalrenthours INTEGER NOT NULL
);

ALTER TABLE ft_rentals DROP COLUMN customer_id

ALTER TABLE ft_rentals ADD PRIMARY KEY(rental_id);


CREATE TABLE dim_carStatus(
    carstatus_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    iscaravailforrent VARCHAR(255) NOT NULL,
    returnstatus VARCHAR(255) NOT NULL,
    totalrenthours INTEGER NOT NULL
);

ALTER TABLE dim_carstatus ADD PRIMARY KEY(carstatus_id);
	
CREATE TABLE dim_renters(
	renters_id INTEGER NOT NULL,
    rentersname VARCHAR(255) NOT NULL,
    rentersemail VARCHAR(255) NOT NULL,
    rentersphone VARCHAR(255) NOT NULL
);

ALTER TABLE dim_renters ADD PRIMARY KEY(renters_id);

CREATE TABLE dim_cars(
    car_id INTEGER NOT NULL,
    carmodel VARCHAR(255) NOT NULL,
    carcostprice BIGINT NOT NULL,
    priceperhour DECIMAL(8, 2) NOT NULL,
    carrating DOUBLE PRECISION NOT NULL
);

ALTER TABLE dim_cars ADD PRIMARY KEY(car_id);

CREATE TABLE dim_dates(
    dates_id BIGINT NOT NULL,
    pickupdate DATE NOT NULL,
    pickupyear DATE NOT NULL,
    pickupmonth DATE NOT NULL,
    pickupday DATE NOT NULL,
    returndate DATE NOT NULL
);

ALTER TABLE dim_dates ADD PRIMARY KEY(dates_id);


ALTER TABLE dim_carStatus ADD CONSTRAINT car_id FOREIGN KEY(car_id) REFERENCES dim_cars(car_id);

ALTER TABLE ft_rentals ADD CONSTRAINT car_id FOREIGN KEY(car_id) REFERENCES dim_cars(car_id);

ALTER TABLE ft_rentals ADD CONSTRAINT dates_id FOREIGN KEY(dates_id) REFERENCES dim_dates(dates_id);

ALTER TABLE ft_rentals ADD CONSTRAINT renters_id FOREIGN KEY(renters_id) REFERENCES dim_renters(renters_id);

ALTER TABLE ft_rentals ADD CONSTRAINT carstatus_id FOREIGN KEY(carstatus_id) REFERENCES dim_carstatus(carstatus_id);
