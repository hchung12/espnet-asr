# espnet-asr
*espnet-asr* is an End-to-end Automatic Speech Recognition (ASR) system using [ESPnet](https://github.com/espnet/espnet).

End-to-end ASR systems are reported to outperform conventional approaches.
However, it is not simple to train robust end-to-end ASR models and make recognition efficient.

In this project, we provide an easy-to-use inference code, pre-trained models, and training recipes to handle these problems.

The pre-trained models are tuned to achieve competitive performance for each dataset at the time of release, and an intuitive inference code is provided for easy evaluation.

## 1. Installation
To run the end-to-end ASR examples, you must install [PyTorch](https://pytorch.org/) and [ESPnet](https://github.com/espnet/espnet).
We recommend you to use virtual environment created by [conda](https://docs.conda.io/en/latest/miniconda.html).

```conda create -n ESPnet python=3```

```conda activate ESPnet```

If you have GPUs, install the GPU version of PyTorch. Otherwise, install the CPU version of PyTorch as follows.

```(ESPnet) conda install pytorch torchvision cpuonly -c pytorch```

Then, install ESPnet.

```(ESPnet) pip install espnet```


## 2. Downloading pre-trained models
You can download pre-trained models for Zeroth-Korean, ClovaCall, KSponSpeech and Librispeech datasets. You can check the performance of the pre-trained models [here](https://github.com/hchung12/espnet-asr/tree/master/recipes).

```(ESPnet) tools/download_mdl.sh```

## 3. Decoding
Inference is simple. For example, to recognize utterances listed in *evalset/zeroth_korean/data/wav.scp* using the model, *mdl/zeroth_korean.zip*, pre-trained for Zeroth-Korean dataset with decoding options in *conf/decode_asr.yaml*, run the following command.

```(ESPnet) python3 bin/asr_inference.py --mdl mdl/zeroth_korean.zip --wav_scp evalset/zeroth_korean/data/wav.scp --config conf/decode_asr.yaml --output_dir output/zeroth_korean```

If it causes errors such as "ModuleNotFoundError: No module named 'espnet'", you must use python instead of python3 as follows:

```(ESPnet) python bin/asr_inference.py --mdl mdl/zeroth_korean.zip --wav_scp evalset/zeroth_korean/data/wav.scp --config conf/decode_asr.yaml --output_dir output/zeroth_korean```

You can check the recognition result.

```
(ESPnet) cat output/zeroth_korean/1best_recog/text 
104_003_0019 지난해 삼 월 김 전 장관의 동료 인 장동 련 홍익대 교수가 민간 자문단 장으로 위촉 되면서 본격적인 공모 와 개발 작업에 들어갔다
104_003_0193 그 바람 에 나 의 몸 도 겹쳐 쓰러지 며 한창 피어난 노란 동백꽃 속으로 폭 파묻혀 버렸다
104_003_0253 현재 백화점과 영화관 등 은 오픈 해 영업 하고 있고 테마파크 및 아파트 등 의 공사는 이천 십 팔 년 완공 을 목표로 진행돼 왔다
...
```
## 4. Fast Decoding
Recognition latency can be reduced by changing decoding options, but it can hurt recognition performance.

```(ESPnet) python3 bin/asr_inference.py --mdl mdl/zeroth_korean.zip --wav_scp evalset/zeroth_korean/data/wav.scp --config conf/fast_decode_asr.yaml --output_dir output/zeroth_korean```

## 5. Other pre-trained models
#### 5.1 KsponSpeech
You can evaluate KsponSpeech samples by running the following commands.

```(ESPnet) python3 bin/asr_inference.py --mdl mdl/ksponspeech.zip --wav_scp evalset/ksponspeech/data/wav.scp --config conf/decode_asr.yaml --output_dir output/ksponspeech```

You can use the conf/fast_decode_asr_ksponspeech.yaml for fast decoding.

```(ESPnet) python3 bin/asr_inference.py --mdl mdl/ksponspeech.zip --wav_scp evalset/ksponspeech/data/wav.scp --config conf/fast_decode_asr_ksponspeech.yaml --output_dir output/fast_ksponspeech```

#### 5.2 ClovaCall
Redistribution of ClovaCall dataset is prohibited. You can download the ClovaCall dataset from the [page](https://docs.google.com/forms/d/e/1FAIpQLSf5bm7FtWYeZf8C02mlyZCg32yMrA9_DgKU17oD0migPkEXog/viewform)

#### 5.3 Librispeech
You can evaluate Librispeech samples by running the following commands.

```(ESPnet) python3 bin/asr_inference.py --mdl mdl/librispeech.zip --wav_scp evalset/librispeech/data/wav.scp --config conf/decode_asr.yaml --output_dir output/librispeech```
Or
```(ESPnet) python3 bin/asr_inference.py --mdl mdl/librispeech.zip --wav_scp evalset/librispeech/data/wav.scp --config conf/fast_decode_asr.yaml --output_dir output/librispeech```

#### 5.4 ESPnet Model Zoo
You can get more information for pre-trained models in [ESPnet model zoo](https://github.com/espnet/espnet_model_zoo)

## 6. Limitations
* Voice activity detection (VAD) is not supported : Speech utterances must be segemented for correct evaluation.

## 7. Inference testing on YouTube data
To perform inference testing on YouTube data, you need to install youtube-dl and sox as follows.

```(ESPnet) conda install -c conda-forge youtube-dl```

```(ESPnet) yum install sox```

You can use "tools/recog_youtube.sh" to do inference testing. "tools/recog_youtube.sh" extracts audio stream from a given YouTube URL, splits the audio file into multiple files of 5 seconds in length, and then run the inference program for each segmented file.
For example, to recognize audio stream in "https://www.youtube.com/watch?v=foLYddwKDcs&ab_channel=KBSNews", you can run the following command.

```(ESPnet) tools/recog_youtube.sh --url foLYddwKDcs --download-dir download/foLYddwKDcs```

The command downloads audio from YouTube URL "foLYddwKDcs" to "download/foLYddwKDcs" directory, and run "bin/asr_inference.py" using "mdl/ksponspeech.zip" model.
You can check the recognition result.
```
(ESPnet) cat output/foLYddwKDcs/1best_recog/text 
foLYddwKDcs001 아 정부는 이번 주말이 중대 분기점이 들 거라면서 주말 상황을 지켜본
foLYddwKDcs002 그게 거리 두 개 3단계 격상력으로 결정하겠다고 했습니다 또 방역에 힘을 모아주
foLYddwKDcs003 어 될 수 있으면 집에 머물러 줄 것을 겉음료증 있습니다 안다 연계잡니다
foLYddwKDcs004 정부네는 사회적 벌이 둘이 3단계 격상을
foLYddwKDcs005 배우에 보루라고 보고 있습니다 1월 판단을 중대 분기점이 성탄절 
...
```

To run only inference step, run the script with "--stage" set to 2.

```tools/recog_youtube.sh --stage 2 --url foLYddwKDcs --download-dir download/foLYddwKDcs --mdl mdl/ksponspeech.zip --config conf/fast_decode_asr_ksponspeech.yaml --output output/foLYddwKDcs```


## Contact
Feel free to ask any questions to hchung@etri.re.kr or requests to issues.
