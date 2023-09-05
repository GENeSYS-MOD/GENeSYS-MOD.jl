# GENeSYS-MOD v3.1 [Global Energy System Model]  ~ March 2022
#
# #############################################################
#
# Copyright 2020 Technische Universität Berlin and DIW Berlin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# #############################################################

"""
InputClass - Abstract type for the inputs
"""
abstract type InputClass end

"""
All the parameters read for a model run

# Extended
# Fields
- **`StartYear ::Int64`** First year of the study horizon.\n
- **`YearSplit ::JuMP.Containers.DenseAxisArray`** Weighting factors of the each timeslice,
     i.e. how much of the whole year is represented by a given tiomeslice. \n 
- **`SpecifiedAnnualDemand ::JuMP.Containers.DenseAxisArray`** Total specified demand for a year.\n
- **`SpecifiedDemandProfile ::JuMP.Containers.DenseAxisArray`** Annual fraction of 
    energy-service or commodity demand that is required in each time slice. For each
    year, all the defined SpecifiedDemandProfile input values should sum up to 1.\n
- **`RateOfDemand ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`Demand ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`CapacityToActivityUnit ::JuMP.Containers.DenseAxisArray`** Conversion factor relating
    the energy that would be produced when one unit of capacity is fully used in one year.\n
- **`CapacityFactor ::JuMP.Containers.DenseAxisArray`** Capacity available per each
    TimeSlice expressed as a fraction of the total installed capacity, with values ranging
    from 0 to 1. It gives the possibility to account for forced outages or variable renewable generation. \n
- **`AvailabilityFactor ::JuMP.Containers.DenseAxisArray`** Maximum time a technology can
    run in the whole year, as a fraction of the year ranging from 0 to 1. It gives the
    possibility to account for planned outages.\n
- **`OperationalLife ::JuMP.Containers.DenseAxisArray`** Useful lifetime of a technology,
    expressed in years.\n
- **`ResidualCapacity ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`InputActivityRatio ::JuMP.Containers.DenseAxisArray`** Rate of use of a fuel by a
    technology, as a ratio of the rate of activity. Used to express technology efficiencies.\n
- **`OutputActivityRatio ::JuMP.Containers.DenseAxisArray`** Rate of fuel output from a
    technology, as a ratio of the rate of activity.\n
- **`CapacityOfOneTechnologyUnit ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`TagDispatchableTechnology ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`BaseYearProduction ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`RegionalBaseYearProduction ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`RegionalCCSLimit ::JuMP.Containers.DenseAxisArray`** Total amount of storeable emissions
    in a certain region over the entire modelled period.\n
- **`CapitalCost ::JuMP.Containers.DenseAxisArray`** Capital investment cost of a technology,
    per unit of capacity.\n
- **`VariableCost ::JuMP.Containers.DenseAxisArray`** Cost of a technology for a given mode
    of operation (e.g., Variable O&M cost, fuel costs, etc.), per unit of activity.\n
- **`FixedCost ::JuMP.Containers.DenseAxisArray`** Fixed O&M cost of a technology, per unit
    of capacity.\n
- **`StorageLevelStart ::JuMP.Containers.DenseAxisArray`** Level of storage at the beginning
    of first modelled year, in units of activity.\n
- **`StorageMaxChargeRate ::JuMP.Containers.DenseAxisArray`** Maximum charging rate for the 
    storage, in units of activity per year.\n
- **`StorageMaxDischargeRate ::JuMP.Containers.DenseAxisArray`** Maximum discharging rate for
    the storage, in units of activity per year.\n
- **`MinStorageCharge ::JuMP.Containers.DenseAxisArray`** Sets a lower bound to the amount
    of energy stored, as a fraction of the maximum, with a number ranging between 0 and 1.
    The storage facility cannot be emptied below this level.\n
- **`OperationalLifeStorage ::JuMP.Containers.DenseAxisArray`** Useful lifetime of the
    storage facility.\n
- **`CapitalCostStorage ::JuMP.Containers.DenseAxisArray`** Binary parameter linking a 
    technology to the storage facility it charges. It has value 0 if the technology and the
    storage facility are not linked, 1 if they are.\n
- **`ResidualStorageCapacity ::JuMP.Containers.DenseAxisArray`** Binary parameter linking a
    storage facility to the technology it feeds. It has value 0 if the technology and the
    storage facility are not linked, 1 if they are.\n
- **`TechnologyToStorage ::JuMP.Containers.DenseAxisArray`** Binary parameter linking a 
    technology to the storage facility it charges. It has value 1 if the technology and the
    storage facility are linked, 0 otherwise.\n
- **`TechnologyFromStorage ::JuMP.Containers.DenseAxisArray`** Binary parameter linking a
    storage facility to the technology it feeds. It has value 1 if the technology and the
    storage facility are linked, 0 otherwise.\n
- **`StorageMaxCapacity ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`TotalAnnualMaxCapacity ::JuMP.Containers.DenseAxisArray`** Total maximum existing 
    (residual plus cumulatively installed) capacity allowed for a technology in a specified
    year.\n
- **`TotalAnnualMinCapacity ::JuMP.Containers.DenseAxisArray`** Total minimum existing 
    (residual plus cumulatively installed) capacity allowed for a technology in a specified
    year.\n
- **`TagTechnologyToSector ::JuMP.Containers.DenseAxisArray`** Links technologies to sectors. \n
- **`AnnualSectoralEmissionLimit ::JuMP.Containers.DenseAxisArray`** Annual upper limit for
    a specific emission generated in a certain sector for the whole modelled region.\n
- **`TotalAnnualMaxCapacityInvestment ::JuMP.Containers.DenseAxisArray`** Maximum capacity of
    a technology, expressed in power units.\n
- **`TotalAnnualMinCapacityInvestment ::JuMP.Containers.DenseAxisArray`** Minimum capacity of
    a technology, expressed in power units.\n
- **`TotalTechnologyAnnualActivityUpperLimit ::JuMP.Containers.DenseAxisArray`** Total maximum
    level of activity allowed for a technology in one year.\n
- **`TotalTechnologyAnnualActivityLowerLimit ::JuMP.Containers.DenseAxisArray`** Total minimum 
    level of activity allowed for a technology in one year.\n
- **`TotalTechnologyModelPeriodActivityUpperLimit ::JuMP.Containers.DenseAxisArray`** Total 
    maximum level of activity allowed for a technology in the entire modelled period.\n
- **`TotalTechnologyModelPeriodActivityLowerLimit ::JuMP.Containers.DenseAxisArray`** Total 
    minimum level of activity allowed for a technology in the entire modelled period.\n
- **`ReserveMarginTagTechnology ::JuMP.Containers.DenseAxisArray`** Binary parameter tagging
    the technologies that are allowed to contribute to the reserve margin. It has value 1 
    for the technologies allowed, 0 otherwise.\n
- **`ReserveMarginTagFuel ::JuMP.Containers.DenseAxisArray`** Binary parameter tagging the
    fuels to which the reserve margin applies. It has value 1 if the reserve margin applies
    to the fuel, 0 otherwise.\n
- **`ReserveMargin ::JuMP.Containers.DenseAxisArray`** Minimum level of the reserve margin
    required to be provided for all the tagged commodities, by the tagged technologies. 
    If no reserve margin is required, the parameter will have value 1; if, for instance, 20%
    reserve margin is required, the parameter will have value 1.2.\n
- **`RETagTechnology ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`RETagFuel ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`REMinProductionTarget ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`EmissionActivityRatio ::JuMP.Containers.DenseAxisArray`** Emission factor of a 
    technology per unit of activity, per mode of operation.\n
- **`EmissionContentPerFuel ::JuMP.Containers.DenseAxisArray`** Defines the emission contents 
    per fuel.\n
- **`EmissionsPenalty ::JuMP.Containers.DenseAxisArray`** Monetary penalty per unit of emission.\n
- **`EmissionsPenaltyTagTechnology ::JuMP.Containers.DenseAxisArray`** Activates or deactivates
    emission penalties for specific technologies.\n
- **`AnnualExogenousEmission ::JuMP.Containers.DenseAxisArray`** Additional annual emissions,
    on top of those computed endogenously by the model.\n
- **`AnnualEmissionLimit ::JuMP.Containers.DenseAxisArray`** Annual upper limit for a specific
    emission generated in the whole modelled region.\n
- **`RegionalAnnualEmissionLimit ::JuMP.Containers.DenseAxisArray`** Annual upper limit for
    a specific emission generated in a certain modelled region.\n
- **`ModelPeriodExogenousEmission ::JuMP.Containers.DenseAxisArray`** Additional emissions 
    over the entire modelled period, on top of those computed endogenously by the model.\n
- **`ModelPeriodEmissionLimit ::JuMP.Containers.DenseAxisArray`** Total model period upper 
    limit for a specific emission generated in the whole modelled region.\n
- **`RegionalModelPeriodEmissionLimit ::JuMP.Containers.DenseAxisArray`** Total model period
    upper limit for a specific emission generated in a certain modelled region.\n
- **`CurtailmentCostFactor ::JuMP.Containers.DenseAxisArray`** Costs per curtailed unit of
    activity for certain fuels and years.\n
- **`TradeRoute ::JuMP.Containers.DenseAxisArray`** Sets the distance in km from one region
    to another. Also controls the ability to trade on fuel from a region to another.\n
- **`TradeCosts ::JuMP.Containers.DenseAxisArray`** Costs for trading one unit of energy from
    one region to another.\n
- **`TradeLossFactor ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`TradeRouteInstalledCapacity ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`TradeLossBetweenRegions ::JuMP.Containers.DenseAxisArray`** Percentage loss of traded 
    fuel from one region to another. Used to model losses in power transmission networks.\n
- **`AdditionalTradeCapacity ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`TradeCapacity ::JuMP.Containers.DenseAxisArray`** Initial capacity for trading fuels 
    from one region to another.\n
- **`TradeCapacityGrowthCosts ::JuMP.Containers.DenseAxisArray`** Costs for adding one unit 
    of additional trade capacity per km from one region to another.\n
- **`GrowthRateTradeCapacity ::JuMP.Containers.DenseAxisArray`** Upper limit for adding 
    additional trade capacities. Given as maximal percentage increase of installed capacity.\n
- **`SelfSufficiency ::JuMP.Containers.DenseAxisArray`** Lower bound that limits the imports 
    of fuels in as specific year and region.\n
- **`RampingUpFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** Defines how much of 
    the built capacity can be activated each timeslice.\n
- **`RampingDownFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** Defines how much 
    of the built capacity can be deactivated each timeslice.\n
- **`ProductionChangeCost ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** Cost per unit 
    of activated or deactivated capacity per timeslice.\n
- **`MinActiveProductionPerTimeslice ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** 
    Minimum fuel production from specific technologies in a certain timeslice. Represents 
    minimum active capacity requirements.\n
- **`ModalSplitByFuelAndModalType ::JuMP.Containers.DenseAxisArray`** Lower bound of 
    production of certain fuels by specific modal types.\n
- **`TagTechnologyToModalType ::JuMP.Containers.DenseAxisArray`** Links technology production 
    by mode of operation to modal stype.\n
- **`EFactorConstruction ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** \n #TODO
- **`EFactorOM ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** \n #TODO
- **`EFactorManufacturing ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** \n #TODO
- **`EFactorFuelSupply ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** \n #TODO
- **`EFactorCoalJobs ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** \n #TODO
- **`CoalSupply ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** \n #TODO
- **`CoalDigging ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** \n #TODO
- **`RegionalAdjustmentFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** \n #TODO
- **`LocalManufacturingFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** \n #TODO
- **`DeclineRate ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** \n #TODO
- **`x_peakingDemand ::Union{Nothing,JuMP.Containers.DenseAxisArray}`** \n #TODO
- **`TagDemandFuelToSector ::JuMP.Containers.DenseAxisArray`** \n #TODO
- **`TagElectricTechnology ::JuMP.Containers.DenseAxisArray`** \n #TODO
"""
struct Parameters <: InputClass
    StartYear ::Int64
    YearSplit ::JuMP.Containers.DenseAxisArray

    SpecifiedAnnualDemand ::JuMP.Containers.DenseAxisArray
    SpecifiedDemandProfile ::JuMP.Containers.DenseAxisArray
    RateOfDemand ::JuMP.Containers.DenseAxisArray
    Demand ::JuMP.Containers.DenseAxisArray

    CapacityToActivityUnit ::JuMP.Containers.DenseAxisArray
    CapacityFactor ::JuMP.Containers.DenseAxisArray
    AvailabilityFactor ::JuMP.Containers.DenseAxisArray
    OperationalLife ::JuMP.Containers.DenseAxisArray
    ResidualCapacity ::JuMP.Containers.DenseAxisArray
    InputActivityRatio ::JuMP.Containers.DenseAxisArray
    OutputActivityRatio ::JuMP.Containers.DenseAxisArray
    CapacityOfOneTechnologyUnit ::JuMP.Containers.DenseAxisArray
    TagDispatchableTechnology ::JuMP.Containers.DenseAxisArray
    BaseYearProduction ::JuMP.Containers.DenseAxisArray
    RegionalBaseYearProduction ::JuMP.Containers.DenseAxisArray

    RegionalCCSLimit ::JuMP.Containers.DenseAxisArray

    CapitalCost ::JuMP.Containers.DenseAxisArray
    VariableCost ::JuMP.Containers.DenseAxisArray
    FixedCost ::JuMP.Containers.DenseAxisArray

    StorageLevelStart ::JuMP.Containers.DenseAxisArray
    StorageMaxChargeRate ::JuMP.Containers.DenseAxisArray
    StorageMaxDischargeRate ::JuMP.Containers.DenseAxisArray
    MinStorageCharge ::JuMP.Containers.DenseAxisArray
    OperationalLifeStorage ::JuMP.Containers.DenseAxisArray
    CapitalCostStorage ::JuMP.Containers.DenseAxisArray
    ResidualStorageCapacity ::JuMP.Containers.DenseAxisArray
    TechnologyToStorage ::JuMP.Containers.DenseAxisArray
    TechnologyFromStorage ::JuMP.Containers.DenseAxisArray

    StorageMaxCapacity ::JuMP.Containers.DenseAxisArray

    TotalAnnualMaxCapacity ::JuMP.Containers.DenseAxisArray
    TotalAnnualMinCapacity ::JuMP.Containers.DenseAxisArray

    TagTechnologyToSector ::JuMP.Containers.DenseAxisArray
    AnnualSectoralEmissionLimit ::JuMP.Containers.DenseAxisArray

    TotalAnnualMaxCapacityInvestment ::JuMP.Containers.DenseAxisArray
    TotalAnnualMinCapacityInvestment ::JuMP.Containers.DenseAxisArray

    TotalTechnologyAnnualActivityUpperLimit ::JuMP.Containers.DenseAxisArray
    TotalTechnologyAnnualActivityLowerLimit ::JuMP.Containers.DenseAxisArray
    TotalTechnologyModelPeriodActivityUpperLimit ::JuMP.Containers.DenseAxisArray
    TotalTechnologyModelPeriodActivityLowerLimit ::JuMP.Containers.DenseAxisArray

    ReserveMarginTagTechnology ::JuMP.Containers.DenseAxisArray
    ReserveMarginTagFuel ::JuMP.Containers.DenseAxisArray
    ReserveMargin ::JuMP.Containers.DenseAxisArray

    RETagTechnology ::JuMP.Containers.DenseAxisArray
    RETagFuel ::JuMP.Containers.DenseAxisArray
    REMinProductionTarget ::JuMP.Containers.DenseAxisArray

    EmissionActivityRatio ::JuMP.Containers.DenseAxisArray
    EmissionContentPerFuel ::JuMP.Containers.DenseAxisArray
    EmissionsPenalty ::JuMP.Containers.DenseAxisArray
    EmissionsPenaltyTagTechnology ::JuMP.Containers.DenseAxisArray
    AnnualExogenousEmission ::JuMP.Containers.DenseAxisArray
    AnnualEmissionLimit ::JuMP.Containers.DenseAxisArray
    RegionalAnnualEmissionLimit ::JuMP.Containers.DenseAxisArray
    ModelPeriodExogenousEmission ::JuMP.Containers.DenseAxisArray
    ModelPeriodEmissionLimit ::JuMP.Containers.DenseAxisArray
    RegionalModelPeriodEmissionLimit ::JuMP.Containers.DenseAxisArray
    CurtailmentCostFactor ::JuMP.Containers.DenseAxisArray

    TradeRoute ::JuMP.Containers.DenseAxisArray
    TradeCosts ::JuMP.Containers.DenseAxisArray
    TradeLossFactor ::JuMP.Containers.DenseAxisArray
    TradeRouteInstalledCapacity ::JuMP.Containers.DenseAxisArray
    TradeLossBetweenRegions ::JuMP.Containers.DenseAxisArray


    AdditionalTradeCapacity ::JuMP.Containers.DenseAxisArray
    TradeCapacity ::JuMP.Containers.DenseAxisArray
    TradeCapacityGrowthCosts ::JuMP.Containers.DenseAxisArray
    GrowthRateTradeCapacity ::JuMP.Containers.DenseAxisArray

    SelfSufficiency ::JuMP.Containers.DenseAxisArray

    RampingUpFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    RampingDownFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    ProductionChangeCost ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    MinActiveProductionPerTimeslice ::Union{Nothing,JuMP.Containers.DenseAxisArray}

    ModalSplitByFuelAndModalType ::JuMP.Containers.DenseAxisArray
    TagTechnologyToModalType ::JuMP.Containers.DenseAxisArray

    EFactorConstruction ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    EFactorOM ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    EFactorManufacturing ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    EFactorFuelSupply ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    EFactorCoalJobs ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    CoalSupply ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    CoalDigging ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    RegionalAdjustmentFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    LocalManufacturingFactor ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    DeclineRate ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    x_peakingDemand ::Union{Nothing,JuMP.Containers.DenseAxisArray}
    
    TagDemandFuelToSector ::JuMP.Containers.DenseAxisArray
    TagElectricTechnology ::JuMP.Containers.DenseAxisArray
end

struct Settings <: InputClass
    DepreciationMethod ::JuMP.Containers.DenseAxisArray
    GeneralDiscountRate ::JuMP.Containers.DenseAxisArray
    TechnologyDiscountRate ::JuMP.Containers.DenseAxisArray
    SocialDiscountRate ::JuMP.Containers.DenseAxisArray
    DaysInDayType ::Float64
    InvestmentLimit ::Float64
    NewRESCapacity ::Float64
    ProductionGrowthLimit ::JuMP.Containers.DenseAxisArray
    StorageLimitOffset  ::Float64
    Trajectory2020UpperLimit ::Float64
    Trajectory2020LowerLimit ::Float64
    BaseYearSlack ::JuMP.Containers.DenseAxisArray
    PhaseIn ::Dict
    PhaseOut ::Dict
end 

struct Sets <: InputClass
    Timeslice_full ::Array
    DailyTimeBracket ::Array
    Year_full ::Array
    Emission ::Array
    Technology ::Array
    Fuel ::Array
    Year ::Array
    Timeslice ::Array
    Mode_of_operation ::Array
    Region_full ::Array
    Season ::Array
    Daytype ::Array
    Storage ::Array
    ModalType ::Array
    Sector ::Array
end

struct Emp_Sets <: InputClass
    Technology ::Union{Nothing,Array}
    Year ::Union{Nothing,Array}
    Region ::Union{Nothing,Array}
end

struct SubsetsIni <: InputClass
    Solar ::Array
    Wind ::Array
    Renewables ::Array
    CCS ::Array
    Transformation ::Array
    RenewableTransformation ::Array
    FossilFuelGeneration ::Array 
    FossilFuels ::Array
    FossilPower ::Array
    CHPs ::Array
    RenewableTransport ::Array
    Transport ::Array
    Passenger ::Array
    Freight ::Array
    TransportFuels ::Array 
    ImportTechnology ::Array
    Heat ::Array
    PowerSupply ::Array
    PowerBiomass ::Array
    Coal ::Array
    Lignite ::Array
    Gas ::Array
    StorageDummies ::Array
    SectorCoupling ::Array 
    HeatFuels ::Array
    ModalGroups ::Array
    PhaseInSet ::Array
    PhaseOutSet ::Array
    HeatSlowRamper ::Array
    HeatQuickRamper ::Array
    Hydro ::Array
    Geothermal ::Array
    Onshore ::Array 
    Offshore ::Array
    SolarUtility ::Array
    Oil ::Array
    HeatLowRes ::Array
    HeatLowInd ::Array
    HeatMedInd ::Array
    HeatHighInd ::Array
    Biomass ::Array
    Households ::Array
    Companies ::Array
    HydrogenTechnologies ::Array
    DummyTechnology ::Array
end

struct Switch <: InputClass
    StartYear :: Int16
    switch_only_load_gdx ::Int8
    switch_test_data_load ::Int8
    solver 
    DNLPsolver
    model_region ::String
    data_base_region ::String
    data_file ::String
    timeseries_data_file ::String
    threads ::Int16
    emissionPathway ::String
    emissionScenario ::String
    socialdiscountrate ::Float64
    inputdir ::String
    tempdir ::String
    resultdir ::String
    switch_infeasibility_tech :: Int8
    switch_investLimit ::Int16
    switch_ccs ::Int16
    switch_ramping ::Int16
    switch_weighted_emissions ::Int16
    switch_intertemporal ::Int16
    switch_base_year_bounds ::Int16
    switch_peaking_capacity ::Int16
    set_peaking_slack ::Float16
    set_peaking_minrun_share ::Float16
    set_peaking_res_cf ::Float16
    set_peaking_startyear ::Int16
    switch_peaking_with_storages ::Int16
    switch_peaking_with_trade ::Int16
    switch_peaking_minrun ::Int16
    switch_employment_calculation ::Int16
    switch_endogenous_employment ::Int16
    employment_data_file ::String
    switch_dispatch ::Int8
    hourly_data_file ::String
    elmod_nthhour ::Int16
    elmod_starthour ::Int16
    elmod_dunkelflaute ::Int16
    elmod_daystep ::Int16
    elmod_hourstep ::Int16
    switch_raw_results ::Int8
    switch_processed_results ::Int8
    write_reduced_timeserie ::Int8

end

struct Variable_Parameters <: InputClass
    RateOfTotalActivity ::JuMP.Containers.DenseAxisArray
    RateOfProductionByTechnologyByMode ::JuMP.Containers.DenseAxisArray
    RateOfUseByTechnologyByMode ::JuMP.Containers.DenseAxisArray
    RateOfProductionByTechnology ::JuMP.Containers.DenseAxisArray
    RateOfUseByTechnology ::JuMP.Containers.DenseAxisArray
    ProductionByTechnology ::JuMP.Containers.DenseAxisArray
    UseByTechnology ::JuMP.Containers.DenseAxisArray
    RateOfProduction ::JuMP.Containers.DenseAxisArray
    RateOfUse ::JuMP.Containers.DenseAxisArray
    Production ::JuMP.Containers.DenseAxisArray
    Use ::JuMP.Containers.DenseAxisArray
    ProductionAnnual ::JuMP.Containers.DenseAxisArray
    UseAnnual ::JuMP.Containers.DenseAxisArray
end