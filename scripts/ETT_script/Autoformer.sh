export CUDA_VISIBLE_DEVICES=0

for PRED_LEN in 24 48
do
  for FACTOR in 1 2 3
  do
    python -u run.py \
      --is_training 1 \
      --root_path ./dataset/ETT-small/ \
      --data_path ETTh2.csv \
      --model_id ETTh2_96_24 \
      --model Autoformer \
      --data ETTh2 \
      --features 'MS' \
      --seq_len 96 \
      --label_len 48 \
      --pred_len $PRED_LEN \
      --e_layers 1 \
      --d_layers 1 \
      --factor $FACTOR \
      --enc_in 7 \
      --dec_in 7 \
      --c_out 7 \
      --des "Exp_Autoformer_ETTh2_96_${PRED_LEN}_Factor_${FACTOR}" \
      --itr 1 \
      --tags "to-check-convergence"
    done
done
