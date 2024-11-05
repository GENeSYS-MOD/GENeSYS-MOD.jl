using GENeSYS_MOD
using HiGHS
using Ipopt

model, data = genesysmod_dispatch(; solver=HiGHS.Optimizer, DNLPsolver = Ipopt.Optimizer, threads=0, 
inputdir = joinpath(pkgdir(GENeSYS_MOD),"test","TestData","Inputs"),
resultdir = joinpath(pkgdir(GENeSYS_MOD),"test","TestData","Results"),
data_file="RegularParameters_testdata",
hourly_data_file = "Timeseries_testdata",
year=2050,
switch_investLimit=1,
switch_ccs=1,
switch_ramping=0,
switch_weighted_emissions=1,
switch_intertemporal=0,
switch_base_year_bounds = 0,
switch_peaking_capacity = 0,
set_peaking_slack = 0,
set_peaking_minrun_share = 0,
set_peaking_res_cf = 0,
set_peaking_startyear = 2025,
switch_peaking_with_storages = 0,
switch_peaking_with_trade = 0,
switch_peaking_minrun = 0,
switch_employment_calculation = 0,
switch_endogenous_employment = 0,
employment_data_file = "",
elmod_dunkelflaute= 0,
switch_raw_results = CSVResult(),
switch_processed_results = 1,
switch_dispatch = OneNodeSimple("DE")
)