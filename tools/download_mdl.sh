#!/bin/bash

# Copyright  2020  ETRI (author: Hoon Chung)
# Apache 2.0

function download_mdl(){
  if [ ! -f $1/$2.zip ]; then
    if ! which wget >/dev/null; then
      echo "wget is not installed."
      exit 1
    fi
    echo "downloading data from $url."

    if ! wget -O $1/$2.zip --no-check-certificate $3; then
      echo "error executing wget $url"
      exit 1
    fi
  fi
}

dir="mdl"

if [ ! -d "$dir" ]; then
  mkdir -p $dir
fi

if [ ! -f $dir/zeroth_korean.zip ]; then
  download_mdl $dir "zeroth_korean" "https://zenodo.org/record/4014588/files/asr_train_asr_transformer5_raw_bpe_valid.acc.ave.zip?download=1"
fi

if [ ! -f $dir/clovalcall.zip ]; then
  download_mdl $dir "clovacall" "https://zenodo.org/record/4030061/files/asr_train_asr_transformer_ddp_raw_char_sp_valid.acc.ave.zip?download=1"
fi

if [ ! -f $dir/librispeech.zip ]; then
  download_mdl $dir "librispeech" "https://zenodo.org/record/4031916/files/asr_train_asr_transformer3_dist_raw_bpe_sp_valid.acc.ave.zip?download=1"
fi

if [ ! -f $dir/ksponspeech.zip ]; then
  download_mdl $dir "ksponspeech" "https://zenodo.org/record/4086352/files/asr_train_asr_transformer1_ddp_raw_bpe_valid.acc.ave.zip?download=1"
fi
