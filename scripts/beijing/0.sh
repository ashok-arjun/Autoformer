export CUDA_VISIBLE_DEVICES=0

for FACTOR in 3 2 1 4
do
  for SEQ_LEN in 96 192
  do
    for E_LAYERS in 2 1
    do
      for D_LAYERS in 3 2 1
      do
        for PRED_LEN in 24
        do
          python -u run.py \
            --is_training 1 \
            --root_path ./dataset/beijing/ \
            --data_path Changping_PM2.5.csv \
            --model_id "Autoformer_Seq_${SEQ_LEN}_Pred_${PRED_LEN}_Factor_${FACTOR}_ELayers_${E_LAYERS}_DLayers_${D_LAYERS}" \
            --model Autoformer \
            --data custom \
            --features 'MS' \
            --seq_len $SEQ_LEN \
            --target 'PM2.5' \
            --label_len 48 \
            --pred_len $PRED_LEN \
            --e_layers $E_LAYERS \
            --d_layers $D_LAYERS \
            --factor $FACTOR \
            --enc_in 6 \
            --dec_in 6 \
            --c_out 1 \
            --des "Autoformer_Seq_${SEQ_LEN}_Pred_${PRED_LEN}_Factor_${FACTOR}_ELayers_${E_LAYERS}_DLayers_${D_LAYERS}" \
            --itr 1 \
            --tags "paper" \
            --train_epochs 100 \
            --learning_rate 1e-4 \
            --patience 5
        done
      done
    done
  done
done
