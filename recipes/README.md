# ESPnet2 Recipes

You can download reproducible recipes and pre-trained models for some well-known open speech datasets.

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
|ClovaCall-Base(R)|11.6||https://github.com/hchung12/espnet/tree/egs2/ClovaCall/egs2/ClovaCall/asr1|
