
# Initial Setup and Imports
import Pkg
Pkg.update()
cd("/cluster/home/fsalenca/Spesialization_project/GENeSYS_MOD.jl/src")
Pkg.activate(".")
Pkg.develop(path="/cluster/home/fsalenca/Spesialization_project/GENeSYS_MOD.jl")
Pkg.build("PyCall")

using GENeSYS_MOD
using JuMP
using Dates
using CPLEX
using Ipopt
using CSV
using Revise
using XLSX
using DataFrames
using PyCall
using HiGHS

# Import OR-Tools solver through Python using PyCall
ortools = pyimport("ortools.linear_solver")

# Data structures for storing results of each solver
solver_names = ["PDLP", "HiGHS"]
building_time = Dict("PDLP" => [], "HiGHS" => [])
solving_time = Dict("PDLP" => [], "HiGHS" => [])
objective_list = Dict("PDLP" => [], "HiGHS" => [])
n_var = Dict("PDLP" => [], "HiGHS" => [])
n_constr = Dict("PDLP" => [], "HiGHS" => [])

# Loop through each solver
for solver_name in solver_names
    # Set the solver to PDLP or HiGHS based on the current loop iteration
    if solver_name == "PDLP"
        # PDLP is accessed through OR-Tools in Python
        solver = ortools.Solver.CreateSolver("PDLP")
    else
        # HiGHS solver is directly accessible in Julia via HiGHS.jl
        solver = HiGHS.Optimizer
    end

    DNLPsolver = Ipopt.Optimizer
    year = 2018
    model_region = "minimal"
    data_base_region = "DE"
    data_file = "Data_Europe_GradualDevelopment_Input_cleaned_free"
    hourly_data_file = "Hourly_Data_Europe_v13"
    threads = 30
    emissionPathway = "MinimalExample"
    emissionScenario = "globalLimit"
    socialdiscountrate = 0.05
    inputdir = joinpath("/cluster/home/fsalenca/oceangrid_case/Input")
    resultdir = joinpath("/cluster/home/fsalenca/Spesialization_project/dev_jl/", "Results", "Spatial")
    switch_infeasibility_tech = 1
    switch_investLimit = 1
    switch_ccs = 0
    switch_ramping = 0
    switch_weighted_emissions = 0
    set_symmetric_transmission = 0
    switch_intertemporal = 0
    switch_base_year_bounds = 0
    switch_base_year_bounds_debugging = 0
    switch_peaking_capacity = 0
    set_peaking_slack = 0
    set_peaking_minrun_share = 0
    set_peaking_res_cf = 0
    set_peaking_min_thermal = 0
    set_peaking_startyear = 0
    switch_peaking_with_storages = 0
    switch_peaking_with_trade = 0
    switch_peaking_minrun = 0
    switch_employment_calculation = 0
    switch_endogenous_employment = 0
    employment_data_file = "None"
    switch_dispatch = 0
    elmod_nthhour = 91 #granularity at 4 days.
    elmod_starthour = 0
    elmod_dunkelflaute = 0
    elmod_daystep = 0
    elmod_hourstep = 0
    switch_raw_results = 0
    switch_processed_results = 0
    write_reduced_timeserie = 0
    offshore_grid = "Meshed"
    switch_LCOE_calc = 0

    # Define the Switch for this granularity setting
    Switch = GENeSYS_MOD.Switch(year,
    solver,
    DNLPsolver,
    model_region,
    data_base_region,
    data_file,
    hourly_data_file,
    threads,
    emissionPathway,
    emissionScenario,
    socialdiscountrate,
    inputdir,
    resultdir,
    switch_infeasibility_tech,
    switch_investLimit,
    switch_ccs,
    switch_ramping,
    switch_weighted_emissions,
    set_symmetric_transmission,
    switch_intertemporal,
    switch_base_year_bounds,
    switch_base_year_bounds_debugging,
    switch_peaking_capacity,
    set_peaking_slack,
    set_peaking_minrun_share,
    set_peaking_res_cf,
    set_peaking_min_thermal,
    set_peaking_startyear,
    switch_peaking_with_storages,
    switch_peaking_with_trade,
    switch_peaking_minrun,
    switch_employment_calculation,
    switch_endogenous_employment,
    employment_data_file,
    switch_dispatch,
    elmod_nthhour,
    elmod_starthour,
    elmod_dunkelflaute,
    elmod_daystep,
    elmod_hourstep,
    switch_raw_results,
    switch_processed_results,
    write_reduced_timeserie,
    offshore_grid, #newly added
    switch_LCOE_calc)
   
    # Start timing and model setup
    starttime = Dates.now()
    model = JuMP.Model()
    Sets, Params, Emp_Sets = GENeSYS_MOD.genesysmod_dataload(Switch)
    Maps = GENeSYS_MOD.make_mapping(Sets, Params)
    Vars = GENeSYS_MOD.genesysmod_dec(model, Sets, Params, Switch, Maps)
    Settings = GENeSYS_MOD.genesysmod_settings(Sets, Params, Switch.socialdiscountrate)
    GENeSYS_MOD.genesysmod_bounds(model, Sets, Params, Vars, Settings, Switch, Maps)
    GENeSYS_MOD.genesysmod_equ(model, Sets, Params, Vars, Emp_Sets, Settings, Switch, Maps)

    # Assign the optimizer only if using a JuMP-compatible solver
    if solver_name != "PDLP"
        # Set JuMP model's optimizer for HiGHS (or other compatible solvers)
        set_optimizer(model, solver)
    end

    # Start optimization
    if solver_name == "PDLP"
        # For PDLP (through OR-Tools), use the Python-based solver method
        result_status = solver.Solve()
        # Collect the objective value, variables, and constraints count from OR-Tools
        obj_value = solver.Objective().Value()
        n_vars = solver.NumVariables()
        n_constraints = solver.NumConstraints()
    else
        # For HiGHS, use JuMP's optimize! method and retrieve results through JuMP functions
        optimize!(model)
        obj_value = objective_value(model)
        n_vars = num_variables(model)
        n_constraints = sum(num_constraints(model, F, S) for (F, S) in list_of_constraint_types(model))
    end

    # Calculate build and solve times
    build_end = Dates.now()
    build_time = (build_end - starttime)
    solve_time = Dates.now() - build_end

    # Append results for each solver into corresponding lists
    append!(building_time[solver_name], build_time)
    append!(solving_time[solver_name], solve_time)
    append!(objective_list[solver_name], obj_value)
    append!(n_var[solver_name], n_vars)
    append!(n_constr[solver_name], n_constraints)

    # Print results for the current solver iteration
    println("Solver: $solver_name | Build Time: $build_time | Solve Time: $solve_time | Obj: $obj_value | Vars: $n_vars | Constr: $n_constraints")
end

# Write everything in a text file
io = open(joinpath(resultdir, "result_run_all.txt"), "w")
for (b, s, o, v, c) in zip(building_time["PDLP"], solving_time["PDLP"], objective_list["PDLP"], n_var["PDLP"], n_constr["PDLP"])
    println(io, "CPLEX: Build Time: $b, Solve Time: $s, Obj: $o, Vars: $v, Constr: $c")
end

for (b, s, o, v, c) in zip(building_time["HiGHS"], solving_time["HiGHS"], objective_list["HiGHS"], n_var["HiGHS"], n_constr["HiGHS"])
    println(io, "HiGHS: Build Time: $b, Solve Time: $s, Obj: $o, Vars: $v, Constr: $c")
end
close(io)

# Output comparison results
println("Solver Comparison Results")
println("Solver | Building Time | Solving Time | Objective Value | Num Variables | Num Constraints")
for solver_name in solver_names
    for i in 1:length(building_time[solver_name])
        println("$solver_name | $(building_time[solver_name][i]) | $(solving_time[solver_name][i]) | $(objective_list[solver_name][i]) | $(n_var[solver_name][i]) | $(n_constr[solver_name][i])")
    end
end

