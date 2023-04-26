gpu=$1
for lang_abr in as bn gom gu hi kn ks mai ml mr ne or pa sa sd si ta te ur
do
source_lang=en
target_lang=$lang_abr
CUDA_VISIBLE_DEVICES=$gpu fairseq-generate ../corpus-bin \
  --path ../transformer/fr_multi_SWE/checkpoint_best.pt \
  --task translation_multi_simple_epoch \
  --gen-subset test \
  --beam 4 \
  --nbest 4 \
  --source-lang $source_lang \
  --target-lang $target_lang \
  --batch-size 4096 \
  --encoder-langtok "tgt" \
  --lang-dict lang_list.txt \
  --num-workers 64 \
  --lang-pairs en-as,en-bn,en-gom,en-gu,en-hi,en-kn,en-ks,en-mai,en-ml,en-mr,en-ne,en-or,en-pa,en-sa,en-sd,en-si,en-ta,en-te,en-ur  > ../output/${source_lang}_${target_lang}.txt
done
