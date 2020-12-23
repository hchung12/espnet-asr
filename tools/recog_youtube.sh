#!/bin/bash

# Copyright  2020  ETRI (author: Hoon Chung)
# Apache 2.0

log() {
  local fname=${BASH_SOURCE[1]##*/}
  echo -e "$(date '+%Y-%m-%dT%H:%M:%S') (${fname}:${BASH_LINENO[0]}:${FUNCNAME[1]}) $*"
}

download_dir=download
length=5
url=
mdl=mdl/ksponspeech.zip
config=conf/decode_asr.yaml
output=output

stage=1
stop_stage=100

help_message=$(cat << EOF
Usage: $0 --download-dir "<download_dir_name>" --url "<youtube_url>" --length "<length>" \
--mdl "<mdl_name>" --config "<cfg_name>" --output "<output_dir_name>"

Options:
  # General configuration
  --download_dir      # Download dir (default="${download_dir}").
  --length            # Split length (default="${length}").
  --url               # Youtube URL.
  --mdl               # Inference model file (default="${mdl}").
  --config            # Inference config file (default="${config}").
  --output            # Inference output director (default="${output}").
  --stage             # 
  --stop_stage        #
EOF
)

log "$0 $*"

. utils/parse_options.sh

if [ $# -ne 0 ]; then 
  log "${help_message}"
  log "Error: No positional arguments are required."
  exit 2
fi

[ -z "${url}" ] && { log "${help_message}"; log "Error: --url is required"; exit 2; };
[ -z "${length}" ] && { log "${help_message}"; log "Error: --length is required"; exit 2; };
[ -z "${mdl}" ] && { log "${help_message}"; log "Error: --mdl is required"; exit 2; };

split_dir=${download_dir}/split
wav_scp=${download_dir}/wav.scp

[ ! -d ${split_dir} ] && mkdir -p ${split_dir}

if [ ${stage} -le 1 ] && [ ${stop_stage} -ge 1 ]; then

  [[ -f "${wav_scp}" ]] && rm ${wav_scp}

  youtube-dl --extract-audio --audio-format wav -o "${download_dir}/${url}.%(ext)s" "${url}"
  sox -t wav "${download_dir}/${url}.wav" -r 16000 -t wav -c 1 "${split_dir}/${url}.wav" trim 0 ${length}  : newfile : restart

  for wav_file in $(find -L $split_dir -iname "*.wav" | sort); do
    key=$(basename "${wav_file%.*}")
    echo "$key $wav_file" >> $wav_scp
  done  
fi

if [ ${stage} -le 2 ] && [ ${stop_stage} -ge 2 ]; then
  python3 bin/asr_inference.py \
    --mdl ${mdl} \
    --wav_scp ${wav_scp} \
    --config ${config} \
    --output_dir ${output}/${url}
fi
