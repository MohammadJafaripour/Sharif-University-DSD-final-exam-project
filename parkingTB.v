module parkingTB;
  reg clk, rst;
  reg car_exited, is_uni_car_exited;
  reg car_entered, is_uni_car_entered;
  wire [9:0] uni_vacated_space, vacated_space;
  wire [9:0] uni_parked_car, parked_car;
  wire uni_is_vacated_space,  is_vacated_space;
  wire [4:0] t; // for hour

  integer i = 0;
  always begin
    #5 clk = ~clk;
  end

  parking park(
    .rst(rst),
    .clk(clk),
    .car_exited(car_exited),
    .uni_vacated_space(uni_vacated_space),
    .vacated_space(vacated_space),
    .parked_car(parked_car),
    .is_uni_car_exited(is_uni_car_exited),
    .uni_parked_car(uni_parked_car),
    .uni_is_vacated_space(uni_is_vacated_space),
    .is_vacated_space(is_vacated_space),
    .car_entered(car_entered),
    .is_uni_car_entered(is_uni_car_entered),
    .t(t)
  );

  initial begin
    $monitor("Time: %d -> (uni_vacated_space: %d vacated_space: %d) -> (uni_parked_car: %d parked_car: %d) , is_uni_space: %d is_space: %d", 
              t, uni_vacated_space, vacated_space, uni_parked_car, parked_car,  uni_is_vacated_space, is_vacated_space);

    car_exited = 0;
    is_uni_car_exited = 0;
    clk = 0;
    car_entered = 0;
    is_uni_car_entered = 0;
    rst = 1;
    #10 rst = 0;

    for (i = 0; i < 10 ; i = i + 1) begin
        #10 car_entered = 1; is_uni_car_entered = $random;
        #10 car_entered = 0;
    end

    for (i = 0; i < 10 ; i = i + 1) begin
        #10 car_exited = 1; is_uni_car_exited = $random;
        #10 car_exited = 0;
    end
    #40 $stop;
  end
endmodule