export CUDA_VISIBLE_DEVICES=0

for PRED_LEN in 24
do
  for E_LAYERS in 1
  do
    for D_LAYERS in 1 2 3
    do
      for FACTOR in 1 2 3
      do
        python -u run.py \
          --is_training 1 \
          --root_path ./dataset/ETT-small/ \
          --data_path ETTh2.csv \
          --model_id ETTh2_96_24 \
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
          --enc_in 7 \
          --dec_in 7 \
          --c_out 7 \
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

# export CUDA_VISIBLE_DEVICES=0

# # Later: Replace with 
# # --root_path ./dataset/windspeed/ \
# # --data_path bahia_windspeed.csv \

# for PRED_LEN in 24 48 96
# do
#   # python -u run.py \
#   #   --is_training 1 \
#   # --root_path ./dataset/ETT-small/ \
#   # --data_path ETTh2.csv \
#   #   --model_id windspeed_96_$PRED_LEN \
#   #   --model Informer \
#   #   --data Windspeed \
#   #   --features 'MS' \
#   #   --seq_len 96 \
#   #   --label_len 48 \
#   #   --pred_len $PRED_LEN \
#   #   --e_layers 2 \
#   #   --d_layers 1 \
#   #   --factor 3 \
#   #   --enc_in 9 \
#   #   --dec_in 9 \
#   #   --c_out 1 \
#   #   --des "Exp_Informer_ETTh2_96_${PRED_LEN}_40ep_lr1e-4" \
#   #   --itr 1 \
#   #   # --target 'windspeed' \
#   #   --train_epochs 40 \
#   #   --learning_rate 1e-4 \
#   #   --patience 5 \
#   #   --step_lrs \
#   #   --step_lrs_patience 2

#   python -u run.py \
#     --is_training 1 \
#     --root_path ./dataset/ETT-small/ \
#     --data_path ETTh2.csv \
#     --model_id ETTh2_96_24 \
#     --model Informer \
#     --data ETTh2 \
#     --features 'M' \
#     --seq_len 96 \
#     --label_len 48 \
#     --pred_len $PRED_LEN \
#     --e_layers 2 \
#     --d_layers 1 \
#     --factor 3 \
#     --enc_in 7 \
#     --dec_in 7 \
#     --c_out 7 \
#     --des "Exp_Informer_ETTh2_96_${PRED_LEN}" \
#     --itr 1 \
#     --tags "to-check-convergence"
# done

# for PRED_LEN in 24 48 96
# do
#   # python -u run.py \
#   #   --is_training 1 \
#   # --root_path ./dataset/ETT-small/ \
#   # --data_path ETTh2.csv \
#   #   --model_id windspeed_96_$PRED_LEN \
#   #   --model Informer \
#   #   --data Windspeed \
#   #   --features 'M' \
#   #   --seq_len 96 \
#   #   --label_len 48 \
#   #   --pred_len $PRED_LEN \
#   #   --e_layers 2 \
#   #   --d_layers 1 \
#   #   --factor 3 \
#   #   --enc_in 9 \
#   #   --dec_in 9 \
#   #   --c_out 9 \
#   #   --des "Exp_Informer_ETTh2_96_${PRED_LEN}_40ep_lr1e-4" \
#   #   --itr 1 \
#   #   # --target 'windspeed' \
#   #   --train_epochs 40 \
#   #   --learning_rate 1e-4 \
#   #   --patience 5 \
#   #   --step_lrs \
#   #   --step_lrs_patience 2

#   python -u run.py \
#     --is_training 1 \
#     --root_path ./dataset/ETT-small/ \
#     --data_path ETTh2.csv \
#     --model_id ETTh2_96_24 \
#     --model Informer \
#     --data ETTh2 \
#     --features 'MS' \
#     --seq_len 96 \
#     --label_len 48 \
#     --pred_len $PRED_LEN \
#     --e_layers 2 \
#     --d_layers 1 \
#     --factor 3 \
#     --enc_in 7 \
#     --dec_in 7 \
#     --c_out 7 \
#     --des "Exp_Informer_ETTh2_96_${PRED_LEN}" \
#     --itr 1 \
#     --tags "to-check-convergence"
# done
