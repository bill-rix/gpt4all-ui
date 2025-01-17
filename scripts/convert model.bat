@echo off
@echo off
set filename=../models/ggml-alpaca-7b-q4.bin
set newname=../models/ggml-alpaca-7b-q4.bin.original

echo %modelPath%
echo Converting the model to the new format...
if not exist tmp\llama.cpp git clone https://github.com/ggerganov/llama.cpp.git tmp\llama.cpp
cd tmp\llama.cpp
git checkout 6c248707f51c8a50f7792e7f7787ec481881db88
cd ../..
pwd
move /y "%filename%" "%filename%.original"
echo Converting ...
python tmp\llama.cpp\migrate-ggml-2023-03-30-pr613.py "%newname%" "%filename%"