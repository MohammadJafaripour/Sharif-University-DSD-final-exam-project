# Sharif-University-DSD-final-exam-project
Final exam project for Dr.Amin Foshati course presented in sharif university of technology.

# Parking Management System

This repository contains the Verilog code for a Parking Management System designed for the Digital Systems Designe course. The system take informations of car enterans and calculate vaced space for two type of university and non-university vehicles.

## Tools

Modelsim simulator is used to debug and compile verilog codes.
It also provide a simulation space for our project

## Static Informations

- **University Space**: 500 spaces reserved for university vehicles after 8 o'clock.
- **Decremental Space**: Decreases by 50 spaces per hour between 13 and 16.
- **Min Space**: 200 spaces reserved after 16 o'clock.
- **All Space**: 700 parking spaces.

## Features

- **Space Management**: The system dynamically calculate the parking space.
- **Type Dependent**: The system keeps separate counts for university vehicles and non-university vehicles.
- **Hour Specification** The system specificate space by hour.

## Inputs

| Inputs             | Description                    |
| ------------------ | ------------------------------ |
| car_entered        | Boolean show car entry         |
| is_uni_car_entered | University car entered?        |
| car_exited         | Boolean show car exited        |
| is_uni_car_exited  | Non-university car entered?    |

## Outputs

| Outputs              | Description                                  |
| -------------------- | -------------------------------------------- |
| uni_parked_car       | Number of university parked vehicles.        |
| parked_car           | Number of non-univercity parked vehicles.    |
| uni_vacated_space    | Number of vacated spaces for university.     |
| vacated_space        | Number of vacated spaces for non_univercity. |
| uni_is_vacated_space | Availability for the university?             |
| is_vacated_space     | Availability for the non-university?         |
| t                    | Specificate current hour                     |

## How It Works
This project contains three calculation parts:

1. **Space calculation by hour**: System modify space in specific hours.
   ```verilog
             if (t < 16 && t >= 13) begin
                uni_vacated_space = uni_vacated_space - 50;
                vacated_space = vacated_space + 50;
                max_vacated_space = max_vacated_space + 50;
            end
            else if ( t == 16) begin
                uni_vacated_space = uni_vacated_space - 150;
                vacated_space = vacated_space + 150;
                max_vacated_space = 500;
            end
   ```
2. **Enterans of cars**: By Entrans a car change reserved space.
        ```verilog
           if (car_exited && !is_uni_car_exited && parked_car > 0) begin
                    parked_car = parked_car - 1;
                    vacated_space = vacated_space + 1;
            end else if (car_exited && is_uni_car_exited && uni_parked_car > 0) begin
                    uni_parked_car = uni_parked_car - 1;
                    uni_vacated_space = uni_vacated_space + 1;
            end else if (car_entered && !is_uni_car_entered && (parked_car + uni_parked_car < 700 && parked_car < max_vacated_space)) begin
                    vacated_space = vacated_space - 1;
                    parked_car = parked_car + 1;
            end else  if (car_entered && is_uni_car_entered && (uni_parked_car < 500 && uni_parked_car + parked_car < 700)) begin
                    uni_parked_car = uni_parked_car + 1;
                    uni_vacated_space = uni_vacated_space - 1;
            end
       
3. **Availabilty enterance**: give entrace if there is vaced space.
       ```verilog
            if (uni_parked_car < 500 && uni_parked_car + parked_car < 700)
                uni_is_vacated_space = 1;
            else 
                uni_is_vacated_space = 0;
            if (parked_car < max_vacated_space && uni_parked_car + parked_car < 700) 
                is_vacated_space = 1;
            else 
                is_vacated_space = 0;
      


## Author
- [Mohammad Jafaripour](401105797)
