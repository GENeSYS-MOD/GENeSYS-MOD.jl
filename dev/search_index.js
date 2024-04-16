var documenterSearchIndex = {"docs":
[{"location":"manual/simple-example/#Example","page":"Example","title":"Example","text":"","category":"section"},{"location":"library/internals/#Internals","page":"Internals","title":"Internals","text":"","category":"section"},{"location":"library/internals/#Index","page":"Internals","title":"Index","text":"","category":"section"},{"location":"library/internals/","page":"Internals","title":"Internals","text":"Pages = [\"internals.md\"]","category":"page"},{"location":"library/internals/#Types","page":"Internals","title":"Types","text":"","category":"section"},{"location":"library/internals/","page":"Internals","title":"Internals","text":"Modules = [GENeSYS_MOD]\nPublic = false\nOrder = [:type]","category":"page"},{"location":"library/internals/#GENeSYS_MOD.Emp_Sets","page":"Internals","title":"GENeSYS_MOD.Emp_Sets","text":"Sets necessary for the employment calculations. The set elements may be different from the sets in the model.\n\n\n\n\n\n","category":"type"},{"location":"library/internals/#GENeSYS_MOD.InputClass","page":"Internals","title":"GENeSYS_MOD.InputClass","text":"InputClass - Abstract type for the inputs\n\n\n\n\n\n","category":"type"},{"location":"library/internals/#GENeSYS_MOD.Maps","page":"Internals","title":"GENeSYS_MOD.Maps","text":"Structure containing the mappings of sets combinations\n\n\n\n\n\n","category":"type"},{"location":"library/internals/#GENeSYS_MOD.Parameters","page":"Internals","title":"GENeSYS_MOD.Parameters","text":"All the parameters read for a model run\n\nExtended\n\nFields\n\nStartYear ::Int64 First year of the study horizon.\nYearSplit ::JuMP.Containers.DenseAxisArray Weighting factors of the each timeslice,    i.e. how much of the whole year is represented by a given tiomeslice. \n\nSpecifiedAnnualDemand ::JuMP.Containers.DenseAxisArray Total specified demand for a year.\nSpecifiedDemandProfile ::JuMP.Containers.DenseAxisArray Annual fraction of    energy-service or commodity demand that is required in each time slice. For each   year, all the defined SpecifiedDemandProfile input values should sum up to 1.\nRateOfDemand ::JuMP.Containers.DenseAxisArray Rate of Demand in each timeslice.\nDemand ::JuMP.Containers.DenseAxisArray Amount of demand in each timeslice.\nCapacityToActivityUnit ::JuMP.Containers.DenseAxisArray Conversion factor relating   the energy that would be produced when one unit of capacity is fully used in one year.\nCapacityFactor ::JuMP.Containers.DenseAxisArray Capacity available per each   TimeSlice expressed as a fraction of the total installed capacity, with values ranging   from 0 to 1. It gives the possibility to account for forced outages or variable renewable generation. \nAvailabilityFactor ::JuMP.Containers.DenseAxisArray Maximum time a technology can   run in the whole year, as a fraction of the year ranging from 0 to 1. It gives the   possibility to account for planned outages.\nOperationalLife ::JuMP.Containers.DenseAxisArray Useful lifetime of a technology,   expressed in years.\nResidualCapacity ::JuMP.Containers.DenseAxisArray Amount of capacity from the capacity\n\nexisting in the system in the start year to remain in the given year.\n\nInputActivityRatio ::JuMP.Containers.DenseAxisArray Rate of use of a fuel by a   technology, as a ratio of the rate of activity. Used to express technology efficiencies.\nOutputActivityRatio ::JuMP.Containers.DenseAxisArray Rate of fuel output from a   technology, as a ratio of the rate of activity.\nTagDispatchableTechnology ::JuMP.Containers.DenseAxisArray Tag defining if a technology \n\ncan be dispatched.\n\nRegionalBaseYearProduction ::JuMP.Containers.DenseAxisArray Amount of energy produced by \n\ntechnologies in the start year. Used if switchbaseyear_bounds is set to 1.\n\nRegionalCCSLimit ::JuMP.Containers.DenseAxisArray Total amount of storeable emissions   in a certain region over the entire modelled period.\nCapitalCost ::JuMP.Containers.DenseAxisArray Capital investment cost of a technology,   per unit of capacity.\nVariableCost ::JuMP.Containers.DenseAxisArray Cost of a technology for a given mode   of operation (e.g., Variable O&M cost, fuel costs, etc.), per unit of activity.\nFixedCost ::JuMP.Containers.DenseAxisArray Fixed O&M cost of a technology, per unit   of capacity.\nStorageLevelStart ::JuMP.Containers.DenseAxisArray Level of storage at the beginning   of first modelled year, in units of activity.\nMinStorageCharge ::JuMP.Containers.DenseAxisArray Sets a lower bound to the amount   of energy stored, as a fraction of the maximum, with a number ranging between 0 and 1.   The storage facility cannot be emptied below this level.\nOperationalLifeStorage ::JuMP.Containers.DenseAxisArray Useful lifetime of the   storage facility.\nCapitalCostStorage ::JuMP.Containers.DenseAxisArray Binary parameter linking a    technology to the storage facility it charges. It has value 0 if the technology and the   storage facility are not linked, 1 if they are.\nResidualStorageCapacity ::JuMP.Containers.DenseAxisArray Binary parameter linking a   storage facility to the technology it feeds. It has value 0 if the technology and the   storage facility are not linked, 1 if they are.\nTechnologyToStorage ::JuMP.Containers.DenseAxisArray Binary parameter linking a    technology to the storage facility it charges. It has value 1 if the technology and the   storage facility are linked, 0 otherwise.\nTechnologyFromStorage ::JuMP.Containers.DenseAxisArray Binary parameter linking a   storage facility to the technology it feeds. It has value 1 if the technology and the   storage facility are linked, 0 otherwise.\nStorageMaxCapacity ::JuMP.Containers.DenseAxisArray Maximum storage capacity.\nTotalAnnualMaxCapacity ::JuMP.Containers.DenseAxisArray Total maximum existing    (residual plus cumulatively installed) capacity allowed for a technology in a specified   year.\nTotalAnnualMinCapacity ::JuMP.Containers.DenseAxisArray Total minimum existing    (residual plus cumulatively installed) capacity allowed for a technology in a specified   year.\nTagTechnologyToSector ::JuMP.Containers.DenseAxisArray Links technologies to sectors. \nAnnualSectoralEmissionLimit ::JuMP.Containers.DenseAxisArray Annual upper limit for   a specific emission generated in a certain sector for the whole modelled region.\nTotalAnnualMaxCapacityInvestment ::JuMP.Containers.DenseAxisArray Maximum capacity of   a technology, expressed in power units.\nTotalAnnualMinCapacityInvestment ::JuMP.Containers.DenseAxisArray Minimum capacity of   a technology, expressed in power units.\nTotalTechnologyAnnualActivityUpperLimit ::JuMP.Containers.DenseAxisArray Total maximum   level of activity allowed for a technology in one year.\nTotalTechnologyAnnualActivityLowerLimit ::JuMP.Containers.DenseAxisArray Total minimum    level of activity allowed for a technology in one year.\nTotalTechnologyModelPeriodActivityUpperLimit ::JuMP.Containers.DenseAxisArray Total    maximum level of activity allowed for a technology in the entire modelled period.\nTotalTechnologyModelPeriodActivityLowerLimit ::JuMP.Containers.DenseAxisArray Total    minimum level of activity allowed for a technology in the entire modelled period.\nReserveMarginTagTechnology ::JuMP.Containers.DenseAxisArray Binary parameter tagging   the technologies that are allowed to contribute to the reserve margin. It has value 1    for the technologies allowed, 0 otherwise.\nReserveMarginTagFuel ::JuMP.Containers.DenseAxisArray Binary parameter tagging the   fuels to which the reserve margin applies. It has value 1 if the reserve margin applies   to the fuel, 0 otherwise.\nReserveMargin ::JuMP.Containers.DenseAxisArray Minimum level of the reserve margin   required to be provided for all the tagged commodities, by the tagged technologies.    If no reserve margin is required, the parameter will have value 1; if, for instance, 20%   reserve margin is required, the parameter will have value 1.2.\nRETagTechnology ::JuMP.Containers.DenseAxisArray Tag to identify renewable technologies.\nRETagFuel ::JuMP.Containers.DenseAxisArray Tag to identify renewable fuels.\nREMinProductionTarget ::JuMP.Containers.DenseAxisArray Minimum production from renewable   technologies.\nEmissionActivityRatio ::JuMP.Containers.DenseAxisArray Emission factor of a    technology per unit of activity, per mode of operation.\nEmissionContentPerFuel ::JuMP.Containers.DenseAxisArray Defines the emission contents    per fuel.\nEmissionsPenalty ::JuMP.Containers.DenseAxisArray Monetary penalty per unit of emission.\nEmissionsPenaltyTagTechnology ::JuMP.Containers.DenseAxisArray Activates or deactivates   emission penalties for specific technologies.\nAnnualExogenousEmission ::JuMP.Containers.DenseAxisArray Additional annual emissions,   on top of those computed endogenously by the model.\nAnnualEmissionLimit ::JuMP.Containers.DenseAxisArray Annual upper limit for a specific   emission generated in the whole modelled region.\nRegionalAnnualEmissionLimit ::JuMP.Containers.DenseAxisArray Annual upper limit for   a specific emission generated in a certain modelled region.\nModelPeriodExogenousEmission ::JuMP.Containers.DenseAxisArray Additional emissions    over the entire modelled period, on top of those computed endogenously by the model.\nModelPeriodEmissionLimit ::JuMP.Containers.DenseAxisArray Total model period upper    limit for a specific emission generated in the whole modelled region.\nRegionalModelPeriodEmissionLimit ::JuMP.Containers.DenseAxisArray Total model period   upper limit for a specific emission generated in a certain modelled region.\nCurtailmentCostFactor ::JuMP.Containers.DenseAxisArray Costs per curtailed unit of   activity for certain fuels and years.\nTradeRoute ::JuMP.Containers.DenseAxisArray Sets the distance in km from one region   to another. Also controls the ability to trade on fuel from a region to another.\nTradeCosts ::JuMP.Containers.DenseAxisArray Costs for trading one unit of energy from   one region to another.\nTradeLossFactor ::JuMP.Containers.DenseAxisArray Factor for the amount of losses per   kilometer of a given fuel\nTradeRouteInstalledCapacity ::JuMP.Containers.DenseAxisArray Installed transmission    capacity between nodes.\nTradeLossBetweenRegions ::JuMP.Containers.DenseAxisArray Percentage loss of traded    fuel from one region to another. Used to model losses in power transmission networks.\nCommissionedTradeCapacity ::JuMP.Containers.DenseAxisArray Transmission line already    commissioned.\nTradeCapacity ::JuMP.Containers.DenseAxisArray Initial capacity for trading fuels    from one region to another.\nTradeCapacityGrowthCosts ::JuMP.Containers.DenseAxisArray Costs for adding one unit    of additional trade capacity per km from one region to another.\nGrowthRateTradeCapacity ::JuMP.Containers.DenseAxisArray Upper limit for adding    additional trade capacities. Given as maximal percentage increase of installed capacity.\nSelfSufficiency ::JuMP.Containers.DenseAxisArray Lower bound that limits the imports    of fuels in as specific year and region.\nRampingUpFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray} Defines how much of    the built capacity can be activated each timeslice.\nRampingDownFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray} Defines how much    of the built capacity can be deactivated each timeslice.\nProductionChangeCost ::Union{Nothing,JuMP.Containers.DenseAxisArray} Cost per unit    of activated or deactivated capacity per timeslice.\nMinActiveProductionPerTimeslice ::Union{Nothing,JuMP.Containers.DenseAxisArray}    Minimum fuel production from specific technologies in a certain timeslice. Represents    minimum active capacity requirements.\nModalSplitByFuelAndModalType ::JuMP.Containers.DenseAxisArray Lower bound of    production of certain fuels by specific modal types.\nTagTechnologyToModalType ::JuMP.Containers.DenseAxisArray Links technology production    by mode of operation to modal stype.\nEFactorConstruction ::Union{Nothing,JuMP.Containers.DenseAxisArray} \n\nTODO\n\nEFactorOM ::Union{Nothing,JuMP.Containers.DenseAxisArray} \n\nTODO\n\nEFactorManufacturing ::Union{Nothing,JuMP.Containers.DenseAxisArray} \n\nTODO\n\nEFactorFuelSupply ::Union{Nothing,JuMP.Containers.DenseAxisArray} \n\nTODO\n\nEFactorCoalJobs ::Union{Nothing,JuMP.Containers.DenseAxisArray} \n\nTODO\n\nCoalSupply ::Union{Nothing,JuMP.Containers.DenseAxisArray} \n\nTODO\n\nCoalDigging ::Union{Nothing,JuMP.Containers.DenseAxisArray} \n\nTODO\n\nRegionalAdjustmentFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray} \n\nTODO\n\nLocalManufacturingFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray} \n\nTODO\n\nDeclineRate ::Union{Nothing,JuMP.Containers.DenseAxisArray} \n\nTODO\n\nx_peakingDemand ::Union{Nothing,JuMP.Containers.DenseAxisArray} Peak demand in the    original timeseries. Used for the peaking constraints.\nTagDemandFuelToSector ::JuMP.Containers.DenseAxisArray Tag to link fuels to sectors.\nTagElectricTechnology ::JuMP.Containers.DenseAxisArray Indicate if a technology is   considered to be \"direct electrification\".\n\n\n\n\n\n","category":"type"},{"location":"library/internals/#GENeSYS_MOD.Sets","page":"Internals","title":"GENeSYS_MOD.Sets","text":"Sets used for the model run\n\nFields\n\nTimeslice_full ::Array Represents all timeslices within a Year. This usally means   8760 elements.\nEmission ::Array Represents potential emissions that can be derived by the operation   of certain Technologies. Typically this includes atmospheric emissions, such as CO2.\nTechnology ::Array Represents the main elements of the energy system that produce,   convert, or transform energy (carriers) and their proxies. Technologies can represent   specific individual technology options, such as a \"Natural Gas CCGT\". They can also    represent abstracted or aggregated collection of technologies used for accounting purposes   (e.g., stock of cars).\nFuel ::Array Represents energy carriers, energy services, or proxies that are   consumed, produced, or transformed by Technologies. These can represent individual energy   carriers, aggregated groups, or artificial commodities, required by the analysis to be   carried out.\nYear ::Array Represents the time-frame of the model. This set contains all years   to be considered in the corresponding analysis.\nTimeslice ::Array Represents the temporal resolution within a Year of the    analysis. This set contains (reduced) consecutive hourly time-series. Each Year has the   same amount of timeslices assigned.\nMode_of_operation ::Array Represents the different modes in which a technologies can be   operated by. A technology can have different inputs and/or outputs for each mode of   operation to represent fuel-switching. E.g., a CHP can produce electricity in one mode   and heat in another one.\nRegion_full ::Array Represents the regional scope of the model. This set can usually   contains aggregated global regions, individual countries, or subcountry regions and states.\nStorage ::Array Represents storage facilities in the model. Storages can store   FUELS and are linked to specific TECHNOLOGIES.\nModalType ::Array Represents a modal type (e.g., rail-transportation) used in the   transportation sector of the model. These are used to control modal shifting to a   certain degree.\nSector ::Array Represents different sectors in the energy system. Used for    aggregation and accounting purposes.\n\n\n\n\n\n","category":"type"},{"location":"library/internals/#GENeSYS_MOD.Settings","page":"Internals","title":"GENeSYS_MOD.Settings","text":"Model settings necessary for running the model\n\nFields\n\nDepreciationMethod ::JuMP.Containers.DenseAxisArray Parameter defining the type of   depreciation to be applied in each region. It has value 1 for sinking fund depreciation,   value 2 for straight-line depreciation.\nGeneralDiscountRate ::JuMP.Containers.DenseAxisArray TODO.\nTechnologyDiscountRate ::JuMP.Containers.DenseAxisArray TODO.\nSocialDiscountRate ::JuMP.Containers.DenseAxisArray TODO.\nInvestmentLimit TODO.\nNewRESCapacity ::Float64 TODO.\nProductionGrowthLimit ::JuMP.Containers.DenseAxisArray This parameter controls the   maximal increase between two years of a specific fuel production from renewable energy   sources.\nStorageLimitOffset  ::Float64 TODO.\nTrajectory2020UpperLimit ::Float64 TODO.\nTrajectory2020LowerLimit ::Float64 TODO.\nBaseYearSlack The allowed slack from the defined RegionalBaseYearProduction.    Value between 0 and 1. Used only if switchbaseyear_bounds is set to 1.\nPhaseIn ::Dict TODO.\nPhaseOut ::Dict TODO.\nStorageLevelYearStartUpperLimit ::Float64 TODO.\nStorageLevelYearStartLowerLimit ::Float64 TODO.\n\n\n\n\n\n","category":"type"},{"location":"library/internals/#GENeSYS_MOD.SubsetsIni","page":"Internals","title":"GENeSYS_MOD.SubsetsIni","text":"Subsets of the Sets used to define in more detail the characteristics of some members the sets.\n\nFields\n\nSolar Solar technologies.\nWind Wind technologies.\nRenewables Non-fossil technologies\nCCS Technologies linked to varbon capture and storage (CCS).\nTransformation TODO.\nRenewableTransformation TODO.\nFossilFuelGeneration Sources of fossil fuel.\n\nFossilFuels \nFossilPower Technology using fossil fuels to produce power.\nCHPs Combined heat and power technologies.\nRenewableTransport Non-fossil transportation technologies.\nTransport Transportation technologies.\nPassenger Transportation technologies for passengers.\nFreight Transportation technologies for freight.\nTransportFuels Elements of the Fuel set corresponding to transport demand.\n\nImportTechnology Technologies corresponding to the import of resources.\nHeat Technologies producing heat.\nPowerSupply Technologies producing power.\nPowerBiomass Technologies producing powerfrom biomass.\nCoal Technologies consuming coal.\nLignite Technologies consuming lignite.\nGas Technologies consuming gas.\nStorageDummies Technologies corresponding to the defined storages.\nSectorCoupling TODO.\n\nHeatFuels Elements of the Fuel set corresponding to heat demand.\nModalGroups Overarching groups of modal types.\nPhaseInSet Technologies that can be subject to a phase in constraint, i.e. for which   the production in a given year must be at least as much as the production from the    previous year times a factor combining the evolution of demand and user input (<1).\nPhaseOutSet Technologies that can be subject to a phase out constraint, i.e. for which   the production in a given year must be at most equal to the production from the    previous year times a factor combining the evolution of demand and user factor (>1).\nHeatSlowRamper Heating technologies with long ramp up time.\nHeatQuickRamper Heating technologies with short ramp up time.\nHydro Hydropower technologies.\nGeothermal Geothermal technologies.\nOnshore Onshore wind technologies.\n\nOffshore Offshore wind technologies.\nSolarUtility Utility scale solar technologies.\nOil Technologies consuming oil.\nHeatLowRes Technologies that can produce the fuel Heat Low Residential.\nHeatLowInd Technologies that can produce the fuel Heat Low Industrial.\nHeatMedInd Technologies that can produce the fuel Heat Medium Industrial.\nHeatHighInd Technologies that can produce the fuel Heat High Industrial.\nBiomass Technologies producing the fuel biomass.\nHouseholds Technologies at the residential scale.\nCompanies Technoologies not at the residential scale.\nHydrogenTechnologies Hydrogen technologies.\nDummyTechnology Dummy technoliges used to debug when getting infeasible model.\n\n\n\n\n\n","category":"type"},{"location":"library/internals/#GENeSYS_MOD.Switch","page":"Internals","title":"GENeSYS_MOD.Switch","text":"Switches used to define a model run.\n\nThe switches corresponds to various elements and define for instance the input files and folders, as well as the inclusion or not of various features.\n\nFields\n\nStartYear :: Int16 First year of the study horizon.\nsolver Solver to be used to solve the LP. The corresponding package must be called.\n\nFor instance: using Gurobi, then the solver is Gurobi.Optimizer. \n\nDNLPsolver Solver used for the time reduction algorithm. The recommended solver \n\nis Ipopt as it is open but other commercial solvers with a julia integration can be used.\n\nmodel_region ::String Name of the modelled region. It will be used in naming files.\ndata_base_region ::String Default region of the model. The missing data will be copied\n\nfrom the default region.\n\ndata_file ::String Path to the main input data file.\nhourly_data_file ::String Path to the input data file containing the timeseries.\nthreads ::Int16 Number of threads to use for solving the model. Default is 4. To \n\nautomatically use th emaximum available number of threads, use the value 0.\n\nemissionPathway ::String Name of the emission pathway. Used in naming files.\nemissionScenario ::String Name of the emission scenario. Used in naming files.\nsocialdiscountrate ::Float64 Sets the value of the setting social discount rate.\ninputdir ::String Directory containing the input files.\nresultdir ::String Directory where the results files will be written.\nswitch_infeasibility_tech :: Int8 Switch used to include the infeasibility \n\ntechnologies in the model. These technologies are used to debug an infeasible model and  allow the model to run feasible by relaxing the problem with slack production technologies.\n\nswitch_investLimit ::Int16 Used to enable Investment limits. This activates phase in\n\nconstraints for renewable technologies, phase out constraints for fossil technologies.  It also activates a constraint smoothing the investment and to prevent large investment in a single period. It also activates a constraint limiting the investment in renewable each year to  a percentage of the total technical potential.\n\nswitch_ccs ::Int16 Used to enable CCS technologies.\nswitch_ramping ::Int16 Used to enable ramping constraints.\nswitch_weighted_emissions ::Int16 TODO.\nswitch_intertemporal ::Int16 TODO.\nswitch_base_year_bounds ::Int16 Used to enable base year bounds. This enforces the\n\nannual production of the different technologies in the start year.\n\nswitch_peaking_capacity ::Int16 TODO.\nset_peaking_slack ::Float16 TODO.\nset_peaking_minrun_share ::Float16 TODO.\nset_peaking_res_cf ::Float16 TODO.\nset_peaking_startyear ::Int16 Year in which the peaking constraint becomes active.\nswitch_peaking_with_storages ::Int16 Enables to fulfill the peaking constraint with storages.\nswitch_peaking_with_trade ::Int16 Enables to fulfill the peaking constraint with trade.\nswitch_peaking_minrun ::Int16 TODO.\nswitch_employment_calculation ::Int16 TODO.\nswitch_endogenous_employment ::Int16 TODO.\nemployment_data_file ::String TODO.\nswitch_dispatch ::Int8 Used to enable the dispatch run.\nelmod_nthhour ::Int16 Step size in hour for the sampling in the time reduction algorithm.\n\nThe default is 0 since the preferred method is to define daystep and hourstep instead. It corresponds to 24*daystep + hourstep.\n\nelmod_starthour ::Int16 Starting hour for the sampling in the time reduction algorithm.\nelmod_dunkelflaute ::Int16 Enables the addition of a period with very low wind and \n\nsun in the winter during the time reduction algorithm.\n\nelmod_daystep ::Int16 Number of days between each sample during the time reduction algorithm.\nelmod_hourstep ::Int16 Number of hours in addition tothe day step between each sample.\nswitch_raw_results ::Int8 Used to enable the writing of raw results after a model run.\n\nThe raw results dumps the content of all variables into CSVs.\n\nswitch_processed_results ::Int8 Used to produce processed result files containing \n\nadditional metrics not part of the raw results.\n\nwrite_reduced_timeserie ::Int8 Used to enable the writing of a file containing the\n\nresults of the time reduction algorithm.\n\n\n\n\n\n","category":"type"},{"location":"library/internals/#GENeSYS_MOD.Variable_Parameters","page":"Internals","title":"GENeSYS_MOD.Variable_Parameters","text":"Intermediary variables calculated after the model run\n\nThe intermediary variables are used to ex-post aggregate the activity, demand and use by time, technology, mod of operation and/or region.\n\n\n\n\n\n","category":"type"},{"location":"library/internals/#Methods","page":"Internals","title":"Methods","text":"","category":"section"},{"location":"library/internals/","page":"Internals","title":"Internals","text":"Modules = [GENeSYS_MOD]\nPublic = false\nOrder = [:function]","category":"page"},{"location":"library/internals/#GENeSYS_MOD._registered_variables-Tuple{Any}","page":"Internals","title":"GENeSYS_MOD._registered_variables","text":"Return all variables in the model\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.convert_jump_container_to_df-Tuple{JuMP.Containers.DenseAxisArray}","page":"Internals","title":"GENeSYS_MOD.convert_jump_container_to_df","text":"Returns a DataFrame with the values of the variables from the JuMP container var. The column names of the DataFrame can be specified for the indexing columns in dim_names, and the name of the data value column by a Symbol value_col e.g. :Value\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.create_daa","page":"Internals","title":"GENeSYS_MOD.create_daa","text":"Creates DenseAxisArrays containing the input parameters to the model considering hierarchy with base region data and world data.\n\nThe function creates a DenseAxisArray for a given parameter indexed by the given sets. The  values are intialized to 0. If copy world is true, the value for the region world are copied. If inheritbaseworld is 1, missing data will be fetched from the base region if they exist and again from the world region if necessary.\n\n\n\n\n\n","category":"function"},{"location":"library/internals/#GENeSYS_MOD.create_daa_hourly-Tuple{Any, Any, Vararg{Any}}","page":"Internals","title":"GENeSYS_MOD.create_daa_hourly","text":"Internal function used in the run process after reading the input data to reduce the hourly timeseries for the whole year to a given number of timeslices. The algorithm maintain the max and min value and also fit the new timeserie to minimise deviation from the mean of the original timeseire.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.create_daa_init","page":"Internals","title":"GENeSYS_MOD.create_daa_init","text":"Create dense axis array initialized at a given value. \n\n\n\n\n\n","category":"function"},{"location":"library/internals/#GENeSYS_MOD.create_df_hourly-Tuple{Any, Any}","page":"Internals","title":"GENeSYS_MOD.create_df_hourly","text":"\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.genesysmod_bounds-NTuple{7, Any}","page":"Internals","title":"GENeSYS_MOD.genesysmod_bounds","text":"Internal function used in the run process to modify batches of input data.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.genesysmod_dataload-Tuple{Any}","page":"Internals","title":"GENeSYS_MOD.genesysmod_dataload","text":"Internal function used in the run process to load the input data and create the reduced timeseries.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.genesysmod_dec-NTuple{5, Any}","page":"Internals","title":"GENeSYS_MOD.genesysmod_dec","text":"Internal function used in the run process to define the model variables.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.genesysmod_emissionintensity-NTuple{7, Any}","page":"Internals","title":"GENeSYS_MOD.genesysmod_emissionintensity","text":"Internal function used in the run to compute sectoral emissions and emission intensity of fuels.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.genesysmod_employment-Tuple{Any, Any, Any}","page":"Internals","title":"GENeSYS_MOD.genesysmod_employment","text":"\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.genesysmod_equ-NTuple{8, Any}","page":"Internals","title":"GENeSYS_MOD.genesysmod_equ","text":"Internal function used in the run process to define the model constraints.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.genesysmod_levelizedcosts-NTuple{10, Any}","page":"Internals","title":"GENeSYS_MOD.genesysmod_levelizedcosts","text":"Internal function used in the run process to compute results related to levelized costs.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.genesysmod_results-NTuple{8, Any}","page":"Internals","title":"GENeSYS_MOD.genesysmod_results","text":"Internal function used in the run pårocess to compute results.  It also runs the functions for processing emissions and levelized costs.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.genesysmod_results_raw-Tuple{Any, Any, Any}","page":"Internals","title":"GENeSYS_MOD.genesysmod_results_raw","text":"Write the values of each variable in the model to CSV files.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.genesysmod_settings-Tuple{Any, Any, Any}","page":"Internals","title":"GENeSYS_MOD.genesysmod_settings","text":"Internal function used in the run process to set run settings such as dicount rates.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.genesysmod_variable_parameter-Tuple{Any, Any, Any}","page":"Internals","title":"GENeSYS_MOD.genesysmod_variable_parameter","text":"Internal function used in the run process after solving to compute aggregated versions of the rate of activity,     rate of use and demand, on mode of operation, timeslice and technology.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.make_mapping-Tuple{Any, Any}","page":"Internals","title":"GENeSYS_MOD.make_mapping","text":"make_mapping(Sets,Params)\n\nCreates a mapping of the allowed combinations of technology and fuel (and revers) and mode of operations.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.print_iis-Tuple{Any}","page":"Internals","title":"GENeSYS_MOD.print_iis","text":"Write a text file containing the iis.\n\nThe function is used to write the iis to a file. By default the file is written in the working directory and is named iis.txt. The function compute_conflict!(model) must be run beforehands. The iis contains the set of constraint causing the infeasibility.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.simplify_iis-Tuple{Any}","page":"Internals","title":"GENeSYS_MOD.simplify_iis","text":"Helper function to simplify the iis file and make the analysis easier.\n\nThe function simplify the iis by finding the equation of type x = 0 and reoplacing x in the other equations instead of doing that by hand. The round_numerics and digits optional parameters can also be used to reduce the length of equation by rounding numbers. It allows a faster analysis of iis files.\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.split_by_substrings-Tuple{AbstractString, Vector{<:AbstractString}}","page":"Internals","title":"GENeSYS_MOD.split_by_substrings","text":"Extension of split function to take lists of substrings and keep delimiters\n\n\n\n\n\n","category":"method"},{"location":"library/internals/#GENeSYS_MOD.timeseries_reduction-NTuple{4, Any}","page":"Internals","title":"GENeSYS_MOD.timeseries_reduction","text":"\n\n\n\n","category":"method"},{"location":"manual/NEWS/#Release-Notes","page":"Release notes","title":"Release Notes","text":"","category":"section"},{"location":"#GENeSYS_MOD.jl","page":"Home","title":"GENeSYS_MOD.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This Julia package provides a Julia implementation of the General ENergy SYStem MODel,  GENeSYS-MOD (originally in GAMS). GENeSYS_MOD.jl.","category":"page"},{"location":"","page":"Home","title":"Home","text":"GENeSYS_MOD","category":"page"},{"location":"#GENeSYS_MOD","page":"Home","title":"GENeSYS_MOD","text":"Main module for GENeSYS_MOD.jl.\n\nThis module provides the means to run GENeSYS-MOD in julia. It is a translation of the GAMS version of the model.\n\n\n\n\n\n","category":"module"},{"location":"#Manual-outline","page":"Home","title":"Manual outline","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Pages = [\n    \"manual/quick-start.md\",\n    \"manual/simple-example.md\",\n    \"manual/NEWS.md\"\n]","category":"page"},{"location":"#Library-outline","page":"Home","title":"Library outline","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Pages = [\n    \"library/public.md\",\n    \"library/internals.md\"\n]","category":"page"},{"location":"library/public/#sec_lib_public","page":"Public","title":"Public interface","text":"","category":"section"},{"location":"library/public/#Index","page":"Public","title":"Index","text":"","category":"section"},{"location":"library/public/","page":"Public","title":"Public","text":"Pages = [\"public.md\"]","category":"page"},{"location":"library/public/#Types","page":"Public","title":"Types","text":"","category":"section"},{"location":"library/public/","page":"Public","title":"Public","text":"Modules = [GENeSYS_MOD]\nPrivate = false\nOrder = [:type]","category":"page"},{"location":"library/public/#Methods","page":"Public","title":"Methods","text":"","category":"section"},{"location":"library/public/","page":"Public","title":"Public","text":"Modules = [GENeSYS_MOD]\nPrivate = false\nOrder = [:function]","category":"page"},{"location":"library/public/#GENeSYS_MOD.genesysmod-Tuple{}","page":"Public","title":"GENeSYS_MOD.genesysmod","text":"Run the whole model. It runs the whole process from input data reading to result processing. For information about the switches, refer to the datastructure documentation.\n\n\n\n\n\n","category":"method"},{"location":"library/public/#GENeSYS_MOD.genesysmod_simple_dispatch-Tuple{}","page":"Public","title":"GENeSYS_MOD.genesysmod_simple_dispatch","text":"Run the simple dispatch model. A previous run is necessary to allow to read in investment  decisions. For information about the switches, refer to the datastructure documentation\n\n\n\n\n\n","category":"method"},{"location":"manual/quick-start/#Quick-Start","page":"Quick Start","title":"Quick Start","text":"","category":"section"},{"location":"manual/quick-start/#Installation","page":"Quick Start","title":"Installation","text":"","category":"section"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"1.\tWe suggest using Visual Studio Code.","category":"page"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"2.\tDownload the latest stable version of the Julia Programming Language (julialang.org).","category":"page"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"3.\tInstall Julia extension in Visual Studio Code:     a.\tClick 'Extensions' buttion in Visual Studio Code on the left ribbon.     b.\tSearch for 'Julia', then install. ","category":"page"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"4.\tDownload an optimization solver and get a license:     a.\tGurobi         i.\tAcademic licensed are issued by Gurobi.         ii. Commercial License.     b.\tCPLEX     c.\tHiGHS, open source solver.","category":"page"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"5.\tClone the GitHub repository for GENeSYS_MOD.jl     a.\tDownload git: Git - Downloads     b.\tNavigate to the folder where you want the repo to be located.     c. Open Git Bash by right clicking in the chosen folder and choosing \"Git Bash Here\"     d. Type the following command in Git Bash:","category":"page"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"```\ngit clone https://github.com/GENeSYS-MOD/GENeSYS_MOD.jl.git\ngit pull\n```","category":"page"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"6.\tOpen GENeSYS-MOD folder in Visual Studios     a.\tFile > Open folder","category":"page"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"7.\tChange to Julia environment for GENeSYS_MOD.jl.","category":"page"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"Open the Julia REPL by using the Alt+J+O command. The REPL(read-eval-print loop) is the interactive command line interface in Julia.","category":"page"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"9.\tInstall packages in Visual Studio:     a.\tIn the REPL terminal, type ']' to change to enter pkg mode     b. Type 'add <package>', where package is equal to:         i.\tJuMP         ii.\tDates         iii. XLSX         iv. DataFrames         v. CSV\t         vi. Ipopt         vii. <your chosen solver>","category":"page"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"10.\tOpen 'test.jl' and try to run using \"Julia: Execute active file in REPL\".","category":"page"},{"location":"manual/quick-start/#Using-the-published-dataset","page":"Quick Start","title":"Using the published dataset","text":"","category":"section"},{"location":"manual/quick-start/","page":"Quick Start","title":"Quick Start","text":"A dataset is published on the repository GENeSYS-MOD.data: (https://github.com/GENeSYS-MOD/GENeSYS_MOD.data) This repository contains the data including the sources and assumptions necessay to run the model at a european level with a country resolution. Data for over regions may be added with time.  It also conmtains the tools necessary to produce the input file for the model from this data. The tools are accessed via a jupyter notebook script. More information can be found on the repository.","category":"page"}]
}
