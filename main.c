//
// Created by elias on 20.09.2023.
//


//
// Created by elias on 19.09.2023.
//
#include <iostream>
#include <string>
#include <cstdio>


double calc_total_power(int n_modules, double power_peak, double direction_percent) {
    return  n_modules * power_peak * (direction_percent / 100);
}

double calc_yield_per_year(int special_yield, double power_peak, int cent_price) {
    double system_yield = special_yield * power_peak;
    return system_yield * cent_price;

}



int main() {
    const double module_power_peak = 0.375;
    const double price_module = 259.99;

    // number of modules
    int num_modules;

    while (true) {
        std::cout << "Number of solar modules: ";
        std::cin >> num_modules;
        if (num_modules < 1) {
            std::cout << "Invalid input! The number of solar modules must be an integer greater than or equal to 1 and less than or equal to 80.\n";
            continue;
        } else if (num_modules > 80) {
            std::cout << "Invalid input! The number of solar modules must be an integer greater than or equal to 1 and less than or equal to 80.\n";
            continue;
        } else {
            break;
        }
    }

    // the subsidy paid by the state in %
    int subsidy;

    while (true) {
        std::cout << "Subsidy in % of the investment: ";
        std::cin >> subsidy;
        if (subsidy < 0) {
            std::cout << "Invalid input! The subsidy must be an integer greater than or equal to 0 and less than or equal to 100.\n";
            continue;
        } else if (subsidy > 100) {
            std::cout << "Invalid input! The subsidy must be an integer greater than or equal to 0 and less than or equal to 100.\n";
            continue;
        } else {
            break;
        }
    }

    // the direction of the modules
    std::cout << "Direction of the photovoltaic system:\n"
                 "1: SOUTH\n"
                 "2: SOUTH-EAST\n"
                 "3: EAST\n"
                 "4: SOUTH-WEST\n"
                 "5: WEST\n";

    int yield_direction;
    std::string yield_direction_str;
    bool yield_direction_loop = true;

    while (yield_direction_loop) {
        std::cout << "Please enter the direction: ";
        std::cin >> yield_direction;

        switch (yield_direction) {
            case 1:
                yield_direction = 100;
                yield_direction_str = "SOUTH";
                yield_direction_loop = false;
                break;
            case 2:
                yield_direction = 95;
                yield_direction_str = "SOUTH-EAST";
                yield_direction_loop = false;
                break;
            case 3:
                yield_direction = 90;
                yield_direction_str = "EAST";
                yield_direction_loop = false;
                break;
            case 4:
                yield_direction = 95;
                yield_direction_str = "SOUTH-WEST";
                yield_direction_loop = false;
                break;
            case 5:
                yield_direction = 90;
                yield_direction_str = "WEST";
                yield_direction_loop = false;
                break;
            default:
                continue;


        }
    }
    // in cent/kWh
    int electricity_price;

    while (true) {
        std::cout << "Electricity rate in cents/kWh: ";
        std::cin >> electricity_price;
        if (electricity_price < 1) {
            std::cout << "Invalid input! The electricity rate must be an integer which is at least 1 and must not exceed 100 cents/kWh.\n";
            continue;
        } else if (electricity_price > 100) {
            std::cout << "Invalid input! The electricity rate must be an integer which is at least 1 and must not exceed 100 cents/kWh.\n";
            continue;
        } else {
            break;
        }
    }


    // Calculations


    // num modules + direction
    if (num_modules == 1) {
        std::cout << "One module facing " << yield_direction_str << ".\n";
    } else {
        std::cout << num_modules << " modules facing " << yield_direction_str << ".\n";
    }

    double total_power;
    total_power = module_power_peak * num_modules;
    std::printf("Achievable total power: %.2f kWp.\n", total_power);



    if (yield_direction != 100) {
        total_power = calc_total_power(num_modules, module_power_peak, yield_direction);
        std::printf("However, due to the suboptimal direction, only %.2f kWp are achieved.\n", total_power);
    }


    const int special_yield = 905;
    double total_pv_price = price_module * num_modules;
    double yield_per_year = calc_yield_per_year(special_yield, total_power, electricity_price);
    std::printf("Investment of %.2f leads to earnings of %.2f each year.\n", total_pv_price, yield_per_year/100);





    // Calculate the break even time
    int years = 0;
    double subsidy_paid = total_pv_price * (subsidy/100.0);
    total_pv_price = total_pv_price - subsidy_paid;
    while (true) {
        total_pv_price = total_pv_price - (yield_per_year/100.0);
        if (total_pv_price > 0.0) {

            years += 1;

            if (years == 1) {
                if (subsidy != 0) {
                    std::printf("After year 1: %.2f still to compensate. (%.2f paid by the government)\n", total_pv_price, subsidy_paid);
                    continue;
                }
            }

            std::printf("After year %d: %.2f still to compensate.\n", years, total_pv_price);
            continue;
        } else {
            if (years == 0) {
                std::cout << "PV system amortized within a year.\n";
                break;
            }

            std::printf("PV system amortized within %d years.\n", years+1);

            break;
        }


    }




    return 0;


}