module parking (clk, rst, car_entered, car_exited, is_uni_car_entered, is_uni_car_exited,
 uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space, t
);
    input clk, rst, car_entered, car_exited, is_uni_car_entered, is_uni_car_exited;
    output reg [9:0] uni_parked_car, parked_car, uni_vacated_space, vacated_space;
    output reg uni_is_vacated_space,  is_vacated_space;
    output reg [4:0] t; //show hour

    reg [9:0] max_vacated_space;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            t <= 9;
            uni_parked_car <= 0;
            parked_car <= 0;
            uni_vacated_space <= 500;
            vacated_space <= 200;
            max_vacated_space <= 200;
            uni_is_vacated_space <= 1;
            is_vacated_space <= 1;
        end else begin
            if (t < 23) 
                t <= t + 1;
            else
                t <= 0;
            // time signal calculations        
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
            else if (t == 8) begin
                uni_vacated_space = uni_vacated_space + 300;
                vacated_space = vacated_space - 300;
                max_vacated_space = 200;
            end 
            // input signals calculations
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
            // is_vacated_space calculations
            if (uni_parked_car < 500 && uni_parked_car + parked_car < 700)
                uni_is_vacated_space = 1;
            else 
                uni_is_vacated_space = 0;
            if (parked_car < max_vacated_space && uni_parked_car + parked_car < 700) 
                is_vacated_space = 1;
            else 
                is_vacated_space = 0;
        end
    end
endmodule
