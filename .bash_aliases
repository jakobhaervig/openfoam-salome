#function to create alias for Salome. Usage e.g. "salome /opt", which will look for the latest SALOME installation in /opt. Default is $HOME.

function salome_setup()
{
    local search_dir="${1:-$HOME}"
    local latest_dir

    # Find all SALOME-* directories, sort by version, pick the latest
    latest_dir=$(find "$search_dir" -maxdepth 1 -type d -name "SALOME-*" 2>/dev/null | sort -V | tail -n 1)

    if [[ -n "$latest_dir" && -x "$latest_dir/salome" ]]; then
        alias salome="$latest_dir/salome"
        echo "Alias 'salome' set to $latest_dir/salome"
    else
        echo "No SALOME installation found in $search_dir"
    fi
}