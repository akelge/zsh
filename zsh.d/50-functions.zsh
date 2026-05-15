#######################################################################################
# Optimized Functions & Modules
#######################################################################################

zmodload -F zsh/stat b:zstat
zmodload zsh/datetime

# 1. Prepare (but don't execute) modules
autoload -Uz add-zsh-hook vcs_info async

# 2. Autoload your custom library
# Ensure $LIBRARY is correctly defined before this point!
autoload -U $LIBRARY/zshfunctions/*(.:t)

# 3. Callback: what to do when fetch finishes
git_callback() {
    zle reset-prompt
}

# 4. Initialization: This is where we fix the "command not found"
init_vcs_worker() {
    # If async_start_worker doesn't exist, we need to initialize the library
    if ! (( $+functions[async_start_worker] )); then
        async  # This loads the actual async functions into memory
    fi

    # Initialize the async engine if it hasn't been already
    async_init 2>/dev/null 

    async_start_worker vcs_info -u -n
    async_register_callback vcs_info git_callback
}

# 5. Fast Check: Use Zsh builtins instead of 'date' (No shell forks!)
should_fetch() {
    local last_fetch_file=".git/FETCH_HEAD"
    [[ ! -f "$last_fetch_file" ]] && return 0
    
    local last_mod
    # zstat is much faster than the external 'date' command
    zstat -A last_mod +mtime "$last_fetch_file" 2>/dev/null || return 0
    
    local diff=$(( EPOCHSECONDS - last_mod ))
    local threshold=$(( ${FETCH_INTERVAL_MIN:-5} * 60 ))

    (( diff > threshold ))
}

# 6. Core Function
check_git_status_async() {
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        if should_fetch; then
            # Attempt to run the job; if it fails (worker not started), init it
            if ! async_job vcs_info "git fetch --quiet" 2>/dev/null; then
                init_vcs_worker
                async_job vcs_info "git fetch --quiet"
            fi
        fi
    fi
}

# 7. Hook
add-zsh-hook chpwd check_git_status_async
