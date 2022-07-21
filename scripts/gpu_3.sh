export CUDA_VISIBLE_DEVICES=0

for PRED_LEN in 24
do
  for E_LAYERS in 3
  do
    for D_LAYERS in 1 2 3
    do
      for FACTOR in 1 2 3
      do
        python -u run.py \
          --is_training 1 \
          --root_path ./dataset/windspeed/ \
          --data_path bahia_windspeed.csv \
          --model_id windspeed_96_24 \
          --model Autoformer \
          --data Windspeed \
          --features 'MS' \
          --seq_len 96 \
          --target 'windspeed' \
          --label_len 48 \
          --pred_len $PRED_LEN \
          --e_layers $E_LAYERS \
          --d_layers $D_LAYERS \
          --factor $FACTOR \
          --enc_in 9 \
          --dec_in 9 \
          --c_out 1 \
          --des "Exp_Autoformer_windspeed_96_${PRED_LEN}_Factor_${FACTOR}_ELayers_${E_LAYERS}_DLayers_${D_LAYERS}" \
          --itr 1 \
          --tags "to-check-convergence" \
          --train_epochs 40 \
          --learning_rate 1e-4 \
          --patience 5
      done
    done
  done
done
