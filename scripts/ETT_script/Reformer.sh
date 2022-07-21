export CUDA_VISIBLE_DEVICES=0

# Later: Replace with 
# --root_path ./dataset/windspeed/ \
# --data_path bahia_windspeed.csv \

for PRED_LEN in 24 48 96
do
  # python -u run.py \
  #   --is_training 1 \
  # --root_path ./dataset/ETT-small/ \
  # --data_path ETTh2.csv \
  #   --model_id windspeed_96_$PRED_LEN \
  #   --model Reformer \
  #   --data Windspeed \
  #   --features 'MS' \
  #   --seq_len 96 \
  #   --label_len 48 \
  #   --pred_len $PRED_LEN \
  #   --e_layers 2 \
  #   --d_layers 1 \
  #   --factor 3 \
  #   --enc_in 9 \
  #   --dec_in 9 \
  #   --c_out 1 \
  #   --des "Exp_Reformer_ETTh2_96_${PRED_LEN}_40ep_lr1e-4" \
  #   --itr 1 \
  #   # --target 'windspeed' \
  #   --train_epochs 40 \
  #   --learning_rate 1e-4 \
  #   --patience 5 \
  #   --step_lrs \
  #   --step_lrs_patience 2

  python -u run.py \
    --is_training 1 \
    --root_path ./dataset/ETT-small/ \
    --data_path ETTh2.csv \
    --model_id ETTh2_96_24 \
    --model Reformer \
    --data ETTh2 \
    --features 'M' \
    --seq_len 96 \
    --label_len 48 \
    --pred_len $PRED_LEN \
    --e_layers 2 \
    --d_layers 1 \
    --factor 3 \
    --enc_in 7 \
    --dec_in 7 \
    --c_out 7 \
    --des "Exp_Reformer_ETTh2_96_${PRED_LEN}" \
    --itr 1 \
    --tags "to-check-convergence"
done

for PRED_LEN in 24 48 96
do
  # python -u run.py \
  #   --is_training 1 \
  # --root_path ./dataset/ETT-small/ \
  # --data_path ETTh2.csv \
  #   --model_id windspeed_96_$PRED_LEN \
  #   --model Reformer \
  #   --data Windspeed \
  #   --features 'M' \
  #   --seq_len 96 \
  #   --label_len 48 \
  #   --pred_len $PRED_LEN \
  #   --e_layers 2 \
  #   --d_layers 1 \
  #   --factor 3 \
  #   --enc_in 9 \
  #   --dec_in 9 \
  #   --c_out 9 \
  #   --des "Exp_Reformer_ETTh2_96_${PRED_LEN}_40ep_lr1e-4" \
  #   --itr 1 \
  #   # --target 'windspeed' \
  #   --train_epochs 40 \
  #   --learning_rate 1e-4 \
  #   --patience 5 \
  #   --step_lrs \
  #   --step_lrs_patience 2

  python -u run.py \
    --is_training 1 \
    --root_path ./dataset/ETT-small/ \
    --data_path ETTh2.csv \
    --model_id ETTh2_96_24 \
    --model Reformer \
    --data ETTh2 \
    --features 'MS' \
    --seq_len 96 \
    --label_len 48 \
    --pred_len $PRED_LEN \
    --e_layers 2 \
    --d_layers 1 \
    --factor 3 \
    --enc_in 7 \
    --dec_in 7 \
    --c_out 7 \
    --des "Exp_Reformer_ETTh2_96_${PRED_LEN}" \
    --itr 1 \
    --tags "to-check-convergence"
done
