using GENeSYS_MOD
using Ipopt
using Gurobi

# Gonna look at Norway in a one-node System
# First just optimize over all contries, but with low resolution
# (I also allow infesability tech for testing purposes)
# Use Germany as the region to look to if there are missing data for a country

"""model, data = genesysmod(;elmod_daystep = 20, elmod_hourstep = 6, solver=Gurobi.Optimizer, DNLPsolver = Ipopt.Optimizer, elmod_starthour = 6,
    inputdir = joinpath("test","MyData","NewData"),
    resultdir = joinpath("test","MyData","NewData_Results"),
    data_file= "Parameter_data_season",
    hourly_data_file = "Timeseries_data_season",
    switch_raw_results = 0, # To save results for use by dispatch code
    switch_infeasibility_tech = 0, # Allow expensive DummyTech if porblem is not feasable.
    switch_investLimit = 0,
    write_reduced_timeserie = 0,
    data_base_region="DE",
    solution_file_name = "solution_data_season_d20_h6_s6_no_invest.sol" #"Solution_40_12_day.sol", # "Solution_40_12_season.sol",
);"""

model, data = genesysmod(;elmod_daystep = 20, elmod_hourstep = 6, solver=Gurobi.Optimizer, DNLPsolver = Ipopt.Optimizer, elmod_starthour = 6,
    inputdir = joinpath("test","MyData","NewData"),
    resultdir = joinpath("test","MyData","NewData_Results"),
    data_file= "Parameter_data_daily",
    hourly_data_file = "Timeseries_data_daily",
    switch_raw_results = 0, # To save results for use by dispatch code
    switch_infeasibility_tech = 0, # Allow expensive DummyTech if porblem is not feasable.
    switch_investLimit = 1,
    write_reduced_timeserie = 0,
    data_base_region="DE",
    solution_file_name = "solution_data_daily_d20_h6_s6_extra.sol" #"Solution_40_12_day.sol", # "Solution_40_12_season.sol",
);


