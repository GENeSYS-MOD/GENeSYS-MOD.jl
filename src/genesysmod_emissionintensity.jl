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

function genesysmod_emissionintensity(model, Sets, Subsets, Params, VarPar, TierFive, LoopSetOutput, LoopSetInput)
    SectorEmissions = JuMP.Containers.DenseAxisArray(zeros(length(Sets.Year),length(Sets.Region_full),length(Sets.Fuel),length(Sets.Emission)), Sets.Year, Sets.Region_full, Sets.Fuel, Sets.Emission)
    EmissionIntensity = JuMP.Containers.DenseAxisArray(zeros(length(Sets.Year),length(Sets.Region_full),length(Sets.Fuel),length(Sets.Emission)), Sets.Year, Sets.Region_full, Sets.Fuel, Sets.Emission)
    #output_emissionintensity;

    for y ∈ Sets.Year for r ∈ Sets.Region_full for e ∈ Sets.Emission
        SectorEmissions[y,r,"Power",e] =  sum(value(model[:AnnualTechnologyEmissionByMode][y,t,e,m,r])*Params.OutputActivityRatio[r,t,"Power",m,y] for (t,m) ∈ LoopSetOutput[(r,"Power",y)])

        for f ∈ TierFive
            SectorEmissions[y,r,f,e] = sum(value(model[:AnnualTechnologyEmissionByMode][y,t,e,m,r])*Params.OutputActivityRatio[r,t,f,m,y] for (t,m) ∈ LoopSetOutput[(r,f,y)])
            EmissionIntensity[y,r,f,e] = SectorEmissions[y,r,f,e]/VarPar.ProductionAnnual[y,f,r]
        end

        EmissionIntensity[y,r,"Power",e] = SectorEmissions[y,r,"Power",e]/sum(value(model[:ProductionByTechnologyAnnual][y,t,"Power",r]) for t ∈ Sets.Technology if Params.TagTechnologyToSector[t,"Storages"] == 0)
    
    end end end

    return SectorEmissions, EmissionIntensity
end

