# ESPnet2 Recipes

You can download reproducible recipes and pre-trained models for open speech datasets.

### 1. Zeroth-Korean Dataset

[Zeroth-Korean](https://github.com/goodatlas/zeroth) is free Korean speech
corpus distributed by Atlas Labs. The dataset can be downloaded from openslr: http://www.openslr.org/40.   

|Dataset|WER(%)|Model|Recipe|
|----------------|---|---|---|
|Zeroth-Korean|2.0|[download](https://zenodo.org/record/4014588#.X1WCHPIzZ5E)|https://github.com/hchung12/espnet/tree/egs2/zeroth_korean/egs2/zeroth_korean/asr1|

### 2. ClovaCall Dataset
 
[ClovaCall](https://github.com/clovaai/ClovaCall) is a large-scale Korean call-based speech corpus under a goal-oriented
dialog scenario from more than 11,000 people distributed by NAVER. 
The raw dataset of ClovaCall includes approximately 112,000 pairs of a short sentence and 
its corresponding spoken utterance in a restaurant reservation domain. ClovaCall-Base(R) dataset can be download from [Clova AI](https://github.com/clovaai/ClovaCall).   

|Dataset|ClovaCall only CER(%)|Model|Recipe|
|----------------|--------|---|---|
|ClovaCall-Base(R)|11.6|[download](https://zenodo.org/record/4030061/files/asr_train_asr_transformer_ddp_raw_char_sp_valid.acc.ave.zip?download=1)|https://github.com/hchung12/espnet/tree/egs2/ClovaCall/egs2/ClovaCall/asr1|

### 3. KsponSpeech Dataset
 
[KsponSpeech](https://www.aihub.or.kr/aidata/105) is a large-scale spontaneous speech corpus of Korean
corpus. It contains 969 h of general open-domain dialog utterances, spoken by about 2000 native
Korean speakers in a clean environment.   

|Dataset|WER(%)|Model|Recipe|
|----------------|---|---|---|
|eval_clean|20.9|[download](https://zenodo.org/record/4086352/files/asr_train_asr_transformer1_ddp_raw_bpe_valid.acc.ave.zip?download=1)||
|eval_other|25.2|[download](https://zenodo.org/record/4086352/files/asr_train_asr_transformer1_ddp_raw_bpe_valid.acc.ave.zip?download=1)||

