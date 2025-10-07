#!/bin/bash

################
# Setup 
# Nome del progetto da sincronizzare, già esistente su Apps script
prjDir = "Archivio_cdc"
# Id del progetto: Apps script / {progetto} / Impostazioni progetto / ID script / Copia
prjID = "1poOQ88rBYcHSmdQ8AB87coKtE3GxInRoPZ_sJf_AySuGktr8E8FTeKwP"
################

if ! which clasp &> /dev/null; then
    sudo npm install -g @google/clasp
fi

#Login dell'utente Apps script che ha il progetto da sincronizzare
clasp login


# Creo la dir di progetto e la sincronizza con Apps script in remoto
mkdir -p "${prjDir}"

clasp clone "${prjID}" --rootDir "${prjDir}"



