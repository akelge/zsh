#######################################################################################
# Functions
#
#
#
#
# Load usefule modules

zmodload -F zsh/stat b:zstat
zmodload zsh/datetime
#
# Autoload all functions in zshfunctions
#
autoload -U $LIBRARY/zshfunctions/*(.:t)

# Add zsh-hook function
autoload -Uz add-zsh-hook

# Add async support
autoload -Uz async && async

# Async Git update
autoload -Uz vcs_info

# 2. Callback: cosa fare quando il fetch finisce
git_callback() {
    # Aggiorna il prompt solo dopo che il fetch è terminato
    # Ricarica vcs_info o il tuo sistema di prompt
    # vcs_info 2>/dev/null
    zle reset-prompt
}

# 3. Funzione di inizializzazione worker
init_vcs_worker() {
    # -n: crea solo se non esiste
    # -u: permette l'invio di job unici (evita sovrapposizioni)
    async_start_worker vcs_info -u -n
    async_register_callback vcs_info git_callback
}

# 2. Funzione per verificare se è necessario il fetch
should_fetch() {
    local last_fetch_file=".git/FETCH_HEAD"
    
    # Se il file non esiste (mai fatto fetch), procedi
    [[ ! -f "$last_fetch_file" ]] && return 0
    
    # Calcola la differenza in secondi (5 min = 300 sec)
    local last_mod=$(date -r "$last_fetch_file" +%s)
    local now=$(date +%s)
    local diff=$(( now - last_mod ))
    local threshold=$(( FETCH_INTERVAL_MIN * 60 ))

    if [[ $diff -gt $threshold ]]; then
        return 0 # È passato abbastanza tempo
    else
        return 1 # Troppo presto
    fi
}

# 3. Funzione Core aggiornata
check_git_status_async() {
    # Verifica se siamo in un git repo
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        
        # Controlla il timer prima di stressare il worker
        if should_fetch; then
            # Se il worker è morto, lo riavviamo
            if ! async_job vcs_info "git fetch --quiet" 2>/dev/null; then
                init_vcs_worker
                async_job vcs_info "git fetch --quiet"
            fi
        fi
    fi
}

# 5. Hook: Esegui la funzione ogni volta che cambi directory
autoload -Uz add-zsh-hook
add-zsh-hook chpwd check_git_status_async
