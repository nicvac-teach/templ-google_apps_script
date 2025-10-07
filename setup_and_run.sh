#!/bin/bash
set -e

################
# Setup 
#
# NOTA!!! più progetti Apps Script possono essere sincronizzati contemporaneamente.
# Basta eseguire un clasp clone per ogni progetto Apps Script da sincronizzare
# Puoi farlo da terminale, non necessariamente eseguendo questo script.
#
# Nome del progetto da sincronizzare, già esistente su Apps script
prjDir="Archivio_cdc"
# Id del progetto: Apps script / {progetto} / Impostazioni progetto / ID script / Copia
prjID="1poOQ88rBYcHSmdQ8AB87coKtE3GxInRoPZ_sJf_AySuGktr8E8FTeKwP"
################

if ! which clasp &> /dev/null; then
    sudo npm install -g @google/clasp
    npm install --save-dev @types/google-apps-script
fi

#Login dell'utente Apps script che ha il progetto da sincronizzare
# Dopo l'autorizzazione la pagina risponde "This site can't be reached". Copia l'url di quella pagina e
# incollala sullo stdin di clasp login (in attesa di questo input).
if ! clasp list &> /dev/null; then
    clasp login --no-localhost
fi

# Creo la dir di progetto e la sincronizza con Apps script in remoto
mkdir -p "${prjDir}"

# Clona il progetto Apps script in locale.
# Puoi clonarne più di uno in diverse directory
if [ -z "$(ls -A ${prjDir})" ]; then
    clasp clone "${prjID}" --rootDir "${prjDir}"
fi

# Rimane in esecuzione ed esegue il push verso Apps script ad ogni modifica locale.
clasp push -w
