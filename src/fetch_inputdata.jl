Conda.add(["pandas","openpyxl"]; satisfied_skip_solve=true) # Add the package and skip if it is already installed

"""
    update_and_process_data(; settings_file=nothing, scenario_option="Europe_openENTRANCE_technoFriendly",
                            datadir=nothing, resultdir=nothing, output_format="long", processing_option="both")

Fetches the latest changes from the GENeSYS_MOD.data repository, merges them, and processes the data using a Python function.

# Arguments
- `settings_file::Union{String, Nothing}`: Absolute path to the settings file. If `nothing`, defaults to "Set_filter_file.xlsx" in the current directory.
- `scenario_option::String`: Scenario option for the processing function. Default is "Europe_openENTRANCE_technoFriendly".
- `datadir::Union{String, Nothing}`: Directory of the data repository. If `nothing`, defaults to "GENeSYS_MOD.data" in the current directory.
- `resultdir::Union{String, Nothing}`: Directory to save the output files. If `nothing`, the files are not moved and can be found in GENeSYS_MOD.data/Output.
- `output_format::String`: Format of the output data, "long" or "wide". Default is "long".
- `processing_option::String`: Specifies what data to process. Options are "parameters_only", "timeseries_only", or "both". Default is "both".

# Returns
- `result::Bool`: `true` if the process completes successfully.

# Description
1. Fetches the latest changes from the `GENeSYS_MOD.data` repository.
2. Attempts to merge the changes up to 3 times.
3. Calls the Python `master_function` to process the data.
4. Moves the output files to the specified `resultdir` if provided and based on the `processing_option`.
5. Returns `true` if the process completes successfully.

# Example
```julia
result = update_and_process_data(settings_file="path/to/Set_filter_file.xlsx", scenario_option="Test_Scenario",
                                 datadir="path/to/data", resultdir="path/to/save", output_format="wide",
                                 processing_option="parameters_only")
```
"""
function update_and_process_data(;settings_file = nothing, scenario_option = "Europe_openENTRANCE_technoFriendly",
     datadir = nothing, resultdir = nothing, output_format = "long", processing_option = "both")
    # Pull latest changes
    if isnothing(datadir)
        start_dir = pwd()
        repo_dir = joinpath(pwd(),"GENeSYS_MOD.data")
        cd(repo_dir)
        println("Using present data directory")
    else
        start_dir = datadir
        repo_dir = start_dir
        cd(start_dir)
        println("Using data directory: $datadir")
    end

    repo = LibGit2.GitRepo(repo_dir)
    println("Fetch Successful")
    LibGit2.fetch(repo)
    limit = 3
    for i in 1:limit
        try
            LibGit2.merge!(repo)
            println("Merge Successful")
            break
        catch e
            if i != limit
                println("Retrying... ($i/$limit)")
                sleep(3)
            else
                println(e)
                println("Merge Failed! Continuing without merging.")
            end
        end
    end

    # Call Python processing function
    py"""
import sys
import os
from pathlib import Path
import subprocess

cwd = Path(os.getcwd())
script_path = str(cwd/'Conversion Script')
if script_path not in sys.path:
    sys.path.append(script_path)

from functions.function_import import master_function
    """
    cd(joinpath(pwd(), "Conversion Script"))
    master_function = pyimport("functions.function_import").master_function

    output_file_format = "excel"
    if isnothing(settings_file)
        settings_file = joinpath(pwd(),"Set_filter_file.xlsx")
    end

    result = master_function(settings_file,output_file_format, output_format, processing_option, scenario_option)

    _time = Dates.format(now(), "dd_mm_yyyy_THHMM")
    if !isnothing(resultdir)
        if processing_option ∈ ["parameters_only", "both"]
            mv(joinpath("..","Output","output_excel","RegularParameters_$scenario_option.xlsx"),
            joinpath(resultdir,"RegularParameters_$(scenario_option)_$(_time).xlsx"))
        end
        if processing_option ∈ ["timeseries_only", "both"]
            mv(joinpath("..","Output","output_excel","Timeseries_$scenario_option.xlsx"),
            joinpath(resultdir,"Timeseries_$(scenario_option)_$(_time).xlsx"))
        end
    end

    cd(start_dir)
    return true
end
