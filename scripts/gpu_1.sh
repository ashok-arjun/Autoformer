export CUDA_VISIBLE_DEVICES=0

python -u run.py \
  --is_training 1 \
  --root_path ./dataset/windspeed/ \
  --data_path bahia_windspeed.csv \
  --model_id ETTm1_96_24 \
  --model Autoformer \
  --data Windspeed \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 24 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 9 \
  --dec_in 9 \
  --c_out 9 \
  --des 'Exp_Autoformer_ETTh2_96_24_25ep_lr1e-2_steplrs_dropout0.3_pat2' \
  --itr 1 \
  --target 'windspeed' \
  --learning_rate 1e-2 \
  --dropout 0.3 \
  --train_epochs 40 \
  --patience 10 \
  --step_lrs \
  --step_lrs_patience 2